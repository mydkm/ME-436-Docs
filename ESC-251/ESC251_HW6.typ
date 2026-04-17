#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#set page(
  numbering: "1",
)
#set document(
  title: []
)
#show columns: set text(size: 10pt)
#set heading(numbering: "1.a.i") 
#show heading: set text(size: 12pt, weight: "bold")
#show figure: set block(below: (2.0em))

#set math.equation(numbering: "(1)")
#let no-num(body) = math.equation(block: true, numbering: none, body)

#let date = datetime.today()
#show table.cell.where(y: 0): set text(weight: "bold")

// Document Contents
Joshua Davidov \ 
ESC251: Systems Engineering \ 
Professor Baglione \ 
4/17/2026 \ 
#align(center)[*#underline[Homework 6]*]

= Problem 1
#figure(
  image("ESC251_HW6_Q1.png", width: 100%), caption: [_Feedback Control System for Problem 2_])
#pagebreak()

= Problem 2
Consider the feedback control system below:
#figure(
  image("ESC251_HW6_Q2.png", width: 100%), caption: [_Feedback Control System for Problem 2_])
==

