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
#align(center)[*#underline["Fun" Hobby Motor Assignment]*]

#figure(
  image("f034a91a-d8b2-4ffe-980a-1154762b8ae0.jpg", width: 50%),
  caption: [_Schematic for RadioShack hobby motor, adapted from "Motor Specs Fun Problem (ESC-251-1-Systems Engineering-2026SP)"_.] 
)<figure-1>

Note that the following are values given by the problem:
#no-num($ v = 3" V",#h(1em) I = 0.25 "A" , #h(1em) omega = 8700 "rpm", #h(1em) T = (5.3)g/"cm" $)

=
We can express the differential equation governing this motor with:
$ v = L dot(I) + R I + e_b $<eq-1>
where v is the input voltage to the motor, and $e_b$ is the back-emf of the motor.

When no load is applied to the motor, $((dot(I)=0) and (I approx 0))$, therefore @eq-1 can be rewritten as:
#no-num($ v =  e_b $) 

We can also express the back-emf of the system with:
$ e_b = K_b omega $<eq-2>

Substituting @eq-2 into @eq-1 yields:
$ v = K_b omega $<eq-3> 

Rearranging @eq-3 yields an equation for $K_b$, which can be simplified with the corresponding givens:
#block(stroke: black, inset: 0.5em)[$ K_b = v / omega approx (3.448 * 10^(-4)) V/"rpm" $]

= 
If we were to take the Laplace Transform of both sides of @eq-3, we get:
$ V(s) = K_b Omega(s) $<eq-5>  

We can rearrange @eq-5 to get the system's transfer function:
$ Omega(s) / V(s) = 1/ K_b $<eq-6>

The system's DC gain can be expressed as:
#block(stroke: black, inset: 0.5em)[$ (limits(lim)_(s->0))(Omega(s) / V(s)) = (limits(lim)_(s->0))(1/K_b) = 1 / K_b = (2900)"rpm" / V $<eq-7>]

=
Now, let the input voltage $(v_i = (U(t)) "V")$, where U(t) is the Heaviside function. Assume that $(t in RR_(>=0))$. Therefore, $v_i$ can be rewritten as $(v_i=1V)$.

We can express the steady-state motor speed $omega#sub[ss]$ as:
#block(stroke: black, inset: 0.5em)[$ w#sub[ss] = ((limits(lim)_(s->0))(Omega(s) / V(s)))(v_i) = 2900 "rpm"(V/ V) = 2900 "rpm" $<eq-8>]

