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
  image("ESC251_HW5_Q2.png", width: 100%), caption: [_Feedback Control System for Problem 2_])
==

#pagebreak()

= Problem 3
Consider the feedback control system below:
#figure(
  image("ESC251_HW5_Q3.png", width: 100%), caption  : [_Feedback Control System for Problem 3_])

Firstly, notice the $H_1$ and $H_2$ blocks are in parallel relative to a summing block, so you can replace those two blocks as well as the summing block with $(H_1 - H_2)$.

Then, you can move the summing point of the positive feedback loop containing $G_1$ outside of the positive feedback loop containing $G_2$, requiring that we place $G_1G_2$ in the block instead, and move the summing block to the intersection of $(H_1 - H_2)$, $G_2$, and $C$.

This causes $G_2$ and $(frac(G_1, G_2, style: "skewed"))$ to be in parallel, therefore you can replace those two blocks as well as the summing block with $(G_2 + (frac(G_1, G_2, style: "skewed")) = (frac(G_1 + G_2^2, G_2, style: "skewed")))$.

We can now remove the loop containing $(frac(G_1 + G_2^2, G_2, style: "skewed"))$ and $(H_1 - H_2)$, replacing it with a block containing:
#no-num[$ =(frac(G_1 + G_2^2, G_2))(1 + (frac(G_1 + G_2^2, G_2))(H_1 - H_2))^(-1) $]
#no-num[$ =(frac(G_1 + G_2^2, G_2))(frac(G_2 + (G_1 + G_2^2)(H_1 - H_2), G_2))^(-1) $]
#no-num[$ =frac(G_2(G_1 + G_2^2), G_2(G_2 + (G_1 + G_2^2)(H_1 - H_2))) $]
#block(stroke: black, inset: 0.5em)[$ =frac((G_1 + G_2^2), G_2 + (G_1 + G_2^2)(H_1 - H_2)) $]

#pagebreak()

= Problem 4
Consider the feedback control system below:
#figure(
  image("ESC251_HW5_Q4.png", width: 100%), caption: [_Feedback Control System for Problem 4_])
Firstly, you can move the summing point of the negative feedback loop containing $H_3$ outside of the positive feedback loop containing $G_1$, requiring that we place $(frac(H_3, G_1, style: "skewed"))$ in the block instead, and move the summing block to the intersection between $G_4$, $Y$, and $H_2$.

Then, $G_1$ and $G_2$ are in series with one another, so we can replace both blocks with one block containing $G_1G_2$.

Additionally, you can move the origin of the negative feedback loop containing $H_3 / G_1$ the right of the block containing $G_4$, requiring that we place $(frac(H_3 , G_1 G_4, style: "skewed"))$ in the block instead.

Then, $G_3$ and $G_4$ are in series with one another, so we can replace both blocks with one block containing $G_3G_4$.

We can now remove the loop containing $G_3G_4$ and $H_2$, replacing it with a block containing $(frac(G_3G_4, 1 + G_3G_4H_2, style: "skewed"))$.

You can move the origin of the negative feedback loop containing $H_1$ the right of the block containing $(frac(G_3G_4,  1 + G_3G_4H_2, style: "skewed"))$, requiring that we place $(frac(H_1(1 + G_3G_4H_2),G_3G_4, style: 
"skewed"))$ in the block instead.

Now, the $G_1G_2$ and the $(frac(G_1G_2G_3G_4, 1 + G_3G_4H_2, style: "skewed"))$ are in series, so we can replace both blocks with one block containing:
#no-num[$ (G_1G_2G_3G_4) / (1 + G_3G_4H_2) $]

We can now remove the loop containing $(frac(G_1G_2G_3G_4, 1 + G_3G_4H_2, style: "skewed"))$ and $(frac(H_1(1 + G_3G_4H_2),G_3G_4, style: 
"skewed"))$, replacing it with a block containing:
#no-num[$ frac(G_1G_2G_3G_4, 1 + G_3G_4H_2)(1+(frac(G_1G_2G_3G_4, 1 + G_3G_4H_2))(frac(H_1(1 + G_3G_4H_2),G_3G_4)))^(-1) $]
#no-num[$ =frac(G_1G_2G_3G_4, 1 + G_3G_4H_2)(1 + G_1G_2H_1)^(-1) $]
#no-num[$ =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1)) $]
Finally, we can remove the loop containing $(frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1), style: "skewed"))$ and $(frac(H_3 , G_1 G_4, style: "skewed"))$ to get the transfer function of this control system:
#no-num[$ =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1))(1 + (frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1)))(frac(H_3 , G_1 G_4 )))^(-1) $]
#no-num[$ =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1))(1 + (frac(G_2G_3H_3, (1 + G_3G_4H_2)(1 + G_1G_2H_1))))^(-1) $]
#no-num[$ =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1))((frac((1 + G_3G_4H_2)(1 + G_1G_2H_1) + G_2G_3H_3, (1 + G_3G_4H_2)(1 + G_1G_2H_1))))^(-1) $]
#no-num[$ =frac(G_1G_2G_3G_4(1 + G_3G_4H_2)(1 + G_1G_2H_1), (1 + G_3G_4H_2)(1 + G_1G_2H_1)((1 + G_3G_4H_2)(1 + G_1G_2H_1) + G_2G_3H_3)) $]
#block(stroke: black, inset: 0.5em)[$ =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1) + G_2G_3H_3) $]
