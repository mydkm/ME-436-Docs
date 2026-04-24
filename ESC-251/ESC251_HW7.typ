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

We could model the volumetric flow rate of the liquid by taking the difference of the rate entering and leaving the system.
#pagebreak()

= Problem 2
#figure(
  image("ESC251_HW7_Q2.png", width: 100%), caption: [_Problem Statementfor Problem 2_])
==

#pagebreak()

= Problem 3
#figure(
  image("ESC251_HW7_Q2.png", width: 100%), caption: [_Problem Statementfor Problem 3_])
==

#pagebreak()

= Problem 4
#figure(
  image("ESC251_HW7_Q2.png", width: 100%), caption: [_Problem Statement for Problem 4_])
==

#pagebreak()

