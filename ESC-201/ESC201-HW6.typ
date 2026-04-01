#import "conf.typ": conf
#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#import "@preview/meander:0.4.1"

#show figure: set block(below: (2.0em))
#show columns: set text(size: 10pt)
#set heading(numbering: "1.")
#show heading: set text(size: 18pt, weight: "bold")
#show figure: set block(below: (2.0em))

#set math.equation(numbering: "(1)")
#let no-num(body) = math.equation(block: true, numbering: none, body)

#let date = datetime.today()
#show table.cell.where(y: 0): set text(weight: "bold")

// Document Parameters
#show: doc => conf(
  course_code: [ESC201],
  course_title: [Mechanics of Materials],
  course_color: black,
  authors: ("Joshua Davidov",),
  title: [*Homework #6*],
  instructors: ("Professor Wootton",
  "Time Spent: 4 Hours"),
  month: date.display("[month repr:long] [day],"),
  year: date.display("[year]"),
  doc,
)

// Document Contents


#align(center + horizon)[
  #text(size: 25pt)[Note that although all numbers present in this homework assignment are displayed with 2-4 significant digits, no rounding occurs until the final answer. \
  I apologize for the messy handwriting in my previous assignment, I hope that this medium is easier for you to parse through.
  ]
]
#pagebreak()

= Problem 4.51
#figure(
  image("../ESC-201/Figures/Screenshot 2026-03-29 at 19-25-49 HW6_2025.pdf.png", width: 100%),
  caption: [
    _Problem Statement for Problem 4.51_
  ],
)<figure-1>
The following given figures are as follows:
#no-num($ d_s = 5/8 "in", #h(1em) d = 4 "in", #h(1em)  l = 5.5 "in", #h(1em)  w = 6 "in", #h(1em) E_s = 29*10^6 "psi", #h(1em) E_c = 3*10^6 "psi",$) 
#no-num($ sigma#sub[all, c] = 1.4*10^3 "psi", #h(1em) sigma#sub[all, s] = 20 "ksi" = 2*10^4 "psi" $)
Determine: $max(M#sub[ft])$

#let fig2 = [
  #figure(
    image("../ESC-201/Figures/Screenshot 2026-03-29 at 20-28-03 ESC201 Mechanics of Materials.png", width: 50%),
    caption:[_Drawing of Equivalent System_]
  )<figure-2>
]
#underline[Approach:]
#meander.reflow({
  import meander: *

  // Place as many obstacles as you want.
  placed(top + right, 
  boundary: contour.margin(0.4cm),
  fig2)

  // The container wraps around all.
  container()

  // The content is automatically threaded through
  // the segmented container.
  content[

    1. Express the system with two rectangles seperated by a factor of $(d -x)$.
    2. Calculate the ratio $(n = E_s / E_c)$.
    3. Locate the neutral axis $x$ by solving the equation: #no-num($ 1/2 l x^2 - n A_s (d - x)  = 0 $) where $(A_s = pi / 4 (d_s)^2)$.
    4. Find the moment of inertia of the sys: #no-num($I = 1/3 l x^3  + n A_s (d - x)^2 $)
    5. Rearrange the equation $(sigma = (n M y) / I)$ into an equation for $M$ to determine $M_s$ and $M_c$.
    6. Let $max(M) = min({M_s, M_c})$.
    7. Since $M$ is the largest bending moment per width $l$, calculate the largest bending moment per foot of width $M#sub[ft]$ with $(M#sub[ft] = (12/l)M)$.
  ]
})

Define $n$ and $A_s$ as: 
$ n := E_s / E_c, #h(1em) A_s := pi / 4 (d_s)^2 $
Then, using the appropiate given figures, we can determine $x$ using the quadratic formula (note that this computation was done using the sympy Python library, see @app[the Appendix Code in Section]):
$ (1/2 l x^2 - n A_s (d - x) = 0) => ((x = -2.685) or (x = 1.607)) $
Note that $x$ cannot be a negative value (as it would have no physical meaning in the context of this problem), so let $x=1.607 "in"$.

Then, the moment of inertia of the system is:
$ I = 1/3 l x^3  + n A_s (d - x)^2 $
Note that:
$ (sigma = (n M y) / I) => (M = (I sigma) / (n y)) $<eq-4>
Therefore, by using @eq-4 relative to concrete $((n = 1) and (y = x) and (sigma = sigma#sub[all, c]))$:
$ M_c = (I sigma) / (n y) = ((1/3 l x^3  + n A_s (d - x)^2)(sigma#sub[all, c])) / (x) = 2.143 * 10^4 "lb" dot "in" $<eq-5>
Additionally, by using @eq-4 relative to steel $((y = 4-x) and (sigma = sigma#sub[all, s]))$:
$ M_s = (I sigma) / (n y) = ((1/3 l x^3  + n A_s (d - x)^2)(sigma#sub[all, s])) / (n(4-x)) = 2.126 * 10^4 "lb" dot "in" $
Thus, the largest bending moment $M$ per width $l$ is $(M = 2.126 * 10^4 "lb" dot "in")$.
Therefore, the largest bending moment $M$ per foot of width is:
#block(stroke: black, inset: 0.5em)[$ M#sub[ft] = ((12 "in") / (1 "ft")) (M / l) = *(4.638*10^3) ("lb" dot "in") / "ft" $]

#underline[Discussion:]
Note that $(M_s < M_c)$, meaning that the allowable bending moment for the reinforced concrete slab is governed by the steel stress limit. Also, since $(M_s approx M_c)$, it implies that the design of this slab was efficient, so that the steel and concrete allowable stresses are reached at about the same moment.


#pagebreak()  

= Problem 4.65
#figure(
  image("../ESC-201/Figures/Screenshot 2026-03-29 at 19-25-57 HW6_2025.pdf.png", width: 100%),
  caption: [
    _Problem Statement for Problem 4.65_
  ],
)<figure-3>
The following given figures are as follows:

#no-num($ r = 15 "mm" = 0.015 "m", #h(1em) D = 150 "mm" = 0.150 "m", #h(1em)  d = 100 "mm" = 0.100 "m", $) 
#no-num($ w = 18 "mm" = 0.018 "m", #h(1em) sigma#sub[all] = 80 "MPa" = 8*10^7 "Pa" $) 
Determine: 

a) $max(M_a)$

b) $max(M_b)$

#underline[Approach:]
1. Calculate $(D / d)$ and $(r / D)$ ratios.
2. Using Fig 4.31 and Fig 4.32 from the textbook, determine the stress concentrations for both bar configurations $K_a$ and $K_b$.
3. To find $max(sigma)$ calculate the minimum moment of inertia of both bars with $(I = 1/12 w d^3 )$. 
4. Rearrange $ (sigma = (K M d) / (2 I))$ into an equation for $M$ to find the maximum moments for both bar configurations.

First, consider:
$ D/d = 1.5, #h(1em) r/d = 0.15 $
Then, by Fig 4.31 and Fig 4.32, respectively:
$ K_b = 1.58, #h(1em) K_a = 1.92 $
Also, to maximize the couple M, minimize the moment of inertia of the relevant cross section of the bar (which is the same cross section for both bar configurations), thus let:
$ I = 1/12 w d^3 $
Note that:
$ (sigma = (K M d) / (2I)) => (M = (2sigma I)/(K d)) $

Then, for configuration (a):
#block(stroke: black, inset: 0.5em)[$ max(M_a) = (2 sigma#sub[all]I) / (K_a d) = (1.250*10^3) "N" dot "m" $]
Lastly, for configuration (b):
#block(stroke: black, inset: 0.5em)[$ max(M_b) = (2 sigma#sub[all]I) / (K_b d) = (1.519*10^3) "N" dot "m" $]


#pagebreak()
= Problem 4.113
#figure(
  image("../ESC-201/Figures/Screenshot 2026-03-29 at 19-26-05 HW6_2025.pdf.png", width: 100%),
  caption: [
    _Problem Statement for Problem 4.113_
  ],
)<figure-4>
The following given figures are as follows:

#no-num($ l_1 = 0.025 "m",#h(1em) w_1 = 0.250 "m",#h(1em) l_2 = 0.250 "m",#h(1em) w_2 = 0.025 "m",#h(1em) d = 0.300 "m",  $) 
#no-num($ sigma#sub[all, c] = -80 "MPa" = -8*10^7 "Pa", #h(1em) sigma#sub[all, t] = 40 "MPa" = 4*10^7 "Pa" $)

#let fig5= [
  #figure(
    image("../ESC-201/Figures/Screenshot 2026-03-29 at 23-28-34 ESC201 Mechanics of Materials.png", width: 50%),
    caption:[_Free Body Diagram of Cross
    Section of Press_]
  )<figure-5>
]
#meander.reflow({
  import meander: *

  // Place as many obstacles as you want.
  placed(top + right, 
  boundary: contour.margin(0.4cm),
  fig5)

  // The container wraps around all.
  container()

  // The content is automatically threaded through
  // the segmented container.
  content[
    Determine: $max(P)$

    #underline[Approach:]
    1. Find the centroid $y_n$ of 1 and 2 by taking their midpoints (assuming that the object has uniform density $(delta  =(1) "kg" / "m"^2)$).
    2. Take weighted averages of centroids of 1 and 2 with respect to their areas to find neutral axis $overline(Y)$.
    3. Find moment of inertia $I_n$ of 1 and 2 via. $(I_n = 1/12 b h^3 + A_n d_n^2)$, then find the total moment of inertia $I$ with $(I = I_1 + I_2)$.
    4. To consider the eccentric loading of the hydraulic press, let $(M_e = -P e)$, where $(e = l_1 + l_2 + d/2 - overline(Y))$.
    5. Considering the stress applied to 1 as the compressive stress and the stress applied to 2 as the tensile stress, use the total stress equation $(sigma_n = P_n / A - (M y) / I)$ to find an equation for P, and calculate the maximum force $P$ for both parts of the press, $P_1$ and $P_2$.
    6. Let $(max(P) = min({P_1, P_2})) $.
  ]
})

Let $(y_1 = 1/2 l_2 )$ and $(y_2 = l_2 + 1/2 l_1)$.

Also, let $(A_1 = w_1l_1)$, $(A_2 = w_2 l_2)$, and $(A = A_1 + A_2)$.

Then, 
$ overline(Y) = (A_1y_1 + A_2y_2) / (A_1 + A_2) $

Note:
$ I_1 = 1/12 l_1 w_1^3 + A_1(y_1 - overline(Y))^2 $
$ I_1 = 1/12 l_2 w_2^3 + A_2(y_2 - overline(Y))^2 $
Therefore, $(I = I_1 + I_2)$.
Let $(M_e := -P e)$, where $(e = l_1 + l_2 + d - overline(Y))$.

Consider the stress applied to 1 as the compressive stress and the stress applied to 2 as the tensile stress.

Considering the equation for $sigma_n$, we can get the following equivalent equation:
$ (sigma_n = P_n / A - (M y) / I = P_n / A + (P_n e y) / I = P_n (1/A + (e y) / I)) => (P_n = sigma_n (1/A + (e y) / I)^(-1)) $

Therefore, for section 1, where $(y = -overline(Y))$:
$ P_1 = sigma#sub[all, c] (1/A + (-e overline(Y)) / I)^(-1) = 1.106*10^5 "N" $

Also, for section 2, where $(y = l_1 + l_2 - overline(Y))$
$ P_1 = sigma#sub[all, c] (1/A + (-e (l_1 + l_2 - overline(Y))) / I)^(-1) = 9.596*10^4 "N" $

Therefore,
#block(stroke: black, inset: 0.5em)[$ max(P) = min({P_1, P_2}) = 9.596*10^4 "N" $]
#pagebreak()

= Appendix Code <app>






