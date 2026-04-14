#import "conf.typ": conf
#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#import "@preview/meander:0.4.1"
#import "@preview/callisto:0.2.5"

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
  title: [*Homework #8*],
  instructors: ("Professor Wootton",
  "Time Spent: 4 Hours"),
  month: date.display("[month repr:long] [day],"),
  year: date.display("[year]"),
  doc,
)

// Document Contents


#align(center + horizon)[
  #text(size: 25pt)[Note that although all numbers present in this homework assignment are displayed with 2-4 significant digits, no rounding occurs until the final answer. \
  ]
]
#pagebreak()

= Problem 6.3
#figure(
  image("../ESC-201/Figures/Q6.3.png", width: 100%),
  caption: [
    _Problem Statement for Problem 6.3_
  ],
)<figure-1>
The following given figures are as follows:
#no-num[$ l_1 = l_2 = 0.020m, #h(1em) w_1 = 0.080m, #h(1em) s = 0.050m, #h(1em) w_2 = 0.120m, #h(1em) max(V) = 300N $]
#no-num[$ t = 2l_1 = 0.040m $]

Determine: 
    - $ max(V)$
    - $ max(tau)$

    #underline[Approach:]
    + Find the moment of inertia $I$ via superposition of the square box beam.
    + Consider the top plank $(l_2 "x" w_2)$ of the square beam. Assuming the square box beam is of uniform density, find $Q$ using $Q=A_1 overline(Y_1)$, where $overline(Y_1)$ is the distance from the neutral axis of the top plank and the neutral axis of the beam, and $A_1$ is the area o the top plank.
    + Find the maximum vertical shearing force exerted by the nail $q#sub[nail]$ using $(q = (Delta F) / (Delta x))$.
    + Rearrange the other $q$ equation $(q_"nail" = (V Q) / I)$ to find $max(V)$.
    + Find the first moment of the beam by adding the first moments of half of each of the side planks.
    + Find $tau#sub[max]$ using $(tau_"max" = (V Q) / (I t))$.

Recall that the moment of inertia of a rectangle is $(I = 1/12 b h^3)$.
Therefore, the moment of inertia of this square box beam is:
#let I = $ 1/12 w_2(2l_1 + w_1)^3 - 1/12 (w_2 - 2l_1)w_1^3 $
$ I = #I $
Assume the square box beam is of uniform density. Therefore, it's central axis lies at the geometric midpoint of the beam, $(overline(Y) = 60"mm")$. Additionally, the central axis of the top plank is $overline(Y') = 10"mm"$

Define $(overline(Y_1) := overline(Y) - overline(Y'))$.
Then:
$ Q_1 = A_1 overline(Y_1) $
Since there are two sets of nails on each side of the top plank of the beam, the max $q_"nail"$ corresponds with the allowable shearing force in each nail, i.e.:
$ q = (Delta F) / (Delta x) = (2V)/s $
Lastly:
#block(stroke: black, inset: 0.5em)[$ (q_"nail" = (V Q_1) / I) arrow.double (V = (q_"nail" I) / Q_1 = (2 V (#I)) / (s A_1 overline(Y_1))) $ $ V = 1386.667 "N" $]
Now, to find the first moment of inertia of the beam, use:
$ Q = Q_1 + 2(w_2 / 2)(l_1)overline(Y_2) $
where $overline(Y_2)$ is the neutral axis of the upper half of the side plank $(overline(Y_2) = 20 "mm")$.
Therefore, since the max shearing stress is associated with the maximum shearing force exerted on the nails: 
#block(stroke: black, inset: 0.5em)[$ max(tau) = (V Q) / (I t) = 3.8*10^5"Pa" $]

#pagebreak()

= Problem 6.15
#figure(
  image("../ESC-201/Figures/Q6.15.png", width: 100%),
  caption: [
    _Problem Statement for Problem 6.15_
  ],
)<figure-3>
The following given figures are as follows:
#no-num[$ sigma_"all" = 1750"psi", #h(1em) tau_"all" = 130"psi", #h(1em) l = 16"ft", #h(1em) w = 5"in" = 5/12"ft",#h(1em) p = 750 "lb/ft" $]

Determine: $min(h)$

#underline[Approach:]
+ Since the load is equally distributed across the beam, let $(P = p l)$.
+ Note that the maximum horizontal shear force $R$ would occur at either A or B, and use it to calculate the maximum internal bending moment $(M_"max" = 1/2 (l / 2)(R))$.
+ Find the necessary depth to accomodate the bending stress of the beam $h_b$ using $(M_"max" / sigma_"all" = S = 1/6 b h_b^2)$.
+ Find the necessary depth to accomodate the shear stress of the beam $h_b$ using $(tau_"max" = (3 R Q) / (I b))$.
+ Set $(min(h) = max({h_b, h_s}))$.
First, let:
$ P = w l $
Note that the maximum horizontal shear force $R$ would occur at either A or B, and since $p$ is equally distrbuted across the beam $(R = P / 2)$. Therefore (note $M_"max"$ needs to be converted to $"lb" dot "in"$):
$ M_"max" = 1/2 (l / 2)(R) $
Now, from the 3rd step in our approach:
$ (M_"max" / sigma_"all" = S = 1/6 w h_b^2) arrow.double (h_b = sqrt((6 M_"max")/(w sigma_"all")) = 14.053"in") $
Now, if we were to treat the upper half of the beam (from its front view) as a rectangle of uniform density, we can calculate its first moment about its neutral axis, as well as its moment of inertia:
$ Q = A overline(y) = 1/2(w)(h_s)(1/4 h_s) = 1/8 w h_s^2 $
$ I = 1/12 w h_s^3 $  
Additionally, from the 4th step in our approach:
$ (tau_"max" = (3 R Q) / (I b) = (3R) / (2 w h_s)) arrow.double (h_s = (3 R) / (2w tau_"max") = 13.846"in") $
Therefore:
#block(stroke: black, inset: 0.5em)[$ min(h) = max({h_b, h_s}) = 14.053"in" $]

#pagebreak()
= Problem 6.31
#figure(
  image("../ESC-201/Figures/Q6.31.png", width: 100%),
  caption: [
    _Problem Statement for Problem 6.31_
  ],
)<figure-4>
The following given figures are as follows:
#no-num[$ l_1 = 0.100"m",#h(1em) l_2 = 0.150"m",#h(1em) w_1 = 0.020"m",#h(1em) w_2 = 0.050"m",#h(1em) t = 0.100"m" $]
#no-num[$ tau_"max" = 350"kPa" = 350000"Pa" $]

Determine: $max(V)$

#underline[Approach:]
+ Find the moment of inertia of the beam $I$ via superposition.
+ Assuming that the beam is of uniform density, find its first moment $Q$ about its neutral axis using $(Q = A overline(y))$. 
+ Find $max(V)$ by rearranging $(tau_"max" = (V_"max" Q) / (I t)) $.
Recall that the moment of inertia of a rectangle is $(I = 1/12 b h^3)$. Then:
$ I = 1/12 ((2w_1 + l_1)(2w_2 + l_2)^3 + l_1 l_2^3) $
Assume that the beam is of uniform density. Then:
$ Q = A overline(y) = l_1 w_2((w_2 + l_2)/2) $
Therefore:
#block(stroke: black, inset: 0.5em)[$ (tau_"max" = (V_"max" Q) / (I t)) arrow.double (max(V) = (tau_"max" I t) / Q = 1.079*10^4 "N") $]

#underline[Discussion:]
The maximum vertical shearing force that can be exerted on the beam is approximately 10.8 kN. This is a reasonable value for a beam of this size and material, and it indicates that the beam can safely support a significant load without exceeding the maximum shear stress. However, it is important to note that this calculation assumes a uniform distribution of shear stress across the cross-section of the beam, which may not always be the case in real-world applications. Therefore, it is recommended to perform additional analysis or testing to ensure the safety and reliability of the beam under actual loading conditions.

#pagebreak()

= Problem 6.46
#figure(
  image("../ESC-201/Figures/Q6.46.png", width: 100%),
  caption: [
    _Problem Statement for Problem 6.46_
  ],
)<figure-4>
The following given figures are as follows:
#no-num[$ l_1 = w_1 = 0.102"m",#h(1em) d = 9.5"m",#h(1em) V = 240"kN", #h(1em) s = 0.012"m" $]
#no-num[$ l_2 = 0.012"m", #h(1em) w_2 = 0.400"m" $]

Determine:

#underline[Approach:]
+ Considering this angle as two rectangles so we can find the area relevant to the problem.
+ Calculate the centroid of the angles by taking the weighted average of its dimensions relative to its areas.
+ Find the moment of inertia of the angle by using parallel axis theorem and superposition.
+ Find the moment of inertia of the plate using the formula for the moment of inertia of a rectangle.
+ Find the moment of inertia of the object by addings the moments of inertia of the angle and the plate.
+ Find the first moment of the object via $(Q=A overline(y))$.
+ Find the force applied to the bolt using $(F_"bolt" = q s)$, where $(q=(V Q)/I)$.
Then, calculate $(t_"bolt")$ using $(t_"bolt" = F_"bolt" / A_"bolt")$.
First, we can consider the angle as two rectangles. The area of the angle is:
$ A = A_1 + A_2 - A_3 = 2l_1 d - d^2 $
The centroid of the angle can be found by taking the weighted average of its dimensions relative to its areas:
$ overline(y) = ((l_1 d)(d/2) + (l_1 d)(w_1/2) - (d^2)(d/2) ) / (A) $
Now, we can find the moment of inertia of the angle by using parallel axis theorem and superposition:
#no-num[$ I_a = (((102)(9.5)^3) / 12 + A_1(d/2 - overline(y))^2) + (((102)(9.5)^3) / 12 + A_2(w_1/2 - overline(y))^2) $]
$ - (((9.5)(9.5)^3) / 12 + A_3(d/2 - overline(y))^2) $
Then, find the moment of inertia of the plate using the formula for the moment of inertia of a rectangle:
$ I_"plate" = (w_2)(l_2)^3 / 12 $
Now, we can find the moment of inertia of the object by addings the moments of inertia of the angle and the plate:
$ I = I_a + I_"plate" $
Next, we can find the first moment of the object via $(Q=A overline(y))$:
$ Q = A (w_2 / 2 - overline(y)) $
$ F_"bolt" = q s = (V Q s) / I $
Finally, we can calculate $(tau_"bolt")$ using $(tau_"bolt" = F_"bolt" / A_"bolt")$:
- (((9.5)(9.5)^3) / 12 + A_3(d/2 - overline(y))^2)[$ tau_"bolt" = F_"bolt" / A_"bolt" = (V Q s) / (I A_"bolt") = 8.33*10^6 "Pa" $]

#pagebreak()

= Appendix Code <app>
#v(0.5em)
The following Jupyter Notebook (attached to the homework submission at "ESC201_HW7.ipynb") was used for calculations.
#callisto.render(nb: json("ESC201_HW8.ipynb"))





