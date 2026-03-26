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
#align(center)[*#underline[QUBE Motor Pre-Lab]*]

#figure(
  image("Screenshot 2026-03-25 at 11-29-46 ME352-Qube-Lab1-Modeling-F25 1.pdf.png", width: 95%),
  caption: [Schematic for the electrical and mechanical model of an electrical motor with disc (load) connected to the motor hub, adapted from "ME352-Qube-Lab1-Modeling-F25 1.pdf".] 
)<figure-1>

=
Note $( J=J_m+J_d)$. Assume zero initial conditions. Let $Y(s)$ and $U(s)$ be the motor angular velocity and the applied voltage, respectively, in the Laplace domain.

The set of differential equations governing the system described in @figure-1 are:
$ L dot(I) + R I + K_b omega = v $ <eq-1>
$ J dot(omega) + B omega = K_m I $ <eq-2>
Rearranging @eq-2 to isolate $I $ on one side yields @eq-3:
$ K^(-1)_m (J dot(omega) + B omega) = I $ <eq-3>
Substuting @eq-3 into @eq-1 yields @eq-4:
$ L / K_m (J dot.double(omega) + B dot(omega)) + R / K_m (J dot(omega) + B omega) + K_b omega = v $ <eq-4>
This can be rewritten as:
#no-num($ ((L J)/K_m) dot.double(omega) + ((B L + J R) / K_m)dot(omega) + ((B R + K_b K_m) / K_m)omega = v $)
Taking the Laplace Transform of @eq-4 yields:
$ ((L J)/K_m) s^2 Y(s) + ((L B + R J) / K_m)s Y(s) + ((R B + K_b K_m) / K_m)Y(s)= U(s) $ <eq-5>
Note @eq-5 be rewritten as:
#no-num($ Y(s) (((L J s^2) + (L B + R J)s + R B + K_b K_m) / K_m)=U(s) $)
Then, by dividing both sides of @eq-5 by $Y(s)$, and then taking the reciprocal of both sides, we get the transfer function: 
#rect($ Y(s) / U(s) = K_m / (L J s^2 + (L B + R J)s + R B + K_b K_m) $) <eq-6>

=
Now, consider the state vector 
$(x = mat(delim: "[", omega; I) )$<x>
, with output $ omega$. Then, 
$(dot(x) = mat(delim: "[", dot(omega); dot(I)))$ <dx>.
By rearranging @eq-2, we can express $dot(omega)$ as a linear combination of elements in our state vector:
$ dot(omega) = - (B / J) omega+ (K_m / J)I $ <eq-7>
This can also be achieved for $dot(I)$ by rearranging @eq-1:
$ dot(I) = (- K_b / L)omega + (-R / L) I + v/L $)<eq-8>
Therefore, we can express this system with the following state-space matrix equations:
#rect($ dot(x) = mat(delim: "[", dot(omega); dot(I)) = mat(delim: "[",
  -B/J, K_m / J;
  -K_b/L, -R/L)
  mat(delim: "[", omega; I) + mat(delim: "[", 0; 1/L)v
 $) <eq-9>
#rect($ y = mat(delim: "[", omega) = mat(delim: "[", 1, 0) mat(delim: "[", omega; I) + [0]v $) <eq-10>

=
Now, consider the system where $((L=0) and (B=0))$. Then, @eq-1 and @eq-2 become:
$ R I + K_b omega = v $ <eq-11>
$ J dot(omega) = K_m I $ <eq-12>
Rearranging @eq-12 to isolate $I$ on one side yields:
$ I = (J dot(omega)) / K_m $ <eq-13>
Substituting @eq-13 into @eq-11 yields:
$ ((R J) / K_m) dot(omega) + K_b omega = v $ <eq-14>
Taking the Laplace Transform of @eq-14 yields:
$ ((R J) / K_m) s Y(s) + K_b Y(s) = Y(s)((R J s + K_b K_m) / K_m) = U(s) $ <eq-15>
Then, by dividing both sides of @eq-15 by $Y(s)$, and then taking the reciprocal of both sides, we get the transfer function: 
$ Y(s) / U(s) = K_m / (R J s + K_b K_m) $ <eq-16>

=
Now consider the state vector $(x = mat(delim: "[", omega))$ with output $omega$. Then $(dot(x) = mat(delim: "[", dot(omega)))$. By rearranging @eq-12 to isolate $dot(omega)$, we get:
$ dot(omega) = (K_m / J) I $ <eq-17>
However, note that, by rearranging @eq-11, we can express $I$ as:
$ I = (-K_b / R)omega + (v/R) $ <eq-18>
Substituting @eq-18 into @eq-17 yields:
$ dot(omega) = (-(K_b K_m) / (R J))omega + ((K_m v) / (R J))v $ <eq-19>
Therefore, we can express this system with the following state-space matrix equations:
$ dot(x) = mat(delim: "[", dot(omega)) = mat(delim: "[", -(K_b K_m) / (R J)) mat(delim: "[", omega) + mat(delim: "[", (K_m v) / (R J)) v $ <eq-20>
$ y= omega = mat(delim: "[", 1) mat(delim: "[", omega) + mat(delim: "[", 0) v $ <eq-21>

=
From the problem statement, we have the following givens:
#no-num($ R = 8.4 Omega, #h(1em)  L = 0.00116H, #h(1em)  J_m = (4.65*10^(-6)) "kg"/m^2, #h(1em) K_m = 0.042, #h(1em) K_b = 0.042 $)
#no-num($ m = 0.053 "kg", #h(1em) r=0.0248m $)
Since $J_d$ is modeled as a disc of mass $m$ and radius $r$:
#no-num($ J_d = 1/2 m r^2 = (1.630*10^(-5)) "kg"/m^2 $)
Recall that $(J = J_d + J_m)$. Consequently,
#no-num($ J = J_d + J_m = (2.095 * 10^(-5))"kg"/m^2 $)

These numbers are quite fugly. We can use Python (see @appendix[Appendix Code in Section]) to let the computer calculate the poles $s_1$ and $s_2$ for us:
$ s_1 = -7231.341 "s", #h(1em) s_2 = -10.038 "s" $
Note that ($s_1, s_2 in RR_(<0)$) implies that the system is stable. Additionally, since $(abs(s_1) < abs(s_2))$, it is the dominant pole of the system, and consequently governs the system's response.

=
Recall that $tau$ is the time constant of a first-order system such that the transfer function $G(s)$ takes the form:
#no-num($ G(s) = K / (tau s + 1) $)
where K is the DC gain of the system.

Consider @eq-16:
#no-num($ Y(s) / U(s) = K_m / (R J s + K_b K_m) $)
This equation can be rewritten by dividing both the numerator and denominator by $K_b K_m$, yielding:
$ Y(s) / U(s) = ((1/K_b)) / (((R J) / (K_b K_m)) + 1) $ <eq-22>
From @eq-22, we can determine that:
$ K = 1/K_b = (23.810) "rad"/ (s dot V), #h(1em) tau = (R J) / (K_b K_m) = (9.976*10^(-2)) "s" $
Therefore, it can be concluded that the motor reaches $63.2%$ of its steady state angular speed in about 0.10s, and for every 1V of input, the maximum steady state angular speed increases by $(23.810) "rad"/ (s dot V)$.

#pagebreak()

= Appendix Code:<appendix>
```py
import numpy as np
import matplotlib.pyplot as plt

# Motor parameters from the pre-lab
R = 8.4          # ohm
L = 0.00116      # H
Jm = 4.65e-6     # kg*m^2
Km = 0.042       # N*m/A
Kb = 0.042       # V/(rad/s)
B = 0.0          # viscous damping neglected for part (e)

# Disc parameters
m_disc = 0.053    # kg
r_disc = 0.0248   # m

# Disc inertia: Jd = (1/2) m r^2
Jd = 0.5 * m_disc * r_disc**2

# Total inertia
J = Jm + Jd

# Second-order transfer function denominator:
# G(s) = Km / [LJ s^2 + (LB + RJ) s + (RB + Kb*Km)]
den = [L * J, L * B + R * J, R * B + Kb * Km]

# Find poles
poles = np.roots(den)

# Print results
print(f"Disc inertia Jd = {Jd:.8e} kg*m^2")
print(f"Total inertia J  = {J:.8e} kg*m^2")
print("\nDenominator coefficients:")
print(f"a2 = {den[0]:.8e}")
print(f"a1 = {den[1]:.8e}")
print(f"a0 = {den[2]:.8e}")

print("\nPoles of the system:")
for i, p in enumerate(poles, start=1):
    print(f"pole {i} = {p:.8f}")

# Optional: identify dominant pole
dominant_pole = poles[np.argmax(np.real(poles))]   # closest to the imaginary axis
print(f"\nDominant pole = {dominant_pole:.8f}")

# Optional: plot poles on the complex plane
plt.figure(figsize=(6, 6))
plt.axhline(0, linewidth=1)
plt.axvline(0, linewidth=1)
plt.plot(np.real(poles), np.imag(poles), 'x', markersize=10, label='Poles')
plt.xlabel('Real')
plt.ylabel('Imaginary')
plt.title('Pole Locations of DC Motor System')
plt.grid(True)
plt.legend()
plt.show()
```

