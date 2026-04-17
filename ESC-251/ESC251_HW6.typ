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
4/17/2026 \ 
#align(center)[*#underline[Homework 6]*]

= Problem 1
#figure(
  image("ESC251_HW6_Q1.png", width: 100%), caption: [_Problem Statement for Problem 1_])
==
Assume the mass is at dynamic equilibrium.

Note that we define the positive x-direction to be to the right ($+hat(i)$), and the positive y-direction to be upwards ($+hat(j)$). 

By N2L, we can characterize the system in the following way:
$ sum F_y = m dot.double(x) = F_g -F_b - F_x = m g -b dot(x) - a x^3 $
Therefore, we can express the motion of the system with the following differential equation:
#block(stroke: black, inset: 0.5em)[
#no-num[$ 40 "N" = m g = m dot.double(x) + b dot(x) + a x^3 = 4dot.double(x) + 2dot(x) + 10x^3 $]
$ => (2dot.double(x) + dot(x) + 5x^3 = 20 "cm") $]
==
Let  $((dot(x) = 0) and (dot.double(x) = 0))$. Then, we can solve for the equilibrium points of the system:
#block(stroke: black, inset: 0.5em)[
#no-num[$ 5x^3 = 20 "cm" $]
$ => ((x^3 = 4"cm"^3) => (x = (4 "cm")^(1/3) approx 1.587 "cm")) $
]
==
Let:
$ x = overline(x) + hat(x) $
where $overline(x)$ is the mass' equilibrium position $(overline(x) approx 1.587 "cm")$ and $hat(x)$ is the mass' deviation from that equilibrium position.

Considering a first-order Taylor expansion, we can approximate the 
==
a
#pagebreak()

= Problem 2
#figure(
  image("ESC251_HW6_Q2.png", width: 100%), caption: [_Problem Statementfor Problem 2_])
==
Assume the contact between the skis and the snow is frictionless.

Consider the plane that the skier is traveling on. Note that we define the positive x-direction to be ($hat(x) = sqrt(3) / 2 hat(i) - 1/2 hat(j)$), and the positive y-direction to be ($hat(y) = 1/2 hat(i) + sqrt(3) / 2 hat(j) $). 

By N2L, we can characterize the system in the following way:
$ sum F_hat(x) = m dot(v) = (m g) / cos(theta) $
==

==

