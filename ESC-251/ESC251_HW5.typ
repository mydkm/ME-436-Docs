#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#set page(
  numbering: "1",
)
#set document(
  title: []
)
#show columns: set text(size: 10pt)
#set heading(numbering: "1.") 
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
3/25/2026 \ 
#align(center)[*#underline[Homework 5]*]

= Problem 1 (B-5-29)
#let xstate = $mat(delim: "[",
x_1;
x_2)$
#let ystate = $mat(delim: "[",
y_1;
y_2)$
#let ustate = $mat(delim: "[",
u_1;
u_2)$
Consider the system defined by:
$ mat(delim: "[",
dot(x)_1;
dot(x)_2) 
= 
mat(delim: "[",
0, 1;
-25, -4) xstate + 
mat(delim: "[",
1, 1;
0, 1)
ustate $
$ ystate  =
imat(delim: "[", fill: "0", 2) xstate + 
imat(delim: "[", fill: "0", 2) ustate $
To calculate the transfer matrix of this system, solve $(bold(G)(s) = bold(C)(s bold(I)_2 - bold(A))^(-1) + bold(D))$, where:
#let A = $mat(delim: "[",
0, 1;
-25, -4)$
#let B = $mat(delim: "[",
1, 1;
0, 1)$
#let C = $imat(delim: "[", fill: "0", 2)$
#let D = $imat(delim: "[", fill: "0", 2)$
$ bold(A) = #A, #h(1em) bold(B) = #B, #h(1em) bold(C) = bold(D) = #D = bold(I)_2 $
First, compute $(s bold(I)_2 - bold(A))$:
$ s bold(I)_2 - bold(A) = mat(delim: "[",
s, -1;
25, s + 4) $
Next, compute the inverse of this matrix:
$ (s bold(I)_2 - bold(A))^(-1) = (1 / (s^2 + 4s + 25)) mat(delim: "[",
s + 4, 1;
-25, s) $
Finally, we can compute the transfer matrix of the system:
$ bold(G)(s) = #C ((1 / (s^2 + 4s + 25)) mat(delim: "[",
s + 4, 1;
-25, s)) #B + #D $
$ =(1 / (s^2 + 4s + 25)) 
mat(delim: "[",
s + 4, 1;
-25, s)#B  + #D $
$ = (1 / (s^2 + 4s + 25))
mat(delim: "[",
s+4, s+5;
-25, s-25) + #D$
$ = mat(delim: "[",
(s+4) / (s^2 + 4s + 25), (s+5) / (s^2 + 4s + 25);
-25 / (s^2 + 4s + 25), (s-25) / (s^2 + 4s + 25)) + #D$
$ = mat(delim: "[",
((s+4) + (s^2 + 4s + 25)) / (s^2 + 4s + 25), (s+5) / (s^2 + 4s + 25);
-25 / (s^2 + 4s + 25), ((s-25) + (s^2 + 4s + 25)) / (s^2 + 4s + 25)) $
#block(stroke: black, inset: 0.5em)[$ = mat(delim: "[",
(s^2 + 5s + 29) / (s^2 + 4s + 25), (s+5) / (s^2 + 4s + 25);
-25 / (s^2 + 4s + 25), (s^2 + 4s) / (s^2 + 4s + 25)) $]
#pagebreak()

= Problem 2
Consider the feedback control system below:
#figure(
  image("../ESC-201/Figures/Screenshot 2026-04-01 at 00-47-29 HW7_2026.pdf.png", width: 100%), caption: [_Feedback Control System for Problem 2_])
==

#pagebreak()

= Problem 3
Consider the feedback control system below:
#figure(
  image("../ESC-201/Figures/Screenshot 2026-04-01 at 00-47-29 HW7_2026.pdf.png", width: 100%), caption  : [_Feedback Control System for Problem 3_])


#pagebreak()

= Problem 4
Consider the feedback control system below:
#figure(
  image("../ESC-201/Figures/Screenshot 2026-04-01 at 00-47-29 HW7_2026.pdf.png", width: 100%), caption: [_Feedback Control System for Problem 4_])

#pagebreak()
