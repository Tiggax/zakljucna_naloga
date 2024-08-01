#import "../additional.typ": todo

#import "@preview/cetz:0.2.2": canvas, plot, draw, vector

#import "@preview/oxifmt:0.2.1": strfmt

#let get_plot(target) = {
  let plots = csv(target + ".csv", row-type: dictionary).map(
  ((minutes, volume, vcd,glutamin,glucose,DO,c_O2,oxygen,product)) => (
    minutes: float(minutes), 
    volume: float(volume),
    vcd: float(vcd),
    glutamin: float(glutamin),
    glucose: float(glucose),
    DO: float(DO),
    cO2: float(c_O2),
    oxygen: float(oxygen),
    product: float(product),
  ))
  
  
  canvas(
    length: 1cm,
    {
      plot.plot(
        size: (16,10),
        legend: "legend.inner-north-west",
        x-label: "days",
        y-label: "values",
        x-format: x => {
          let min = x
          let days = calc.floor(x / (60 * 24))
          [#days]
        },
        {
          plot.add(
            label: "volume",
            plots.map(x => (x.minutes, x.volume)),
          )
          plot.add(
            label: "VCD",
            plots.map(x => (x.minutes, x.vcd)),
          )
          plot.add(
            label: "glutamin",
            plots.map(x => (x.minutes, x.glutamin)),
          )
          plot.add(
            label: "glucose",
            plots.map(x => (x.minutes, x.glucose)),
          )
          plot.add(
            label: "DO",
            plots.map(x => (x.minutes, x.DO)),
          )
          plot.add(
            label: "PID",
            plots.map(x => (x.minutes, x.oxygen)),
          )
          plot.add(
            label: "product",
            plots.map(x => (x.minutes, x.product)),
          )
        }
      )
    }
  )
}

#let cnt = 0

#let results(target) = {
  return (plot: get_plot(target), const_table: get_table(target))
}


#let line(key, val, depth) ={
  
  let t = "min"
  let vals = (
    mu_max: $"MVC"/("ml" #t)$,
    power_input: $W / m^3$,
    ks_glucose: $g/L$,
    ks_glutamine: $g/L$,
    
    n_vcd: none,
    day: $"day"$,
    product: $(m g)/("MVC" #t)$,
    k_glucose: $"MVC"/#t$,
    k_glutamine: $"MVC"/#t$,
    kP: none,
    kDO: $"mol"/ L$,
    cell_metabolism: $"mol"/("cell" #t)$,
    air_flow: $L / #t$,
    henry: $"mol" / ("bar" L)$,
    minimum: $%$,
    fi_oxygen_max: $L / #t$,
    max_flow: $L / #t$,
    volume: $L$,
    vcd: [$(M V C) / (m L)$ #footnote[Million Viable Cells per $m L$]],
    glucose: $g/L$,
    glutamine: $g/L$,
    oxygen_part: $%$,
    start: $d a y$,
    rate: [$(%"IWV")/"day"$ #footnote[% Initial Working Volume per day]],
  )
  
  if type(val) == float {
    ((
      table.cell(key.replace("_", " "),fill: aqua.transparentize(80%)),
      table.cell([#val], colspan: depth - 1, align: right ),
      table.cell(vals.at(key,default: [TODO: add unit]), inset: .6em)
      
    ),)
  } else {
    let height = val.values().map(x => if type(x) == float {1} else {x.len()}).sum()

    
    (
      table.cell(key.replace("_", " "), rowspan: height, fill: aqua.transparentize(60%)),
      for ((k,v)) in val {
        line(k,v,depth - 1)
      }
    )
  }
}

#let constants(name) = {

  let values = json("/data/" + name + ".json")

  let a = for ((k,v)) in values {
    line(k,v,4)
  }
  
  table(
    columns: 5 ,
    ..a.flatten()
  )
}

#constants("default")


#let diff(a,b) = {
  if type(a) == float {
    if a != b {
      return a
    }
  } else {
    let out = (:)
    for ((k,v)) in a {
      let res = diff(v,b.at(k))
      if res != none {
        out.insert(k, res)
      }
    }
    return if out != (:) { out }
  }
}

#let constants_diff(name) = {
  let default = json("/data/default.json")
  let values =  json("/data/" + name + ".json")

  let out = (:)
  for ((k,v)) in values {
    let res = diff(v, default.at(k))
    if res != none {
      out.insert(k, res)
    }
  }
  
  let a = for ((k,v)) in out {
    line(k,v,4)
  }

  table(
    columns: 5 ,
    ..a.flatten()
  )
}