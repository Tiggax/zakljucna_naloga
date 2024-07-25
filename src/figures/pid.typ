#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import "@preview/cetz:0.2.2": canvas, plot, draw, vector


#let pid_graph = canvas(
  length: .9cm,
  {
    import draw: *


    let sig(pos, ..args) = group(
      ..args,
      {
        circle((rel: (.1,-.03), to: pos), radius: .8, fill: black)
        circle(
          pos,
          radius: .8,
          fill: yellow,
          stroke: black,
          name: "center"
        )
        content("center", text(size: 3em, $Sigma$))

      }
    )

    let process(pos, name, eq, color) = group(
      name: name,
      {
        let a = (pos.at(0) -1.5, pos.at(1) - .6)
        let shadow = (rel: (.1, -.03), to: a)
        rect(shadow, (rel: (3,1.2), to: shadow), fill: black)
        rect(a, (rel: (3,1.2), to: a), fill: color, name: "box")

        if eq == none {
          content("box", padding: .1, text(size: 1.5em, name))
        } else {
          content("box.west", anchor: "west", padding: .1, text(size: 2em, name))
          content("box.east", anchor: "east", padding: .1,text(size: 1.4em, eq))
        }
      }
    )
    let const(pos, name) = group(
      name: name,
      {
        let shadow = (pos.at(0) + .1, pos.at(1) - .03)
        let tri(pos, ..args) = line((to: pos, rel: (-.5,0)), (rel: (0,.5), to: ()), (rel: (1.5,-.5), to: ()),(rel: (-1.5,-.5), to: ()), (rel: (0,.5), to: ()), ..args)

        tri(shadow, fill: black)
        tri(pos, fill: yellow)

        content(pos, text(size: 0.8em, $K_#name.at(1)$))
      }
    )


    sig((1.4,0), name: "first")
    line((-1,0), "first", mark: (end: ">"), name: "sp")
    content("sp.end", anchor: "north-east", padding: .1, $+$)
    content("sp.mid", anchor: "south", padding: .2, $r(t)$)

    rect((2.5,-3),(11.5,3), stroke: (dash: "dashed"), name: "group")
    content("group.north", anchor: "south", padding: .1)[PID control]


    const((4.5,2), "kP",)
    process((7.5,2), "P", $e(t)$, color.mix(green, yellow) )
    
    const((4.5,0), "kI",)
    process((7.5,0), "I", $integral^t_0 e(t) d t$, color.mix(blue, white, green, white))
    
    const((4.5,-2), "kD",)
    process((7.5,-2), "D", $( d e(t))/(d t)$, color.mix(orange))

    content((3.5,0),"", name: "err")
    
    line("first","err", name: "err")
    content((name: "err", anchor: 60%), anchor: "south", padding: .2, $e(t)$)
    
    line("err.end",((), "|-", "P"), "kP", mark: (end: ">"), name: "to_p")
    line("kP", "P.west", mark: (end: ">"))
    line("err.end", "kI", mark: (end: ">"), name: "to_i")
    line("kI", "I.west", mark: (end: ">"))
    line("err.end",((), "|-", "D.west"), "kD", mark: (end: ">"), name: "to_d")
    line("kD", "D.west", mark: (end: ">"))

    sig((10.5,0), name: "second")

    line("P.east", ((), "-|", "second"), "second", mark: (end: ">"), name: "p_s")
    content("p_s.end", anchor: "south-west", padding: .1)[+]
    line("I.east", "second", mark: (end: ">"), name: "i_s")
    content("i_s.end", anchor: "south-east", padding: .1)[+]
    line("D.east", ((), "-|", "second"), "second", mark: (end: ">"), name: "d_s")
    content("d_s.end", anchor: "north-west", padding: .1)[+]

    process((14.3,0), "process", none, white)

    line("second", "process", mark: (end: ">"), name: "to_p")
    content("to_p.mid", anchor: "south", padding: .2, $u(t)$)
    
    
    line("process", (rel: (3,0), to:"process"), mark: (end: ">"), name: "out")
    content("out.mid", anchor: "south", padding: .2, $y(t)$)
    //content("out.end", anchor: "south-west", padding: .1)[Output]
    
    line("out.mid", ("out.mid", "|-", (0,-4)), ((), "-|", "first"), "first", mark: (end: ">"), name: "feedback")
    content("feedback.mid", anchor: "south", padding: .1)[feedback]
    content("feedback.end", anchor: "north-west", padding:.1, text(size: 2em)[-])
    
    

  }
)


#let pid_fn = canvas(
  {
    import draw: *

    

    let sp(x) = if x > 1 {1} else {0}

    let i = 0
    let p_x = 0
    let p_y = 0
    let p_err = 0

    let out = ((p_x, p_y),)
    let pid = ((0,0),)
    let pd = ((0,0),)
    let id = ((0,0),)
    let dd = ((0,0),)

    let kp = .5
    let ki = .01
    let kd = .01

    
    for x in range(1,100).map(x => x*0.1) {


      let dx = (x - p_x)

      
      let err = sp(x) - p_y
      
      let p = kp * err    
      i += ki * err * dx
      let d = kd * (err - p_err) / dx

      let mv = p + i + d 

      p_y =  p_y + mv

      p_err = err
      p_x = x
      
      out.push((x,p_y))
      pd.push((x, p))
      id.push((x, i))
      dd.push((x, d))
      pid.push((x, mv))
    }

    
    plot.plot(
      size: (16,8),
      legend: "legend.inner-north-east",
      x-label: none,
      y-label: none,
      x-tick-step: none,
      y-tick-step: none,
      y-min: -.1,
      y-max: 1.2,

      x-domain: (0,5),
      {
        plot.add(
          domain: (0,10),
          label: "SP",
          {
            x => sp(x)
          }
        )
        plot.add(
          label: "y",
          {
          out
        })
        plot.add(
          label: "PID",
          style: (stroke: yellow),
          {
            pid
          }
        )
        plot.add(
          label: "P",
          style: (stroke: green),
          {
            pd
          }
        )
        plot.add(
          label: "I",
          style: (stroke: aqua),
          {
            id
          }
        )
        plot.add(
          label: "D",
          style: (stroke: orange),
          {
            dd
          }
        )
      }
    )
  }
)

#pid_fn