#import "@preview/cetz:0.2.2": canvas, plot, draw, vector

#let reactor = canvas(
  length: 1cm,
  {
    import draw: *


    let mesalo(pos, shift: 0deg)= group(
      {
        set-origin(pos)
        for x in (1,2,3) {
          group(
            {
              rotate(y: x * 120deg + shift, x: 60deg)
              rect((0.1,-1), (1,1), fill: teal, stroke: .2pt)
            }
          )
        }  
      }
    )

    rect((),(5,10), radius: 2, name: "canister")
        group(
      {
        
        let substrate = green.transparentize(60%)
        let pos = (2.5,6.5)
        stroke(none)
        fill(substrate)
        rect((rel: (-2.5,-6.5), to: (pos)), (rel: (2.5,0), to: pos), radius: (south: 2))
        rotate(x: 100deg, z: -10deg, origin: pos)
        //circle((rel: (-2.05,-1.05), to: pos), radius: .01, stroke: black)
        //arc((rel: (-2.0,-1.1), to: pos),start: 200deg, stop: 37deg, radius: 2.3)
        circle(pos, radius: 2.3, stroke: substrate)
        
        
      }
    )

    
    rect((2.4,2, 0),(2.6,10,0), fill: teal)
    mesalo((2.5,2))
    mesalo((2.5,5), shift:50deg)



    

    
  }
)



#let reactor = canvas(
  length: 1cm,
  {
    import draw: *

    rect((), (6,8), stroke: 2pt)
    line((rel: (-3,0), to: ()), (rel: (0,-5), to: ()), stroke: 2pt)
    line((), (rel: (1.5,0.5), to: ()),(rel: (0,-1)),(rel: (-1.5,0.5)), stroke: 1pt,)
    line((), (rel: (-1.5,0.5), to: ()),(rel: (0,-1)),(rel: (1.5,0.5)), stroke: 1pt,)
  }
)
#let batch_reactor = canvas(
  length: 1cm,
  {
    import draw: *

    rect((), (6,8), stroke: 2pt)
    line((rel: (-3,0), to: ()), (rel: (0,-5), to: ()), stroke: 2pt)
    line((), (rel: (1.5,0.5), to: ()),(rel: (0,-1)),(rel: (-1.5,0.5)), stroke: 1pt,)
    line((), (rel: (-1.5,0.5), to: ()),(rel: (0,-1)),(rel: (1.5,0.5)), stroke: 1pt,)

    line((2,7.5), (rel: (0,2)), (rel: (-2,0)), mark:(start: ">"))
    line((1.5,7.5), (rel: (0,1.5)), (rel: (-1.5,0)), mark:(start: ">"))
    line((1.98,8), (1.52,8), stroke: white + 2.5pt)
    
  }
)
