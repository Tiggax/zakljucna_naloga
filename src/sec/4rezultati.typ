#import "/src/additional.typ": todo
#set heading(offset: 1)


= Default system

Simulating the default system with variables seen in @constants, we get the following graphs seen in @default and in @default-fac. 
Volume starts to rise with day 2, as at that time bioreactor feeding initiates. 
At day 3 a temperature shift has been made, that changes the growth rate of @VCD.
@DO levels drop from 80% to 25% within the five days, when the @PID controller starts adding oxygen to keep the minimum level of 25%.
It can be seen that maximum values of the @PID controller increase with the same rate as @VCD grows.
@VCD concentration increases until some time before day 10 when glutamine runs out, and causes it to stop growing.
@VCD slowly starts to drop till around day 12, when glucose runs out, which prompts it to drop faster.

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
All three values reach roughly the same peak, with larger inoculations reaching slighltly higher peaks, and faster.
Towards the last day it can be seen that the biggest inoculation start to drop off the fastest.

#figure(
  caption: [Graph of viable cell density over time based on the changing initial $"VCD"$ value],
  image("/figures/vcd.png")
)<vcd>

@vcd-fac shows the whole system for each of the values in relation to time.
It can be seen that the glucose and glutamin levels drop faster with higher value of inoculation, as does the oxygen.
As oxygen drops faster, @PID control starts earlier, but does not max out its regulation.
With lower levels of inoculation, it can be seen that on the last day, the product concentration is lower.
It could be seen that the concentration of product extracted increases with the higher inoculation value.
This means that larger inoculations can potentialy produce more product in the same time-frame,but require more oxygen, glucose and glutamine during their run.

#figure(
  caption: [Graph of viable cell density over time based on the changing initial $"VCD"$ value],
  image("/figures/vcd-facet.png")
)<vcd-fac>

In @mu_max it can be seen that changing the $mu_"max"$ constant changes the rate at which the cells multiply. 
This means that higher values translate to faster growth of cells in the same medium.
This faster growth also means that @VCD reaches its maximum density faster.

#figure(
  caption: [Graph of viable cell density over time based on the changing values of $mu_max$],
  image("/figures/mu_max.png")
)<mu_max>

Looking at other values in @mu_max-fac, it can be seen that higher values of $mu_"max"$ also accelerate the consumption of glucose, glutamine and oxygen.
As more cells are generated, the concentration of product also rises.
Bigger consumption also strains the @PID control, as oxygen needs to be pumped into the system sooner and in bigger quantities for cells to not suffocate.

#figure(
  caption: [Graph of viable cell density over time based on the changing values of $mu_max$],
  image("/figures/mu_max-facet.png")
)<mu_max-fac>



Changing the feed rate results in the @feed.
Red line represents a bioreactor with no feed, meaning a normal batch bioreactor.
It can be noted that since the feed rate is 0%, cell concentration stays the same after reaching the maximum of the system.
This is because of the assumption in @vcd-sec, that 100% of cells in the bioreactor are alive at every increment.
It can be seen that as the feed rate increases the concentration is increases slower, and then starts to fall off when cells stop multiplying because of lack of nutrients.
This happens, since volume steadily increases, and cells start to get diluted.

#figure(
  caption: [Graph of viable cell density over time based on the changing values of feed rate],
  image("/figures/feed.png")
)<feed>

In @feed-fac  we can see feed rate compared to other values.
Glucose and glutamine are similarly diluted like cell density.
It can be seen that the concentration of product remains relativly the same for all feed rates.


#figure(
  caption: [Graph of viable cell density over time based on the changing values of feed rate],
  image("/figures/feed-facet.png")
)<feed-fac>

Graphing glucose in @glucose and @glucose-fac and glutamine in @glutamin and @glutamin-fac it can be seen, that glucose and glutamine constants mainly affect the consumption of glucose and glutamine, with no major changes in the system.

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
  image("/figures/glutamine.png")
)<glutamin>

#figure(
  caption: [Graph of glutamine concentration over time based on the changing glutamine constant],
  image("/figures/glutamine-facet.png")
)<glutamin-fac>

= Fitting to the Data

The system was approximated manually, to get close to data values , and then used the Nelder-Mead  algorithm to fit the @VCD.

#import "/src/figures/mod.typ": constants_diff_fig

//#figure(
//  caption: [],
//  constants_diff_fig("simple_fit")
//)


= Suggestions for further work


#todo[temp shift vpliva na producijo produta, naredij ga več]

#todo[ PID control input ]

#todo[vpliv spremnjanja volumna glede na kLa (koficient snovnega prenosa (kok hit se raztaplja))]