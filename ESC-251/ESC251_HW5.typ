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
-25, s-25) + #D $
$ = mat(delim: "[",
(s+4) / (s^2 + 4s + 25), (s+5) / (s^2 + 4s + 25);
-25 / (s^2 + 4s + 25), (s-25) / (s^2 + 4s + 25)) + #D $
$ = mat(delim: "[",
((s+4) + (s^2 + 4s + 25)) / (s^2 + 4s + 25), (s+5) / (s^2 + 4s + 25);
-25 / (s^2 + 4s + 25), ((s-25) + (s^2 + 4s + 25)) / (s^2 + 4s + 25)) $
#block(stroke: black, inset: 0.5em)[$ = mat(delim: "[",
(s^2 + 5s + 29) / (s^2 + 4s + 25), (s+5) / (s^2 + 4s + 25);
-25 / (s^2 + 4s + 25), (s^2 + 4s) / (s^2 + 4s + 25)) = (1 / (s^2 + 4s + 25)) 
mat(delim: "[",
s^2 + 5s  + 29, s + 5;
-25, s^2 + 4s) $]
#pagebreak()

= Problem 2
Consider the feedback control system below:
#figure(
  image("ESC251_HW5_Q2.png", width: 100%), caption: [_Feedback Control System for Problem 2_])
==
Per the block diagram, define the following Laplace space functions:
#let E = $ R(s) - B(s) $
$ E(s) = R(s) - B(s) $
$ U(s) = C(s)E(s) = C(s)(#E) $
#let U = $ C(s)E(s) $
$ U'(s) = U(s) + D(s) = #U + D(s) $
#let Uprime = $ #U + D(s) $ 
$ Y(s) = P(s) U'(s) = P(s)(#Uprime) $
$ B(s) = H(s)(Y(s) + N(s)) $
#let B = $ H(s)(Y(s) + N(s)) $
where $U'$ is the function directly to th left of the $P(s)$ block.

Therefore, we can do a long sequence of algebraic manipulations to find the requested transfer functions:
$ Y = P (C E + D)  $
$ E = R - B = R - H(Y + N) $ 
$ arrow.double (Y = P[C(R - H(Y + N)) + D]) $
$ Y = P C R - P C H Y - P C H N  + P D $
$ arrow.double (Y(1 + P C H) = P C R - P C H N  + P D) $
$ arrow.double (Y = (P C R - P C H N  + P D) / (1 + P C H)) $ 
$ arrow.double (Y = ((P C) / (1 + P C H)) R - ((P C H ) / (1 + P C H))N + ((P) / (1 + P C H))D) $
#block(stroke: black, inset: 0.5em)[$ ((Y(s)) / (R(s)) = (P C) / (1 + P C H)),#h(1em) ((Y(s)) / (N(s)) = -((P C H ) / (1 + P C H))),#h(1em) ((Y(s)) / (D(s)) = ((P) / (1 + P C H))) $]
We can also consider $E$ directly to find the remaining two transfer functions, when paired with extra constraints:

Let ($(N =0) and (D = 0)$):
$ E = R - H(Y + N) = R - H Y  $
#block(stroke: black, inset: 0.5em)[$ (E(s)) / (R(s)) = 1 - H (Y / R) = 1 - H((P C) / (1 + P C H)) = 1 / (1 + P C H) $]
Let ($(N = 0) and (R = 0)$):
$ E = R - H(Y + N) = - H Y  $
#block(stroke: black, inset: 0.5em)[$ (E(s)) / (D(s)) = - H (Y / D) = - H ((P) / (1 + P C H)) = - (H P) / (1 + P C H) $]

==
Let $(P(s) = frac(K, tau s + 1, style: "skewed"))$, $(C(s) = K_p)$, and $(H(s) = 1)$.

===
Recall:
$ (E(s)) / (R(s)) = 1 / (1 + P C H) $
We can rewrite this transfer function as follows:
$ (E(s)) / (R(s)) = 1 / (1 + (frac(K K_p, tau s + 1, style: "skewed"))) = (tau s + 1) / (tau s + 1 + K K_p) $
If $R(s) = 1/s$ (unit step input):
$ E(s) = (tau s + 1) / (s(tau s + 1 + K K_p)) $
Therefore, the steady state error response for a unit step reference input $e_"ss, R"$ is (by FVT):
#block(stroke: black, inset: 0.5em)[$
e_"ss, R" = vec(limits(lim)_(s->0)) (s E(s)) = vec(limits(lim)_(s->0)) ((tau s + 1) / (tau s + 1 + K K_p)) = 1 / (1 + K K_p)
$]
===
Recall:
$ E(s) / D(s) = - (H P) / (1 + P C H) $
We can rewrite this transfer function as follows:
$ (E(s) / D(s)) = - ((frac(K, tau s + 1, style: "skewed")) / (1 + (frac(K K_p, tau s + 1, style: "skewed")))) = - (K / (tau s + 1 + K K_p)) $
If $D(s) = 1/s$ (unit step disturbance input):
$ E(s) = - (K / (tau s + 1 + K K_p)) (1/s) $
Therefore, the steady state error response for a unit step disturbance input $e_"ss, D"$ is (by FVT):
#block(stroke: black, inset: 0.5em)[$
e_"ss, D" = vec(limits(lim)_(s->0)) (s E(s)) = vec(limits(lim)_(s->0)) (- K / (tau s + 1 + K K_p)) = - K / (1 + K K_p)
$]

===
Recall:
$ (E = -H Y - H N) $
$ arrow.double (E / N  = -H(Y / N) - H = (P C H^2) / (1 + P C H) -H = (P C H^2 - (H + P C H^2)) / (1 + P C H)) $
$ = - H / (1 + P C H) $
We can rewrite this transfer function as follows:
$ (E(s) / N(s)) = - (1 / (1 + (frac(K K_p, tau s + 1, style: "skewed")))) = - (tau s + 1) / (tau s + 1 + K K_p) = (E(s)) / (R(s)) $
Therefore, 
#block(stroke: black, inset: 0.5em)[$ e_"ss, N" = e_"ss, R" = 1 / (1 + K K_p) $]

#pagebreak()

= Problem 3
Consider the feedback control system below:
#figure(
  image("ESC251_HW5_Q3.png", width: 100%), caption  : [_Feedback Control System for Problem 3_])

Firstly, notice the $H_1$ and $H_2$ blocks are in parallel relative to a summing block, so you can replace those two blocks as well as the summing block with $(H_1 - H_2)$.
Now, consider the two summing blocks to the right of $G_2$, labelled $Sigma_1$ and $Sigma_2$ from left to right. Considering this block diagram, we can express the equations that follow each respective summing block in the following way:
#let Sigma_1 = $ R - C(H_1 - H_2) $
$ Sigma_1 = R - C(H_1 - H_2) $
$ Sigma_2 = Sigma_1 + G_1 R = #Sigma_1 + G_1 R = R(1 + G_1) - C(H_1 - H_2) $
However, per the block diagram, $(C = G_2 Sigma_2)$, therefore we can begin a chain of simplifications to find the final relevant transfer function $(frac(C(s), R(s), style: "skewed"))$:
#let Sigma_2 = $ R(1 + G_1) - C(H_1 - H_2) $
$ C = G_2 Sigma_2  = G_2(#Sigma_2) = G_2 R (1 + G_1) - G_2 C (H_1 - H_2) $
$ arrow.double (C + G_2 C (H_1 - H_2) = C(1 + G_2(H_1 - H_2)) = G_2 R (1 + G_1)) $

#block(stroke: black, inset: 0.5em)[$ (C(s)) / (R(s)) = (G_2 (1 + G_1)) / (1 + G_2(H_1 - H_2)) $]

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
$ (G_1G_2G_3G_4) / (1 + G_3G_4H_2) $

We can now remove the loop containing $(frac(G_1G_2G_3G_4, 1 + G_3G_4H_2, style: "skewed"))$ and $(frac(H_1(1 + G_3G_4H_2),G_3G_4, style: 
"skewed"))$, replacing it with a block containing:
$ frac(G_1G_2G_3G_4, 1 + G_3G_4H_2)(1+(frac(G_1G_2G_3G_4, 1 + G_3G_4H_2))(frac(H_1(1 + G_3G_4H_2),G_3G_4)))^(-1) $
$ =frac(G_1G_2G_3G_4, 1 + G_3G_4H_2)(1 + G_1G_2H_1)^(-1) $
$ =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1)) $
Finally, we can remove the loop containing $(frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1), style: "skewed"))$ and $(frac(H_3 , G_1 G_4, style: "skewed"))$ to get the transfer function of this control system:
$ =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1))(1 + (frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1)))(frac(H_3 , G_1 G_4 )))^(-1) $
$ =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1))(1 + (frac(G_2G_3H_3, (1 + G_3G_4H_2)(1 + G_1G_2H_1))))^(-1) $
$ =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1))((frac((1 + G_3G_4H_2)(1 + G_1G_2H_1) + G_2G_3H_3, (1 + G_3G_4H_2)(1 + G_1G_2H_1))))^(-1) $
$ =frac(G_1G_2G_3G_4(1 + G_3G_4H_2)(1 + G_1G_2H_1), (1 + G_3G_4H_2)(1 + G_1G_2H_1)((1 + G_3G_4H_2)(1 + G_1G_2H_1) + G_2G_3H_3)) $
#block(stroke: black, inset: 0.5em)[$ (Y(s)) / (R(s)) =frac(G_1G_2G_3G_4, (1 + G_3G_4H_2)(1 + G_1G_2H_1) + G_2G_3H_3) $]
