#import "/src/additional.typ": todo

#set heading(offset: 1)
#text(fill: navy, weight: "black", lang: "sl")[
  kaj smo dobili, kako je zgledalo, kaj se je izvedelo, ali so hipoteze držale?
]

= Default system

Simulating the default system with variables seen in @constants, we get the following graph seen in @default and in @default-fac. 
Volume starts to rise with day 2, as at that time bioreactor feeding initiates. 
At day 3 a temperature shift has been made, that changes the growth rate of @VCD.
@DO levels drop from 80% to 25% within the first day, when the @PID controller started adding oxygen to keep the minimum level of 25%.
At around day 12, the @PID controller hits maximum output, and the @DO level starts dropping towards 0%.
@VCD concentration grows steadily, until that day when growth starts to fall off.
Glucose and glutamine are being used, but never at rate, that would cause the feed to supply too little for the cells to grow.


#figure(
  caption: [Graph of the default system],
  image("/figures/default.png")
)<default>

#figure(
  caption: [Faceted Graph of the default system],
  image("/figures/default-facet.png")
)<default-fac>

= Variations of the system

In @vcd, a graph of @VCD can be seen, graphing three different initial inoculations with inoculum of $0.4$, $0.5$ (default) and $0.6$.
All three inoculations had a temperature shift at day 3.
While $0.4$ inoculation steadily rises during the whole process, $0.5$ and $0.6$ inoculations start to stabilize at around day 12 and 11.
Both rise before stabilizing at a value of around $3.65$.
#todo[write in discussion: The value of around $3.65$ could be said to be the cell concentration capacity of the system.]

#figure(
  caption: [Graph of viable cell density over time based on the changing initial $"VCD"$ value],
  image("/figures/vcd.png")
)<vcd>

@vcd-fac shows the whole system for each of the values in relation to time.
It can be seen that glucose and glutamine levels drop more by the end of the process if the inoculation value is higher, while the @PID control uses more oxygen.
It can also be noted that the percentage of oxygen drops sooner in the end of the process, as the cells hit the capacity of the system.
The concentration of product extracted increases with the higher inoculation value.

#figure(
  caption: [Graph of viable cell density over time based on the changing initial $"VCD"$ value],
  image("/figures/vcd-facet.png")
)<vcd-fac>

In @mu_max it can be seen that 

#figure(
  caption: [Graph of viable cell density over time based on the changing values of $mu_max$],
  image("/figures/mu_max.png")
)<mu_max>

#figure(
  caption: [Graph of viable cell density over time based on the changing values of $mu_max$],
  image("/figures/mu_max-facet.png")
)<mu_max-fac>


#figure(
  caption: [Graph of viable cell density over time based on the changing values of feed rate],
  image("/figures/feed.png")
)<feed>

#figure(
  caption: [Graph of viable cell density over time based on the changing values of feed rate],
  image("/figures/feed-facet.png")
)<feed-fac>


#figure(
  caption: [Graph of glucose concentration over time based on the changing glucose constant],
  image("/figures/glucose.png")
)<glucose>

#figure(
  caption: [Graph of glucose concentration over time based on the changing glucose constant],
  image("/figures/glucose-facet.png")
)<glucose-fac>


#figure(
  caption: [Graph of glutamine concentration over time based on the changing glutamine constant],
  image("/figures/glutamin.png")
)<glutamin>

#figure(
  caption: [Graph of glutamine concentration over time based on the changing glutamine constant],
  image("/figures/glutamin-facet.png")
)<glutamin-fac>

= Simulation

#import "/src/figures/mod.typ": constants_diff_fig

//#figure(
//  caption: [],
//  constants_diff_fig("simple_fit")
//)


= Suggestion for further work
