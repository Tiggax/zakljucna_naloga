#import "../additional.typ": todo

#import "@preview/cetz:0.2.2": canvas, plot, draw, vector


#let plot = canvas(
  length: 1cm,
  {
    let a = 0.1
    let b = 1.2
    let c = 1

    
    let fn(x) = a* calc.pow((x+ b),2) + c
    let o_fn(x) = 2*a*x + 2*a*b
    
    plot.plot(
      size: (8,8),
      //axis-style: "left",
      x-label: none,
      y-label: none,
      x-min: 0.0001,
      x-max: 10,
      x-tick-step: none,
      y-min: 0,
      y-max: 10,
      y-tick-step: none,
      {
        plot.add(
         domain: (0,10),
         x => fn(x)
        )
        plot.annotate(
          {
            import draw: *

            let label_point(x,y, uniq, label, x_label, y_label) = group(
              name: uniq,
              {
              let pos = (x, y)
              let n_pos = (x + 1.5, o_fn(x)*1.5 + y)
              
              circle(pos, radius: .1, fill: red, stroke: red, name: "point")
              line(
                pos, 
                n_pos, 
                mark: (end: ">"),
                fill: red,
                stroke: red,
                name: "line"
              )
              content((v => vector.add(v,(0.2,-0.2)), "line.mid"),text(fill: red, label))
              line(
                (0,pos.at(1)), 
                pos, 
                stroke: (dash: "dashed"),
                name: "y_line"
              )
              line(
                (pos.at(0), 0), 
                pos, 
                stroke: (dash: "dashed"),
                name: "x_line"
              )

              content(
                anchor: "north",
                padding: .2,
                "x_line.start",
                text(x_label)
              )
              content(
                anchor: "east",
                "y_line.start",
                padding: .2,
                align(right, text(y_label))
              )
              
            })

            let half = 3
            let h = 7

            label_point(0,fn(0), "k_1", $k_1$, $t_0$, $y_0$)
            label_point(half, (fn(half) - .9),"k_2", $k_2$, $t_0 + h/2$, $y_0 + k_1/2$)
            label_point(half, (fn(half) + 0.9 ),"k_3", $k_3$, $t_0 + h/2$, $y_0 + k_2/2$)
            label_point(h, (fn(h) - .5),"k_4", $k_4$, $t_0 + h$, $y_0 + k_3$)

            line((0,fn(0)), (h,7.5), mark: (symbol: "*"), stroke: (paint: green, dash: "dashed"), name: "solution")

            content(
              (v => vector.add(v, (-1,0.1)),"solution.end"), 
              text(fill: green)[$(t_1,y^*_1)$]
            )
          }
        )
      }
    )
  }
)

#let error(calc_val, true_val) = {
  return (calc_val - true_val)/ true_val
  return calc.abs(calc_val / true_val)*100
}


#let accuracy(acc_steps) = {
  import "@preview/oxifmt:0.2.1": strfmt

  let fmt(x,d: 4,add: [] ) = [#strfmt("{:." + str(d) + "}", x)#add]


  let fn(x) = calc.exp(x) + x + 1
  let o_fn(x,y) = y - x


  let euler(steps) = {
    let out = ()
    let p_x = 0.1
    let p_y = fn(p_x)
    for x in range(0, steps).map(x => x * (10/steps) ) {
      let h = (x - p_x)
      let y = h * o_fn(p_x,p_y) + p_y
      out.push((
        x: x,
        y: y,
        error: (fn(x) - y)
      ))
      p_x = x
      p_y = y
    }

    return out
  }
  let rk(steps) = {
    let out = ()
    let p_x = 0.1
    let p_y = fn(p_x)
    for x in range(0,steps).map(x => x * (10/steps) ) {
      let h = (x - p_x)
      let k1 = h * o_fn(p_x, p_y)
      let k2 = h * o_fn(p_x + (h/2), p_y + (k1/2))
      let k3 = h * o_fn(p_x + (h/2), p_y + (k2/2))
      let k4 = h * o_fn(x, p_y + k3)
      let y = p_y + (k1 + 2*k2 + 2*k3 + k4)/6

      out.push((
        x: x,
        y: y,
        error: (fn(x) - y)
      ))

      p_x = x
      p_y = y
    }
    
    return out
  }
  let euler =  euler(acc_steps)
  let rk = rk(acc_steps)
  return (
    euler: euler,
    rk4: rk,
    table: euler
      .zip(rk)
      .map(((e,r))=> {
        let y = fn(e.x)
        return (
          fmt(e.x, d:0),
          fmt(y),
          fmt(r.y), fmt(error(r.y, y) * 100, add: [%], d: 2) ,
          fmt(e.y), fmt(error(e.y, y) * 100 , add: [%], d: 2)
        )
      }
    )  
  )
  
}




#let rk4_compare(steps) = {
  import "@preview/cetz:0.2.2": canvas, plot, draw, vector
  
  let (euler, rk4) = accuracy(steps)
  canvas(
    length: 1cm,
    {
      plot.plot(
        size: (14,8),
        legend: "legend.inner-north-west",
  
        
        x-min: -1,
        x-max: 10,
        x-tick-step: none,
  
        y-min: -50,
        y-max: 500,
        y-tick-step: none,
        {
          plot.add(
            label: [$y$ solution],
            style: (stroke: (paint: aqua, thickness: 1.5pt)),
            domain: (-1,10),
            x => calc.exp(x) + x + 1
          )
          plot.add(
            label: [Euler],
            mark: "o",
            mark-size: .15,
            mark-style: (stroke: green, fill: green),
            style: (stroke: (thickness: .5pt, paint: green)),
            euler.map(((x,y,error))=>(x,y))
          )
          
          plot.add(
            label: [Runge-Kutta],
            mark: "o",
            mark-size: .15,
            mark-style: (stroke: red, fill: red),
            style: (stroke: (thickness: .5pt, paint: red)),
            rk4.map(((x,y,error))=>(x,y))
          )
        }
      )
    }
  )
}


#let comparison_table(steps) = {
  let cells = accuracy(steps).table.flatten()
  return table(
    fill: (x,y) => {
  
      if y < 2 { return color.mix(teal, white)}
      
      if (x == 3 or x == 5) {
          let val = float(cells.at( x + 6*(y - 2)).children.first().text) / 100
          return color.hsv((1 - calc.abs(val))* 90deg, 70%, 100%)
      }
  
      
      
    },
    columns: 6,
    table.header(
      table.cell(rowspan: 2, align: horizon)[x],
      table.cell(rowspan: 2, align: horizon)[$y(x) = e^x + x + 1$],
      table.cell(colspan: 2, fill: color.mix(red, white))[RK4], 
      table.cell(colspan: 2, fill: color.mix(green, white))[Euler],
      $y^*$,
      [error],
      $y^*$,
      [error]
    ),
    ..cells
    
  )
}

