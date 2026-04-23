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
  title: [*Homework #9*],
  instructors: ("Professor Wootton",
  "Time Spent: X Hours"),
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

= Problem 7.31
#figure(
  image("../ESC-201/Figures/Q7.31.png", width: 100%),
  caption: [
    _Problem Statement for Problem 7.31_
  ],
)<figure-1>
The following given figures are as follows:


Determine: 


#underline[Approach:]


#pagebreak()

= Problem 7.70
#figure(
  image("../ESC-201/Figures/Q7.70.png", width: 100%),
  caption: [
    _Problem Statement for Problem 7.70_
  ],
)<figure-3>
The following given figures are as follows:


Determine: 

#underline[Approach:]


#pagebreak()
= Problem 7.83
#figure(
  image("../ESC-201/Figures/Q7.83.png", width: 100%),
  caption: [
    _Problem Statement for Problem 7.83_
  ],
)<figure-4>
The following given figures are as follows:


Determine: 

#underline[Approach:]


#underline[Discussion:]


#pagebreak()

= Problem 7.87
#figure(
  image("../ESC-201/Figures/Q7.87.png", width: 100%),
  caption: [
    _Problem Statement for Problem 7.87_
  ],
)<figure-4>
The following given figures are as follows:


Determine:

#underline[Approach:]


#pagebreak()

= Problem 7.105
#figure(
  image("../ESC-201/Figures/Q7.105.png", width: 100%),
  caption: [
    _Problem Statement for Problem 7.105_
  ],
)<figure-4>
The following given figures are as follows:


Determine:

#underline[Approach:]

#pagebreak()

= Beam Bending Lab

#pagebreak()

= Appendix Code <app>
#v(0.5em)
The following Jupyter Notebook (attached to the homework submission at "ESC201-HW9.ipynb") was used for calculations.
#callisto.render(nb: json("ESC201-HW9.ipynb"))





