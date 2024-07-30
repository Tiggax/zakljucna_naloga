#set heading(offset: 1)
#import "/src/additional.typ": todo
#import "@preview/sourcerer:0.2.1": code
#import "@preview/oxifmt:0.2.1": strfmt


In order to model the bioreactor a system of @ODE was created.
An application (discussed further in @app-sec) was built for calculations of the system of @ODE used to model the bioreactor.

= Data of a bioreactor process

Data for bioreactor model fitting was randomly generated from data points in approximate industrial bioreactor processes.
The Dataset can be seen in @data_figure.

#figure(
  caption: [data, consisting of different values, and points of no known data.],
  table(
    columns: 6,
    fill: (x,y) => if y == 0 {color.mix(teal, white)
  },
    table.header(
      [days], [VCD], [glutamin], [glucose],[$"DO"_50$], [product]
    ),
    ..csv("/podatki/data.csv").slice(1).flatten().map(x => [#strfmt("{:.7}",x)])
    
  )
)<data_figure>


= The System of ordinary differential equations

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
$n_"VCD"$ is a production phase growth constant.
This constant changes on the day that the Temperature shift occurs.
$mu$ is calculated with
$
mu = mu_"max" * (c_"gluc" / ("Ks"_"gluc" + c_"gluc")) * (c_"glut" / ("Ks"_"glut" + c_"glut")) * (c_"O2" / ("Ks"_"O2" + c_"O2"))
$
where $mu_"max"$ is a constant that varies from different strand of @CHO cells.
This constant is then multiplied with each of the dependant variables using Monod kinetics talked about in @monod_sec. 

== Glucose and glutamin

#let cgk = $c$

Glucose and glutamine follow simple negative value dependant on 

$
#d(cgk) = - k_#cgk * "VCD" * (#cgk / ( "Ks"_#cgk + #cgk))
$

where $#cgk$ is the concentration of the substance, and $k_#cgk$ is the depletion constant, while the $"Ks"_#cgk$ is the half-saturation constant.

== Oxygen

=== PID control

For oxygen control a theoretical controller similar to one written about in @pid_sec was used.
For control only the proportional part was used.
The model is one dimensional and describes an ideally mixed fed-batch bioreactor, which means that the response of the regulation is fast and the proportional part of the @PID regulator is sufficient of efficient regulation.

#let x = $c_(O_2)$

#todo[ henry odvisen od temperatire, vendar zamerljivo veliko]
#todo[ pre h = 1.55 post h = 1.6]

vann't hoff enačba za henry



$
"OUR"#footnote[Oxygen Uptake Rate] = c_"vcd" * V * k_m
$
where $c_"vcd"$ is the density of Viable cells


$
"OTR"#footnote[Oxygen Transfer Rate] = "kLa" * (c_(O_2)^* - c_(O_2))
$
where $c_(O_2)^*$ is the equilibrium oxygen concentration and $c_(O_2)$ is the current oxygen concentration.

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

== Totalna bilanca

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


The system was defined with constants seen in @constants. It should be assumed, that any omitted values will be as in @constants.

#import "/src/figures/mod.typ": constants_fig

#figure(
  caption: [Default constants of the system],
  constants_fig("default")
)<constants>




= the Application<app-sec>



The application was built in the Rust programing language and built using community packages seen in @deps. 
@ODE were computed using a modified version of `ode_solvers` package.
The package changed the provided `y` values of each iteration to become mutable, meaning the values of any current step could be modified.
This was made so that the @PID controller values could reflect the current output of each step.
Dependencies `serde`, `serde_json` and `csv` were used for data serialization.
This was used to ease the injection of data, the system values and to be able to save the results of the minimization.

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

@UI was implemented using the `egui` library, separating the space into two parts as seen in @bion-app.
Left pane was used to control the model, while the right side showed a graph of the individual values over the period of the process.
Each of the values could be individually inspected to see their change of values, and the graph could be zoomed in to see changes in detail.
Left pane contained four sections.
The general settings, where the model could be reset, loaded from a `json`, or loaded to the previous instance.
The simulation parameters, where all of the parameters of the system could be modified to manually tweak the system.
Data control section where data points for fitting could be loaded in using a `csv` file or cleared.
This section also included a button to save the result of the system exported as a `csv` file, with a `json` file with the same name generating alongside with the state of the system.

Finally the minimization section contained two sub-sections.
First section named the minimization target offered a selection of the target value to be minimized, with choices being $mu_"max"$, `n_vcd`, feed rate, PID control oxygen absorption constant (`constants.oxygen`), and constants of product, glutamine and glucose.
Second section contained selection of which data to use as minimization evaluation.
The first option `Mixed` used all point nodes of the data, to try to fit the system optimally, while using only one of the other options minimized the system using only the nodes of that values.
Finally the button "Minimize" ran the minimization process with the system values.

#figure(
  caption: [Image of the application interface],
  image("/figures/bion-app.png")
)<bion-app>
#todo[update app image]