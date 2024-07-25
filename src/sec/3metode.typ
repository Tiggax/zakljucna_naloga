#set heading(offset: 1)
#import "/src/additional.typ": todo
#import "@preview/sourcerer:0.2.1": code
#import "@preview/oxifmt:0.2.1": strfmt

For testing dummy data was used seen in @data_figure


#figure(
  caption: [dummy data, consisting of different values, and points of no known data.],
  table(
    columns: 6,
    fill: (x,y) => if y == 0 {color.mix(teal, white)
  },
    table.header(
      [days], [VCD], [glutamin], [glucose],[$"DO"_50$], [product]
    ),
    ..csv("/data/dummy-data.csv").slice(1).flatten().map(x => [#strfmt("{:.7}",x)])
    
  )
)<data_figure>





#todo[
  kaj se je delalo, kako, kateri parametri, kateri programi, i.t.d.
]

The system was built in the Rust programing language and built using comunity packages seen in @deps. @UI was implemented using the `egui` library.
Solutions to @ODE were solved using a modified version of `ode_solvers` package.
`serde`, `serde_json` and `csv` were used for data serialization.
#todo[je kaj v tej smeri vredu?]

#let deps = toml("/data/Cargo.toml")

#figure(
  caption: [Cargo Dependencies used and their versions],
  table(
    columns: 2,
    fill: (x,y) => if y == 0 {color.mix(teal, white)},
    table.header(
      [Library],[Version],
    ),
    ..deps.dependencies.pairs().map(((name, version)) => (
      [#name],if type(version) == str {[#version]} else if "version" in version.keys(){[#version.version]} else {[#version.git<#version.branch>]}
    )).flatten(),
  )
)<deps>




= System

#let d(n) = $d(#n)/(d t)$


The system was implemented as a `system` function for `ode_solvers` library to use.
For it to work it needed to implement the "`ode_solvers::System<Time, State>`" seen in @trait.
The value `Time` was expressed in a 64 bit float,  and the `State` was an `SVector` of length 7 for each of the variables expressed as 64 bit float values.


#let snippet = raw(read("/data/model.rs"), lang: "Rust")
#figure(
  caption: [Trait implementation for the system],
  kind: image,
  code(snippet, lines: (236,236), )
)<trait>

== Viable Cell density

Viable cell density or @VCD, expresses the number of viable cells in the reactor.
It is expressed as $10^6 "Cell/mL"$ where the only living cells are counted.
The model assumes that viability is 90%, this meaning that 90% of cells in the bioreactor are alive at every increment.
In the model the value is calculated with
$
#d("VCD") = mu dot n_"VCD" dot "VCD"
$
$n_"VCD"$ is a temperature growth constant.
This constant changes on the day that the Temperature shift occurs.
$mu$ is calculated with
$
mu = mu_"max" * (c_"gluc" / ("ks"_"gluc" + c_"gluc")) * (c_"glut" / ("ks"_"glut" + c_"glut")) * (c_"O2" / ("ks"_"O2" + c_"O2"))
$
where $mu_"max"$ is a constant that varies from different strand of @CHO cells.
This constant is then multiplied with each of the dependant variables using Monod kinetics talked about in @monod_sec. 

== Glucose and glutamin

#let cgk = $k$

Glucose and glutamine follow simple negative value dependant on 

$
#d(cgk) = - k_#cgk * "VCD" * (#cgk / ( "ks"_#cgk + #cgk))
$

where $#cgk$ is the concentration of the substance, and $k_#cgk$ is the #todo[depletion?] constant.





#todo[
  napiš:
  - enačbe
    - in masne bilance
  - v uvod teorijo za vsakega od teh
    - numerične metode
    - metode končnih razlik
    - reševanje sistemov ODE
    - teorija LSODA, RK45
    - cho celice
    - bioreaktor
]

Vrednosti:

- koncentracije $"mol"/L$
- biomasa
  - VCD ~= TCD
  - viability =+ 90% -> model assumptions
- feed rate
  - $L/"min"$
- volume
  - $L$
- kinetične konstante:
  - na število celic


== Oxygen

#let x = $c_(O_2)$



#figure(
  table(
    columns: 2,
    [Vrednosti],[pomen],
    $Phi_"vph"$,[pretok vpihavanja z zrakom],
    $Phi_"pure"$,[pretok vpihavanja s čistim kisikom],
    $Phi_"total"$,[pretok čistega kisika],
  ),
  caption: [Given model values]
)


$
"OUR" = n_"vcd" × 1.9444exp-10 × 60 [ "mol" / ("cel" × "min")]
$

$
Phi_"pure" = cases(
  cases(
    ("mv" × Phi_(O_2)_"max") / 1000\; Phi_"pure" < Phi_"flow"_"max",
    Phi_"flow"_"max"\; Phi_"pure" >= Phi_"flow"_"max"
  )\; "DO"_"error" > 0,
  0\; "DO"_"error" <= 0
)
$

$
Phi_(O_2) = Phi_"vpihavanje" × 0.21 + Phi_"pure"\
Phi_"total" = Phi_"vpihavanje" + Phi_"pure"\
x(O_2) = Phi_(O_2) / Phi_"total"\
p_(O_2) = x_(O_2) * 1 "bar"\
c_(O_2)^* = "He" × p_(O_2)
$

$
"OTR" = k_("La") × (c_(O_2)^* - c_(O_2))
$


$
#d($#x$) = - "OUR" + "OTR"
$

= Totalna bilanca

Total bilance gets applied only after  days bigger than `FEED_MIN`.
and contains:

$
Phi_% = Phi_V / V
$

$
#d($V$) = phi_V
$

$
#d("VCD") -=  x_"VCD" times phi_%
$

$
#d(cgk) += 
$


The system was defined with constants seen in @constants. It should be assumed, that any omitted values will be as in @constants. #todo[a je bolš da je tabela kot priloga?]

#import "/src/figures/mod.typ": constants_fig

#figure(
  caption: [Default constants of the system],
  constants_fig("default")
)<constants>



