#import "/src/additional.typ": todo

#import "@preview/cetz:0.2.2": canvas, plot, draw, vector


== Mass balance
#rect(
$"accumulation" = "in" - "out"$)

Mass balance is a fundemental principle in bioreactor modeling.
It is used to describe flow of mass into, within and out of a bioreactor.
This ensures that all mass entering the system is accounted for in either the product, waste or within the reactor itself.

_Accumulation_ is a measure of 

To measure a compound or an element $i$, the balance of that $i$ in a system can be written as _Accumulation_ of _i_ where the system can be written as
$
(d(i))/(d t) = E_i - S_i + sum^n_(k=1)R_(k(i))
$
while the Accumulation of elements is a simpler 
$
(d(e))/(d t) = E_e - S_e
$




== Cell metabolism

Cell division is a process in which a single mother cell multiplies its own genetic material, and then splits into two or more daughter cells @martin_2015[p. 143].

There are two kinds of divisions:

/ Mitosis: produces two identical daughter cells that contain identical to the mother nucleus.
/ Meiosis: produces four daughter cells, each with half the number of mother cells genetic material.

The process of mitosis happens in all eukaryotic cells, in is the central part of cell multiplication in a bioreactor. 


Cell metabolism can sometimes be complex and sometimes hard to describe, but in general follows a simple principle of exponential growth.

$
(d X(t))/(d t) = mu X(t)
$


== Monod kinetics<monod_sec>

This relation is commonly named the _Monod function_, although it was initially proposed by Michaelis–Menten and later extended by Monod to describe the growth of microorganisms.

Many different mathematical formulas could be used to similarlly fit the data, but it is convinient to adopt hyperbolic @monod_eq @monod_2012[p. 383].

The function follows a principal that low amount of substrate concentration gives low growth rate and if the substrate concentration increases, the growth rate also increases.
For higher substrate levels, the growth rate increases diminishingly as it can be seen in @monod_f @carlsson_1998.


$
mu(S) = mu_"max" S / (K_S + S)
$<monod_eq>
where 
- $K_S$ is the half saturation constant
- $mu_"max"$ is the maximum specific growth rate
- $S$ is the concentration of growth limiting substrate
- $mu(S)$ is the growth rate at the specific concentration.



#import "/src/figures/mod.typ": monod_plot, monod_function

#figure(
  caption: [Illustration of the changing curve of the Monod function, depending on the half saturation constant at $mu_"max" = 1$],
  monod_plot
)<monod_f>

If the value of $S$ equals the value of $K_S$, it can be noted that the @monod_eq becomes 
$
mu(K_S) = mu_"max" dot  K_S / (K_S + K_S) \
mu(K_S) = mu_"max" dot cancel(K_S) / (2 dot cancel(K_S) ) \
mu(K_S) = mu_"max" / 2
$
This can graphically be seen in @monod_half.
#todo[nevem kako točno to vključt notr. a sam vn vržem?]

#let k = 1
#let mu_max = 1

#figure(
  caption: [Monod function at $K_S$ = #k and $mu_"max"$ = #mu_max],
  monod_function(k: k, mu_max: mu_max)
)<monod_half>

== Process control

Process control of the bioreactor is achieved using many systems that utilize the feedback loop to achieve system stability. 

=== PID controller

@PID controller or a _proportional integral and derivative controller_ is normally used to achieve this stability.

This control structure is the most dominating form of feedback in use today, with more than 90% of all control loops being @PID controllers @astrom_2001[p. 1163].

While @PID controller has a long and diverse history in the domain of automatic control, the contribution of Minorsky created support for the subsequent emergence of modern @PID controllers @borase_2021[p. 1].
Minorsky provided a theoretical analysis for the derivative of the error; that is its current rate of change @medaglia_2019.
Industrial PID control tuning formulas proposed by Ziegler and Nicholas in 1942 @ziegler_1942, represented the state of the art of PID control by the early 1980s @aastrom_2006.
In 1984 Åström and Hägglund @aastrom_1984 proposed a relay-tuning method built upon the classical method of Ziegler and Nichols @aastrom_2006.

The simple structure and easy implementation of the @PID controller has made it the most widely used controller in various application domains @borase_2021[p. 7].
It was the first controller for the high-volume market to be mass produced in the process industries @johnson_2005[p. 1].

The workings of @PID controller can be seen in @pid_figure.



#import "/src/figures/mod.typ": pid_figure, pid_graph

#figure(
  caption: [Scheme of a PID control system],
  pid_graph
)<pid_graph>


 Reference signal ($r(t)$) takes in a function of setpoints, meaning that at different times, different setpoints can be set.
An error value ($e(t)$) is then calculated from the difference between the setpoint and the current measured value.
This error is then used in the control algorithm.

PID control uses the three mode algorithm, the proportional, integral and the derivative.
The proportional term incorporates proportional changes of the error to the output and is denoted by the P in @pid_graph.
The integral term, denoted by I in @pid_graph; corrects the output by reducing the offset from the process variable.
Finally the derivative controls the rate of change of the process.
It is denoted by D in @pid_graph, and changes the output when there are unusual variations.
Each of the parameters is scaled with their respective constant, to give the user control of the performance of the controller
@borase_2021[p. 2].
It could be said that the integral, proportional and derivative feedback is based on the past (I), present (P) and future (D) control error of the system @astrom_2001[p. 1163].
Visualization of the workings of @PID control can be seen in @pid_figure


Function $u(t)$ in @pid_graph can also be represented as a Parallel type or _ideal representation_ 
$
u(t) = K_c ( e(t) + 1 / T_i integral e(t) d t + T_d (d e(t))/ (d t) )
$<pid_eq>
where $K_p = K_c$, $K_i = K_c / T_i$ and $K_d = K_c dot T_d$.




#figure(
  caption: [Visualization of the PID control response of the process variable ($y$) to the step change of setpoint (SP) in reference to time],
  pid_figure
)<pid_figure>

