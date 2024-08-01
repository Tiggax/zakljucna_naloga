#import "/src/additional.typ": todo
#set heading(offset: 1)

#import "/src/figures/mod.typ": constants_diff_fig

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

= Variations of the constants

== Inoculation values

In @vcd, a graph of @VCD can be seen, graphing three different initial inoculations with inoculum of $0.4$, $0.5$ (default) and $0.6$.
All three inoculations had a temperature shift at day 3.
All three values reach roughly the same peak, with larger inoculations reaching somewhat higher peaks, and faster.
Towards the last day it can be seen that the biggest inoculation start to drop off the fastest.

#figure(
  caption: [Graph of viable cell density over time based on the changing initial $"VCD"$ value],
  image("/figures/vcd.png")
)<vcd>

@vcd-fac shows the whole system for each of the values in relation to time.
It can be seen that the glucose and glutamine levels drop faster with higher value of inoculation, as does the oxygen.
As oxygen drops faster, @PID control starts earlier, but does not max out its regulation.
With lower levels of inoculation, it can be seen that on the last day, the product concentration is lower.
It could be seen that the concentration of product extracted increases with the higher inoculation value.
This means that larger inoculations can potentially produce more product in the same time-frame,but require more oxygen, glucose and glutamine during their run.

#figure(
  caption: [Graph of viable cell density over time based on the changing initial $"VCD"$ value],
  image("/figures/vcd-facet.png")
)<vcd-fac>

== $mu_"max"$ Variations

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

== Feed rate

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
Glucose and glutamine last longer, as the feed rate adds them in the substrate. The bigger the feed, the more substrate gets added per minute, meaning the volume of substrate in the bioreactor increases.
In @PID control a small decrease of needed oxygen can be seen, as more oxygen can get dissolved in larger volume.
The highest concentration of product occurs in the batch bioreactor, while bioreactors with feed contain lower concentration.

#figure(
  caption: [Graph of viable cell density over time based on the changing values of feed rate],
  image("/figures/feed-facet.png")
)<feed-fac>


Simulating the bioreactor for bigger feed values, so that at least one of the substrate nutrients does not get depleted was done with constants in @process-const.

#figure(
  caption: [Different feed rates in @process and @process-fac were built with the following constants differing from the default values in @constants ],
  constants_diff_fig("feed_process0")
)<process-const>

The simulation made four runs with different feed rates in each iteration.
The facet graph of the four runs can be seen in @process-fac.
With growing feed rate, the @VCD needs more time to reach the capacity of the system, with concentrations of different runs staying in similar ranges.
As glucose and glutamine are being feed into the system, larger feed rate values, extend the time of cell growth.
As the values are in concentrations, and the volume is not constant, the values can be deceiving.
Looking at @process, we can see the number of cells and theoretical mass values of each of the nutrients, as well as the wanted product, at the last day of the process.
It can be seen that increasing the feed rate results in a increase of Viable cells, but somewhere between 10 % and 15 % this corelation starts to die off.
Looking at glucose and glutamine mass, it can be seen that they follow a similar pattern.
Similarly the mass of product at the end of the process is the biggest at 10 % feed rate.

#figure(
  caption: [Facet of the different feed rates ranging from 0% to 15 % in 5 % increments.],
  image("/figures/feed_process-facet.png")
)<process-fac>


#figure(
  caption: [Last day cell count and mass of substrate and product for different feed rates ranging from 0% to 15 % with 5 % increments],
  image("/figures/feed_process.png")
)<process>

== Glucose and glutamine

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

The system seen in @fit, was fitted to the data values from @data_figure.
The solution to the system differs from the default system (seen in @constants) with values seen in @fit-const.
The system was fitted as close as possible by manually adjusting values, and then the `n_vcd` and `mu max` were fitted using the values from @VCD points.

#figure(
  caption: [The constants used to simulate the approximate solution],
  constants_diff_fig("data-fit")
)<fit-const>

#figure(
  caption: [facet graph of the system],
  image("/figures/data-fit.png")
)<fit>

@VCD values in @fit correspond close to the simulated model, with values from around the day 10, starting to fall off.
This could due to the model having an assumption of 100% viability, where as in experimental bioreactors cell death occurs.
Glucose and glutamine data was manually fitted to the points, as trying to fit using Nelder-Mead method resulted in a failed result.



While fitting the data only @VCD points were used as target for minimization.
Trying to fit the model on glucose or glutamine resulted in model identifying value of 0 as the best result.
This could be attributed to the minimization function used.
The function used was a simple sum of all squared distances from points to the value at that time.
At points close to 0, the minimization function could incorrectly identify 0 as the best option, with constants being low numbers.


= Suggestions for further work


== Viability model

The model assumes that @VCD viability is 100%, meaning that the cells never die.
This is not the case in bioreactor processes, as missing nutrients and needed substances for cell metabolism can induce apoptosis.


== Better product simulation

The model made production of product relative to density of cells, with a conversion constant.
In biopharmaceuticals production of metabolites can be dependant on other concentrations of molecules in the medium.
Production can also be affected by temperature or in what stage the cells are.
The metabolites can also be secondary as opposed to primary, and so the they are released after cell apoptosis, meaning the growth of concentration would be dependant on cells that die each minute.
As some metabolites can be complex molecules, they can be unstable, and are prone to degradation over time, simulation of product loss over time could be beneficial for bioreactor optimization.
More detailed simulation of product production could be beneficiary.

== Oxygen simulation

=== Henry's constant

The model uses one value of henry's constant to calculate the amount of dissolved oxygen using Henry's law.
The constant is dependant on temperature, which means that pre temperature shift and post temperature shift Henry's constant should be a different value.
The detail of different constant, could improve simulation accuracy.


=== PID control
PID controller was implemented as a simple P control. 
Derivative and integral parts could prove to optimize oxygen consumption and could be modeled accordingly.
The implementation of PID controls with Runge-Kutta method simulation could be improved upon, as the current implementation calculates the average of non zero input values.

=== Volumetric dissolution

Volumetric Mass Transfer Coefficient ($k L a$) is used to calculate the increase of oxygen concentration in the bioreactor.
The coefficient is dependant on the volume and the area to get the effective dissolution of the oxygen. 
In the model @kLa was calculated based on the default volume of the bioreactor, and then scaled proportionally to the increased volume.
Simulations using more detailed dissolution model could be made in the future.

== Data point fitting

=== Minimization function

the model implemented a simple sum of a distance of data points from the calculated value of the model at each point time as a minimization function for the Nelder-Mead method.
This is fast and simple, but created some problems when trying to calculate the best fit for glutamine and glucose, as the "best" value would always become 0.
A further study into point distance evaluation for data fitting would be beneficial for better solutions to experimental data.
One possible solution would be to evaluate the best simplex for a given constant, since the model used non optimized values for their simplex.


=== Machine learning
A complete model could be developed, and then used to fit experimental data.
The data about the model state, could then be used to train an artificial neural network on similarities between the same @CHO strain use, bioreactor, product, e.t.c. that could be used to predict future bioreactor runs.
Machine learning would also prove important as a solution to search for the optimal simplex for data fitting.