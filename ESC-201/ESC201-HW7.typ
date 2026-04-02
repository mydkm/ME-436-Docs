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
  title: [*Homework #7*],
  instructors: ("Professor Wootton",
  "Time Spent: X Hours"),
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

= Problem 5.10
#figure(
  image("../ESC-201/Figures/Screenshot 2026-04-01 at 00-46-36 HW7_2026.pdf.png", width: 100%),
  caption: [
    _Problem Statement for Problem 5.10_
  ],
)<figure-1>
The following given figures are as follows:


#let fig2 = [
  #figure(
    image("../ESC-201/Figures/Screenshot 2026-03-29 at 20-28-03 ESC201 Mechanics of Materials.png", width: 50%),
    caption:[]
  )<figure-2>
]
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
    Determine: 

    #underline[Approach:]

    INSERT APPROACH HERE
  ]
})

#pagebreak()  

= Problem 5.15
#figure(
  image("../ESC-201/Figures/Screenshot 2026-04-01 at 00-46-54 HW7_2026.pdf.png", width: 100%),
  caption: [
    _Problem Statement for Problem 5.15_
  ],
)<figure-3>
The following given figures are as follows:


Determine: 

#underline[Approach:]



#pagebreak()
= Problem 5.69
#figure(
  image("../ESC-201/Figures/Screenshot 2026-04-01 at 00-47-13 HW7_2026.pdf.png", width: 100%),
  caption: [
    _Problem Statement for Problem 5.69_
  ],
)<figure-4>
The following given figures are as follows:


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
    Determine:

    #underline[Approach:]
    INSERT APPROACH HERE
  ]
})

// Let $(y_1 = 1/2 l_2 )$ and $(y_2 = l_2 + 1/2 l_1)$.

// Also, let $(A_1 = w_1l_1)$, $(A_2 = w_2 l_2)$, and $(A = A_1 + A_2)$.

// Then, 
// $ overline(Y) = (A_1y_1 + A_2y_2) / (A_1 + A_2) $

// Note:
// $ I_1 = 1/12 l_1 w_1^3 + A_1(y_1 - overline(Y))^2 $
// $ I_1 = 1/12 l_2 w_2^3 + A_2(y_2 - overline(Y))^2 $
// Therefore, $(I = I_1 + I_2)$.
// Let $(M_e := -P e)$, where $(e = l_1 + l_2 + d - overline(Y))$.

// Consider the stress applied to 1 as the compressive stress and the stress applied to 2 as the tensile stress.

// Considering the equation for $sigma_n$, we can get the following equivalent equation:
// $ (sigma_n = P_n / A - (M y) / I = P_n / A + (P_n e y) / I = P_n (1/A + (e y) / I)) => (P_n = sigma_n (1/A + (e y) / I)^(-1)) $

// Therefore, for section 1, where $(y = -overline(Y))$:
// $ P_1 = sigma#sub[all, c] (1/A + (-e overline(Y)) / I)^(-1) = 1.106*10^5 "N" $

// Also, for section 2, where $(y = l_1 + l_2 - overline(Y))$
// $ P_1 = sigma#sub[all, c] (1/A + (-e (l_1 + l_2 - overline(Y))) / I)^(-1) = 9.596*10^4 "N" $

// Therefore,
// #block(stroke: black, inset: 0.5em)[$ max(P) = min({P_1, P_2}) = 9.596*10^4 "N" $]
#pagebreak()

= Problem 5.82
#figure(
  image("../ESC-201/Figures/Screenshot 2026-04-01 at 00-47-29 HW7_2026.pdf.png", width: 100%),
  caption: [
    _Problem Statement for Problem 5.69_
  ],
)<figure-4>
The following given figures are as follows:


#let fig5= [
  #figure(
    image("../ESC-201/Figures/Screenshot 2026-04-01 at 00-47-29 HW7_2026.pdf.png", width: 50%),
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
    Determine:

    #underline[Approach:]
    INSERT APPROACH HERE
  ]
})

#pagebreak()

= Appendix Code <app>
#v(0.5em)
The following Jupyter Notebook (attached to the homework submission at "ESC201_HW7.ipynb") was used for calculations.
#callisto.render(nb: json("ESC201_HW6.ipynb"))





