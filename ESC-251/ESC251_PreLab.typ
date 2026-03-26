#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#set page(
  numbering: "1",
)
#set document(
  title: []
)
#show columns: set text(size: 10pt)
#set heading(numbering: none) 
#show heading: set text(size: 10pt, weight: "bold")
#show figure: set block(below: (2.0em))
#let numbered_eq(content) = math.equation(
    block: true,
    numbering: "(1)",
    content,
)

#let date = datetime.today()
#show table.cell.where(y: 0): set text(weight: "bold")


// Document Contents
Joshua Davidov \ 
ESC251: Systems Engineering \ 
Professor Baglione \ 
3/25/2026 \ 
#align(center)[*#underline[QUBE Motor Pre-Lab]*]

#figure(
  image("Screenshot 2026-03-25 at 11-29-46 ME352-Qube-Lab1-Modeling-F25 1.pdf.png", width: 95%),
  caption: [Schematic for the electrical and mechanical model of an electrical motor with disc (load) connected to the motor hub, adapted from "ME352-Qube-Lab1-Modeling-F25 1.pdf".] 
)<figure-1>

== Part A:
Note $( J=J_m+J_d)$. Assume zero initial conditions. Let $Y(s)$ and $U(s)$ be the motor angular velocity and the applied voltage, respectively, in the Laplace domain.

If we were to not neglect inductance, the set of equations governing this system are:
#numbered_eq($ L dot(I) + R I + K_b omega = v $)<eq-1>
#numbered_eq($ J dot(omega) + B omega = K_m I $)<eq-2>
Rearranging @eq-2 to isolate $I $ on one side yields @eq-3:
#numbered_eq($ K^(-1)_m (J dot(omega) + B omega) = I $)<eq-3>
Substuting @eq-3 into @eq-1 yields @eq-4:
#numbered_eq($ L / K_m (J dot.double(omega) + B dot(omega)) + R / K_m (J dot(omega) + B omega) + K_b omega = v $)<eq-4>
This can be rewritten as:
$ ((L J)/K_m) dot.double(omega) + ((B L + J R) / K_m)dot(omega) + ((B R + K_b K_m) / K_m)omega = v $
Taking the Laplace Transform of @eq-4 yields @eq-5:
#numbered_eq($ ((L J)/K_m) s^2 Y(s) + ((L B + R J) / K_m)s Y(s) + ((R B + K_b K_m) / K_m)Y(s)= U(s) $)<eq-5>
This can be rewritten as:
$ Y(s) (((L J s^2) + (L B + R J)s + R B + K_b K_m) / K_m)=U(s) $
Then, by dividing both sides of @eq-5 by $Y(s)$, and then taking the reciprocal of both sides, we get the transfer function: #numbered_eq($ Y(s) / U(s) = K_m / (L J s^2 + (L B + R J)s + R B + K_b K_m) $)<eq-6>

== Part B:
Now, consider the state vector 
$(x = mat(delim: "[", omega; I) )$<x>
, with output $ omega$. Then, 
$(dot(x) = mat(delim: "[", dot(omega); dot(I)))$<dx>.
By rearranging @eq-2, we can express $dot(omega)$ as a linear combination of elements in our state vector:
#numbered_eq($ dot(omega) = - (B / J) omega+ (K_m / J)I $)<eq-7>
This can also be achieved for $dot(I)$ by rearranging @eq-1:
#numbered_eq($ dot(I) = (- K_b / L)omega + (-R / L) I + v/L $)<eq-8>
Therefore, we can express this system with the following state-space matrix equations:
#numbered_eq($ dot(x) = mat(delim: "[", dot(omega); dot(I)) = mat(delim: "[",
  -B/J, K_m / J;
  -K_b/L, -R/L)
  mat(delim: "[", omega; I) + mat(delim: "[", 0; 1/L)v
 $)<eq-9>
#numbered_eq($ y = omega = mat(delim: "[", 1, 0) mat(delim: "[", omega; I) + [0]v $)<eq-10>

== Part C:
Now, consider the system where $((L=0) and (B=0))$. Then, @eq-1 and @eq-2 become:
#numbered_eq($ R I + K_b omega = v $)<eq-11>
#numbered_eq($ J dot(omega) = K_m I $)<eq-12>
Rearranging @eq-12 to isolate $I$ on one side yields:
$  $

