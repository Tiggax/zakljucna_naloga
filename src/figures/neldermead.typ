#import "@preview/cetz:0.2.2": canvas, plot, draw, vector



#let triangle = canvas(
  {
    import draw: *
    line((0,0),(3,0),(1,2),(0,0), name: "line")
    content("line.1%", anchor: "east")[$x_1$]
    content("line.35%", anchor: "west", padding: .2)[$x_2$]
    content("line.70%", anchor: "south", padding: .2)[$x_3$]
  }
)

#let thdrn = canvas(
  {
    import draw: *

    let x0 = (0,0,0)
    let x1 = (0,0,1)
    let x2 = (-2,0,1)
    let x3 = (0,2,0)
    
    line(x0,x1,x3,x0,x2,x3, name: "line")
    line(x1,x2, stroke: (dash: "dotted"))

    content(x0, anchor: "north", $x_0$)
    content(x1, anchor: "west", $x_1$)
    content(x2, anchor: "east", $x_2$)
    content(x3, anchor: "south", padding: .05, $x_3$)
  }
)



#let simplex = table(
  columns: 2,
  table.header([space],[geometrical representation]),
  $RR^2$, triangle,
  $RR^3$, thdrn
)


#simplex

#let reflection = canvas(
  {
    import draw: *

    let ph = (0,0)
    let pl = (2,0)
    let ps = (1,1)
    let c = ph.zip(pl).zip(ps).flatten().chunks(3).map(x => 
      x.sum() / 3
    )
    
    line(ph,pl,ps, close: true, stroke: blue, name: "line")
    content(ph,$p_h$, anchor: "east")
    content(pl,$p_l$, anchor: "west", padding: .1)
    content(ps,$p_s$, anchor: "south", padding: .1)
    //circle(c, radius: .01)
    //content(c, $overline(p)$, anchor: "north-west")
    

    let pr = (3,1)
    line(pl,ps, pr ,stroke: red, close: true)
    line(ph,pr, stroke: (dash: "dashed"))
    content(pr,$p_r$, anchor: "west", padding: .1)

    
    
  }
)
#let contraction = canvas(
  {
    import draw: *
  }
)
#let expansion = canvas(
  {
    import draw: *
  }
)


#let operations = table(
  columns: 2,
  table.header([name], [visualization]),
  [_reflection_], reflection,
  [_contraction_], contraction,
  [_expansion_], expansion,
  
)

#operations



#let graph = canvas(
  {
    import draw: *
    rect((0,0),(5,3), name: "start")
    content("start")[
      Calculate initial $p_i$ and $y_i$

      Determine $h$, calculate $overline(p)$

      Form $P = (1 + alpha)overline(p) - alpha p_h$

      Calculate $y$
    ]


    rect((0,-1),(2,-2), name: "isy")
    content("isy")[
      is $y^* < y_l ?$
    ]
  }
)

#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

#set text(size: .8em)
#let graph = diagram(
  node((0,0))[start],
  edge("->"),
  node((0,1))[#rect[
    Calculate initial $p_i$ and $y_i$

    Determine $h$, calculate $overline(p)$

    Form $P = (1 + alpha)overline(p) - alpha p_h$

    Calculate $y$
  ]],
  edge("->"),
  node((0,2))[#rect[is $y^* < y_l$ ?]],
  edge((),(0,3),"->",`yes`),
  edge((),(1,2),"->",`no`),
  node((0,3))[#rect[is $y^(**) < y_l$ ?]],
  edge((),(0,4),"->",`yes`),
  edge((),(1,3),`no`),
  node((0,4))[#rect[Replace  $p_h$ by $p^(**)$]],
  edge((),(1,4)),

  node((1,2))[#rect[is $y^(*) > y_i, i eq.not h $ ?]],
  edge((),(2,2),"->",`yes`),
  edge((),(1,3),`no`),

  node((2,2))[#rect[is $y^(*) > y_h$ ?]],
  edge((),(2.5,2),(2.5,2.5),"->",`no`),
  edge((),(2,3),"->",`yes`),

  node((2.5,2.5))[#rect[Replace $p_h$ by $p^*$]],
  edge((),(2,2.5)),

  node((2,3))[#rect[
    Form $p^(**) = beta p_h + (1 - beta) overline(p)$

    Calculate $y^(**)$
  ]],
  edge((),(2,4)),

  node((2,4))[#rect[is $y^(*) > y_h$ ?]],
  edge((),(1.5,4),(1.5,4.5),"->",`no`),
  edge((),(2.5,4),(2.5,4.5),"->",`yes`),

  node((1.5,4.5))[#rect[Replace $p_h$ by $p^(**)$]],
  edge((),(1.5,5)),
  
  node((2.5,4.5))[#rect[Replace all $p_i$'s by $(p_i + p_l)/2$]],
  edge((),(2.5,5),(1,5)),

  edge((1,5),(1,5.5),"->"),
  

  edge((1,3),(1,3.5),"->"),
  node((1,3.5))[#rect[Replace  $p_h$ by $p^(*)$]],
  edge((),(1,4)),
  edge((),(1,5)),

  node((1,5.5))[#rect[Has minimum been reached?]],
  edge((),(-1,5.5),(-1,1), (0,1),"->",`no`),
  edge((),(2,5.5),"->",`yes`),
  node((2,5.5))[#rect[EXIT]]
  
  
)

#graph