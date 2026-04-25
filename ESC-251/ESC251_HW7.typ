#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#set page(
  numbering: "1",
)
#set document(
  title: []
)
#show columns: set text(size: 10pt)
#set heading(numbering: "1.a.i.") 
#show heading: set text(size: 12pt, weight: "bold")
#show heading: set block(spacing: 0.75em)
#show figure: set block(below: 2.0em)

#set math.equation(numbering: "(1)")
#let no-num(body) = math.equation(block: true, numbering: none, body)

#let date = datetime.today()
#let boxed(content) = block(
  stroke: black,
  inset: 0.5em,
)[
  #content
]
#show table.cell.where(y: 0): set text(weight: "bold")

// Document Contents
Joshua Davidov \ 
ESC251: Systems Engineering \ 
Professor Baglione \ 
4/23/2026 \ 
#align(center)[*#underline[Homework 7]*]

= Problem 1
#figure(
  image("ESC251_HW7_Q1.png", width: 100%), caption: [_Problem Statement for Problem 1_])
==

We could model the volumetric flow rate of the liquid by taking the difference of the rate entering and leaving the system:
#block(stroke: black, inset: 0.5em)[
  #no-num[$ A(dv(h, t)) = q_"in" - q_"out" = q_"in" - k sqrt(h) $]
  $ A(dv(h, t)) + k sqrt(h) = q_"in" $<q1-govern>
  ]

==
Let:
$ h = overline(h) + hat(h) $<q1-h-decomp>
where $overline(h)$ is the tank's equilibrium head, and $hat(h)$ is the deviation from that equilibrium head.
Also, let:
$ q_"in" = overline(q_"in") + hat(q_"in") $<q1-q-decomp>
where $overline(q_"in")$ is the equilibrium inflow rate so that $(overline(q_"in") = k sqrt(overline(h)))$, and $hat(q_"in")$ is the deviation from that equilibrium inflow rate.

Considering a first-order Taylor expansion, we can approximate $q_"out"$ as follows:
$ q_"out" = k sqrt(h) approx k sqrt(overline(h)) + frac(k , 2 sqrt(overline(h)))(h - overline(h)) = k sqrt(overline(h)) + frac(k , 2 sqrt(overline(h)))hat(h) $<q1-linear>
Therefore, after substituting @q1-linear and @q1-h-decomp into @q1-govern, we can express the system's governing equation as follows:
$ q_"in" = A dv((overline(h) + hat(h)), t) + k sqrt(overline(h) + hat(h)) approx A dv((overline(h) + hat(h)), t) + k sqrt(overline(h)) + frac(k , 2 sqrt(overline(h)))hat(h) $
Now, given $((overline(q_"in") = k sqrt(overline(h))) and (overline(h) "is a constant"))$, we can express the system's governing equation in terms of the deviations from equilibrium as follows:
#let q1-govern-linear = $ q_"in" = A dv(hat(h), t) + frac(k , 2 sqrt(overline(h)))hat(h) $
#block(stroke: black, inset: 0.5em)[$ #q1-govern-linear $<q1-govern-linear>]
==
Let $((overline(h) = 15.3 "cm") and (overline(q_"in") = 23.7 frac("cm"^3, "s", style: "horizontal")) and (A = 205 "cm"^3))$.
Firstly, let us determine k by substituting the given values into the equilibrium condition:
$ (overline(q_"in") = k sqrt(overline(h))) => (k = frac(overline(q_"in"), sqrt(overline(h)))) $<q1-k>
Recall that the time constant of a first-order system $tau$ can be expressed in the following way:
#no-num[$ tau (dv(y, t)) + y = K u(t) $]
for some input $u(t)$, output $y$, and gain $K$.

Next, let us rearrange @q1-govern-linear to express it in the form of the previous equation:
$ (#q1-govern-linear) => (frac(2 sqrt(h), k)(q_"in") = frac(2A sqrt(overline(h)), k)(dv(hat(h), t)) + hat(h)) $
Therefore, we can solve for the  time constant $tau$ of the system using our previously given values and @q1-k:

#block(stroke: black, inset: 0.5em)[$ 
tau = frac(2A sqrt(overline(h)), k) = 2A sqrt(overline(h)) ((sqrt(overline(h))) / (overline(q_"in"))) = (2A overline(h)) / (overline(q_"in")) = 264.68 "s" 
$]

#pagebreak()
= Problem 2
#figure(
  image("ESC251_HW7_Q2.png", width: 100%), caption: [_Problem Statement for Problem 2_])
Here the given values from the problem statement:
$ h_2  = 30 "m", #h(1em) A_1 = 50 "m"^2, #h(1em) A_2  =0.005 "m"^2,#h(1em) R = (100) frac("s", "m"^2, style: "horizontal") $
==
Consider the tank piecewise; consider part 1 to be the portion of the tank with cross-sectional area $A_1$ and part 2 to be the portion of the tank with cross-sectional area $A_2$.

Note, we can express $q_"out"$ for each part of the system generally as follows:
#no-num[$ q_"out" = frac(h_"net", R) $]

Also, since parts 1 and 2 of the tank are connected to one another, $(q_"in, 1" = q_"in, 2" = q_"in")$

So, we could model the volumetric flow rate of the liquid by taking the difference of the rate entering and leaving parts 1 and 2 of the system, respectively:
#boxed[
$
A_1 (dv(h_1, t)) = q_"in" - frac(h_1(t) + h_2, R)  
$<q2-govern-1>
$
A_2 (dv(h_2, t)) = q_"in" - frac(h_2(t), R)  
$<q2-govern-2>
]
==
Let $((h_1(0) + h_2(0) = 10 "m") and (q_"in"(0) = (0) frac("m"^3, "s", style: "horizontal")))$.

Thus, we can plug in the initial conditions into @q2-govern-1 to get the following:
$ A_1(dv(h_1, t)) = - frac(h_1(t) + h_2, R) $
This is a seperable equation! Let us rearrange it so that we can solve it via integration:
$ (1 / (h_1(t) + h_2))dv(h_1, t) = - 1 / (A_1 R) $<q2-sep-1>
We can integrate both sides of @q2-sep-1 from $(t=0)$ to some arbitrary $(t = t')$ to get the following:
==


#pagebreak()

= Problem 3
#figure(
  image("ESC251_HW7_Q3.png", width: 100%), caption: [_Problem Statement for Problem 3_])
==

#pagebreak()

= Problem 4
#figure(
  image("ESC251_HW7_Q4.png", width: 100%), caption: [_Problem Statement for Problem 4_])
==

#pagebreak()

