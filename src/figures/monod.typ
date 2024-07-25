#import "../additional.typ": todo

#import "@preview/cetz:0.2.2": canvas, plot, draw, vector

#let example = canvas(
  length: 1cm,
  {
    plot.plot(
      size: (12,8),
      axes: ($S$,$mu(S)$),
      legend: "legend.inner-south-east",
      
      x-label: $S$,
      y-label: $mu(S)$,
      y-max: 1,
      {
        for k in (0.1,0.5,1.0,1.5) {
          plot.add(
            domain: (0,10),
            samples: 1000,
            label: $K_S = #k$,
            x => (x / (k + x))
          )
        }
      }
    )
     
  }
)

#let function(k: 1, mu_max: 1)  = canvas(
  length: 1cm,
  plot.plot(
    size: (12,8),
    y-max: 1.2,
    x-min: 0,
    x-label: $S$,
    x-tick-step: none,
    y-label: $mu(S)$,
    y-tick-step: none,

    {
      plot.add(
        domain: (0,4),
        samples: 100,
        x => (x / (k + x))
      )
      //plot.add-vline(k, style: (stroke: (dash: "dashed", paint: blue)))

      plot.add-hline(mu_max, style: (stroke: (dash: "dashed", paint: red)))
      plot.annotate({
        import draw: *
        line((0,mu_max/2), (k,mu_max/2), stroke: (dash: "dashed"), name: "fn")
        line((k,mu_max/2), (k,0), stroke: (dash: "dashed", paint: green), name: "ks")

        content((2, mu_max + 0.05), text(fill: red)[$mu_"max"$])
        
        content((v => vector.add(v, (0,0.05)), "fn.mid"),text(size: 0.8em, fill: black)[$mu(K_S) = mu_"max" / 2$])
        content((v => vector.add(v, (0.2,)), "ks.mid"),text(fill: green)[$K_S$])
      })
    }
  )
)