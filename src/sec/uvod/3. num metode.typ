#set heading(offset: 1)
#import "/src/additional.typ": todo

#import "@preview/cetz:0.2.2": canvas, plot, draw, vector

#set math.equation(numbering: "(1.1)")



Ordinary differential equations or shorter @ODE[s], are equations that for a unknown function $y(x)$ have a form
$
F(x, y(x),y'(x), dots, y^((n))(x)) = 0
$<general_ode>

where $F$ is the given function. 
@ODE can be expressed in implicitly like in @general_ode or in explicit form like
$
F(x, y(x),y'(x), dots, y^((n-1))(x)) = y^((n))
$

They differ from Partial differential equations in the number of variables. @ODE[s]  derivatives are taken only in respect to one variable, whereas partial differential equations depend on several independent variables.


== First order differential equations


The _order_ of a @ODE is the order of the highest derivative, that takes place in the equation. Therefore first-order @ODE solved for the derivative has a form of

$
y'(x) = F(x,y(x))
$ <general_first_ode>

When working with more complex systems, $y(x)$ can be a vector-valued function.
Therefore when working in $RR^N$, and $x$ can take on any real value, then 
$
&F&: &RR times RR^N &arrow &RR^N,
\
&y&: &RR &arrow &RR^N
$
give the domain and range of the function $F$, which defines the @ODE and the solution to this equation @butcher_2016[p.1-2].




We can find a function $phi$ such that
$
phi : D subset.eq RR arrow RR^N
$
is a solution of @general_first_ode in a set of $D$, if it is derivable the said set, and equation
$
phi'(x) = F(x,phi(x))
$
holds for each $x in D$.


Sometimes @general_first_ode is represented in terms of differentials as $d y = F(x,y)d x$.
In this, a solution of @ODE is a function $y(x)$ which when substituted into the equation, turns the equation into an identity. 
_The general solution of a @ODE _ is the set of all its solutions @Polyanin_2017[p. 3].

The general solution can also be called the general integral of an equation.
Geometrically this solution is a family of curves in the $x y$-plane.
These curves are called _integral curves_ of the @ODE.
To each particular solution of the general solution, there corresponds a single curve that passes through a given point in the plane.
For each point $(x,y)$, the @general_first_ode defines a value of $y'(x)$ that can be seen in @ode_example.
That value represents the so-called slope of the integral curve that passes through that point @Polyanin_2017[p.3-4].
That is to say the @ODE generates a field of directions in the $x y$-plane.

#figure(
  caption: [The vector field for the equation $y'(x) = x - y$ and an integral curve for a point $(x_0, y_0)$ in the said curve.],
  image("/figures/ode-example.png", width: 90%)
  
)<ode_example>


=== Cauchy problem <cauchy>
The _Cauchy problem_ also known as the initial value problem asks to find a solution of @general_first_ode that satisfies the initial condition of

$
y(x_0) = y_0
$
where $y_0$ and $x_0$ are some numbers.
This means geometrically, that the solution is an integral curve of the @general_first_ode that passes through the point $(x_0,y_0)$ as seen in @ode_example.






=== Solving First order differential equations

The simplest @ODE follows the form of 
$
y'(x) = f(x)
$
The solution for these equations at $y(x_0) =y_0$ is
$
phi(x) = y_0 + integral_(x_0)^x f(t) d t
$
Most of the time the equations like @general_first_ode come in some form of
$
y'(x) = f(x)g(y(x))
$<product_ode>
where the $x$ and $y(x)$ parts can be separated in some form of product.
For @ODE[s], like @product_ode, their form can be reformatted into
$
integral 1 / (g(y(x))) d y= integral f(x)d x + C
$
where $C$ is an arbitrary constant.
The general solution is one-parametric family of curves.
If the initial value is given, the constant $C$ can be determined.

if $g(y(x)) = y(x)$, we talk about _linear differential equations_.
$
F(x,y) = p(x) dot y(x) + q(x)
$
where $p$ and $q$ are functions of $x$ only, then the @ODE @general_first_ode[] is called linear, otherwise it is nonlinear @dreyer_2017[p. 23].
@LDE is _homogeneous_ if $q(x) = 0$, otherwise it is _non-homogeneous_.





In many cases the independent variable $x$ is denoted as $t$, as to imply the _time_.
and so @general_first_ode can also be denoted as
$
y'(t) = F(t, y(t))
$
or in cases when talking about systems of @ODE[s]
$
X'(t) = F(t, X(t))
$


The classes of differential equations that can be solved exactly (in closed form) using current exact methods are quite limited, covering only a small portion of practical problems. 
For this reason, numerical methods are widely used today. 
These methods are applicable to a broad range of equations and allow for obtaining specific solutions to particular problems @Polyanin_2017[p. 61-62].




== Single-step methods


Let us say that we have an interval of $[x_0, x_*]$.
The interval splits into $n$ equal segments of length $h = (x_* - x_0) / n$.
$y_1, dots, y_n$ then denote the approximate values of the function $y(x)$ at the points $x_1, dots, x_n = x_*$.
This discrete set of points $X_h = {x_0, x_1, dots, x_n}$ is called a mesh, where  $h$ is _mesh increment_ or _step size_ and the individual points $x_k$ are called _mesh nodes_.
Collection of values is called a _mesh function_ and written as $y^((h)) = {y_k, k = 0,1,dots,n}$@Polyanin_2017[p. 62].


A single-step method is generally a numerical method that provides successively an approximation of the exact solution, $y_(k+1)$ , at the point $x_(k+1)$ based on the known approximation $y_k$ at the point $x_k$ @Polyanin_2017[p. 63].

== Euler Method <euler_sec>

#let ni = $i+1$

The Euler Method follows a very simple principle.
Suppose there is a particle.
It is moving in such a way, that at time $x_0$ its position is equal to $y_0$, and velocity is known to be $v_0$.
Over a short period of time, such that there has not been time for the velocity to change significantly from $v_0$, the change in position will be approximately equal to the change in time multiplied by $v_0$.
If the motion of the particle can be expressed as a differential equation, then the value of $v_0$ is known as a function of $x_0$ and $y_0$.
Therefore if given $x_0$ and $y_0$, the solution at $x_1$, assuming that it is close to $x_1$, can be written as
$
y_1 = y_0 + (x_1 - x_0) dot v_0
$

A step can of $y_1$ can then be calculated from known values of $x_0, x_1, y_0$ and $v_0$.
Assuming that $v_1$ can be found using the differential equation from values of $x_1$ and $y_1$, a second step can be taken using 
$
y_2 = y_1 + (x_2 - x_1) dot v_1
$
to find an approximate solution of $y_2$ at $x_2$.
This step can then be repeated to get an approximation of a solution.
This solution for approximation at $y_ni$ can then be written as
$
y_ni = y_i + (x_ni - x_i) dot v_i
$<general_euler>

Sometimes @general_euler is written as
$
y^*_ni = y^*_i + h f(x_i, y^*_i)
$<general_euler_h>
where the 
- $y^*_i$ is short for the approximation of $y(x)$ at $x_i$

- $h = (x_ni - x_i)$
- $f$ represents the function of velocity or the derivative of change at the previous point. 


It is important that the step taken is over a short period of time, as having bigger steps can create a different result.
@euler shows how a difference in step size can affect the result of the solution.
By using larger steps, each value down the line can be less accurate.



#figure(
  caption: [Example of an Euler method, where each color represents a different step size and the black line represents the theoretical solution],
  image(
    "/figures/euler.png", 
    width: 90%
  )
)<euler>



=== Similarities between Euler and the Taylor series<euler_v_taylor>
Let us assume that the solution $y(x)$ exists to the Cauchy problem talked about in @cauchy, and it can be written as a Taylor series at the point $x = x_i+1$.
Then taking the Taylor series
$
f(x) = f(a) 
+ (f^((1)) (a))/1!(x - a) 
+ (f^((2)) (a))/2!(x - a)^2
+ dots 
+ (f^((n)) (a))/n!(x - a)^n
$
Substituting $x$ with $x_ni$, $a$ with $x_i$, and then changing $(x_ni - x_i)$ with $h$ to represent the change of independent variable.
Then knowing that $f(x_i, y(x_i)) = y^((1))(x_i)$ we can write out Taylor series as
$
y(x_ni) = y(x_i)
+ h f(x_i, y(x_i))
+ h^2 / 2 y^((2))(x_i)
+ h^3 / 6 y^((3))(x_i)
+ dots
$<euler_taylor>
Taking the first two terms from the Taylor series results in @general_euler_h.
Upon examining @euler_taylor, a question arises: what if the approximation incorporated more than just the initial two terms of the Taylor series?
Given the understanding of the Taylor series, this should ideally result in an improvement in accuracy.

== Runge-Kutta method

Runge-Kutta is not one method, but a family of implicit and explicit iterative methods, of which Euler method (talked about in @euler_sec) is one of.
They are used to find approximate solutions of simultaneous nonlinear equations.
The most known method from this family is known as simply "the Runge-Kutta", "classic Runge-Kutta" or simply as "RK4".

This algorithm is named after the research of C. Runge and W. Kutta, originally created in the period of 1895 - 1901.
Afterwards K. Heun made further improvements to the algorithm @dreyer_2017[p. 112].

Looking back in @euler_v_taylor, the question of using more than just the first two terms of the Taylor series arose.
The expectation is that using more terms would result in better accuracy, as it would result in better approximations. 
But this is at a cost of the calculation of second, third and higher derivatives of $y(x)$ at each step.
Calculations of these derivatives can cost a lot of time and work to calculate @dreyer_2017[p. 112].

This is where Runge-Kutta algorithm is useful.
The algorithm produces the same accuracy as when using the first three terms of @euler_taylor, but without necessity of second derivative calculation.
Let there be an initial value problem as specified in @cauchy.

$
  (d y) / (d t) = f(t, y),#h(2em) y(t_0) = y_0
$
The algorithm works in steps similarly the Euler method in @euler_sec.

#let ni = $n+1$
$
&t_ni = t_n + h,\
&y_ni = y^*_n + 1/6 (k_1 + 2k_2 + 2k_3 + k_4)
$
where 
$
&k_1 = h f(t_n      , y^*_n         ),\
&k_2 = h f(t_n + h/2, y^*_n + k_1/2 ),\
&k_3 = h f(t_n + h/2, y^*_n + k_2/2 ),\
&k_4 = h f(t_n + h  , y^*_n + k_3   )
$

The Runge-Kutta algorithm is called a _fourth order algorithm_ as the function $f$ needs to be calculated four times, once for each of the $k_n$ values.
Each step of the function calculates approximations for each of the increments of $k_1, ..., k_4$, and then take the mean of those values as the approximation for the next step @dreyer_2017[p. 115].

The algorithm works by calculating each of the increments of $k$.
The first $k_1$ increment calculates the approximation the same as the Euler method talked about in @euler_sec.
Second increment $k_2$ then uses the same method as $k_1$, but this time calculates it at the half-point of the step, at a point where the linear function of  $k_1 dot t + y_0$ value would approximate to.
The third increment $k_3$ does the same as the second increment, but uses the linear function with a gradient of $k_2$ to calculate the point.
Finally fourth increment then uses the value of the linear function with a gradient of $k_3$ to calculate the approximate value at the end of the step.
The algorithm then takes the mean of all four increments, but using values of $k_2$ and $k_3$ twice, to calculate the approximate value at the end of the step.

#import "/src/figures/mod.typ": rk4_plot

#figure(
  caption: [Visualization of RK4 algorithm, calculating the next step approximation],
  rk4_plot
)<rk4>

Graphical representation of the algorithm can be seen in @rk4.
Red points represent each of the increments and their values as a vector, while the green point is the step value approximation.
Blue line represents the $y$ function; the solution to the problem.


#import "/src/figures/mod.typ": compare_e_v_rk,compare_e_v_rk_table
#let number_of_steps = 10


#figure(
  caption: [Comparison of Runge-Kutta and Euler method in preportion to a known solution],
  
  compare_e_v_rk(number_of_steps)
)<compare>

The power of the Runge-Kutta method comes is its improved accuracy over the Euler method. 
@compare shows that for big steps, Runge-Kutta algorithm gives better function approximations in comparison to using the Euler method.
@error_table shows that for step size of 2, Runge-Kutta algorithm keeps up with the function managing to stay under 20% error @error_foot rate, while the Euler method starts to fall of at the second step with almost 40% error 
#footnote[error rate was calculated by $"error" = x_o/ x_t - 1$, where $x_o$ is the observed value, and $x_t$ is the true value.]<error_foot>.




In practice the Runge-Kutta algorithm is used if only a few points are needed, that need high accuracy. This can happen in cases where a few $y$-values are needed to start the process in more sophisticated algorithms @dreyer_2017[p. 116].

#figure(
  caption: [Table of Runge-Kutta approximation in  comparison to Euler approximations and their errors relative to the solution to the problem $(d y)/(d x) = y - x$],
  compare_e_v_rk_table(number_of_steps)
)<error_table>


== Nelder-Mead method

The Nelder-Mead method also known as simplex search algorithm is an algorithm originally published in 1965 by Nelder and Mead.
It is one of the best known algorithms for multidimensional unconstrained optimization without derivatives @singer_2009.

The basic algorithm is popular in many fields of science, for his simplicity and ease of use.
In the 1970s the algorithm was being included in many major software libraries, and by the 1980s its popularity branded it under many names such as the "amoeba algorithm" @press_1992 and MATLAB's "fminsearch" @schreiber_2007.

The popularity of the algorithm prevails till this day, despite the recent advances in direct search method and the age of the algorithm @singer_2009.


The algorithm was created by modifying the original simplex-based direct search method created by Spendley @spendley_1962.
The original algorithm used two types of transformations to form a new simplex in each step.
In both of the transformations, the angles between edges in every simplex remained _constant_ throughout iteration, meaning the working simplex changed in size but _not_ shape.
The Nelder-Mead algorithm included two additional transformations - expansion and contraction, which allowed the simplex to additionally change its _shape_ @singer_2009.

=== Workings of the algorithm

#let points = $x_0, ...x_n in RR^n$

The method described in @nelder_1965 is a _simplex-based_ search method.
This means that the algorithm uses a simplex $S$ defined in $RR^n$ as the convex hull of $n + 1$ vertices #points (Examples seen in @simplex).
It is important that the initial working simplex S is _nondegenerate_, meaning that the the points #points must not lie on the same hyperplane @singer_2009.

#import "/src/figures/mod.typ": simplex_table

#figure(
  caption: [Examples of convex hull in different real n-dimensional spaces],
  simplex_table
)<simplex>


Given a nonlinear function $f : RR^n arrow RR$ and a simplex $$ the method calculates $f$ values at some points of $RR^n$
We define
- $p_i$ as a point in $RR^n$ of a given simplex $S$
- $y_i$ as the function value at $f(p_i)$
- $h$ as the suffix such that $y_h = max(y_i)$
- $l$ as the suffix such that $y_l = min(y_i)$
- $overline(p)$ is the centroid of the points with $i eq.not h$
- $[p_i p_j]$ as the distance from $p_i$ to $p_j$

At each stage in the process $p_h$ is replaced by a new point.
This is achieved by using one of the three operations;
_reflection_, _contraction_ and _expansion_.
Reflection of $p_h$ is denoted by $p^*$, and its coordinates are defined by the relation
$
p^* = (1 + alpha)overline(p) - alpha p_h
$
where $alpha$ is a positive constant, named the _reflection coefficient_ @nelder_1965.

Similarly we define _expansion_ of $p^*$ as
$
p^(**) = gamma p^* + (1 - gamma )overline(p)
$
where $gamma$ becomes the _expansion coefficient_.
If $gamma$ is replaced by $beta$ then _expansion_ becomes _contraction_ and $beta$ becomes the _contraction coefficient_, where its value lies between 0 and 1.


The Nelder-Mead method uses these operations in its algorithm following the graph in @nedelmead-alg.




#import "/src/figures/mod.typ": nedel_graph
#figure(
  caption: [Visualization of the algorithm as described in @nelder_1965[Fig. 1]],
  scale(nedel_graph,x: 80%, y: 80%)
)<nedelmead-alg>