#import "conf.typ": conf
#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#import "@preview/meander:0.4.1"
#import "@preview/callisto:0.2.5"

#show figure: set block(below: (2.0em))
#show columns: set text(size: 10pt)
#set heading(numbering: "1.a.")
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
  title: [*Take Home Exam*],
  instructors: ("Professor Wootton"),
  month: date.display("[month repr:long] [day],"),
  year: date.display("[year]"),
  doc,
)

= Question 1

== Given Values and Model

The spar is modeled as a cantilever beam with a deformable plate/spar joint. The center of the airframe is assumed rigid, so the boundary conditions at the center are

#no-num[$
  y(0) = 0, #h(1em) theta(0) = 0
$]

The maximum thrust is

#no-num[$
  F_T = 80 "N"
$]

The relevant dimensions and material properties are

#no-num[$
  t_p = 4 "mm", #h(1em)
  w_p = 44 "mm", #h(1em)
  t_w = 2 "mm", #h(1em)
  d_o = 25 "mm"
$]

#no-num[$
  L_b = 76 "mm", #h(1em)
  L_s = 400 "mm", #h(1em)
  E_(CF,0) = 40 "GPa", #h(1em)
  sigma_(u,0) = 800 "MPa"
$]

The total spar length from the rigid airframe center to the motor is

#no-num[$
  L = L_b + L_s
$]

For this simplified design, the spar and plates are both treated as 0°/90° carbon fiber, so

#no-num[$
  E = E_(CF,0) = 40 "GPa"
$]

== Section Properties

The spar is modeled as a square hollow tube. The inner side length is

#no-num[$
  d_i = d_o - 2 t_w
$]

#no-num[$
  d_i = 25 "mm" - 2(2 "mm") = 21 "mm"
$]

The spar moment of inertia is therefore

#no-num[$
  I_s = (d_o^4 - d_i^4) / 12
$]

#no-num[$
  I_s = ((25 "mm")^4 - (21 "mm")^4) / 12
$]

#no-num[$
  I_s = 16345.3 "mm"^4 = 1.635 times 10^(-8) "m"^4
$]

Each plate has area

#no-num[$
  A_p = w_p t_p
$]

#no-num[$
  A_p = (44 "mm")(4 "mm") = 176 "mm"^2 = 1.76 times 10^(-4) "m"^2
$]

The centroidal moment of inertia of one plate about its own centroidal axis is

#no-num[$
  I_(p,c) = (w_p t_p^3) / 12
$]

#no-num[$
  I_(p,c) = ((44 "mm")(4 "mm")^3) / 12 = 234.7 "mm"^4
$]

The distance from the neutral axis of the spar to the centroid of each plate is

#no-num[$
  d_p = d_o / 2 + t_p / 2
$]

#no-num[$
  d_p = 25 "mm" / 2 + 4 "mm" / 2 = 14.5 "mm"
$]

Using the parallel-axis theorem, the moment of inertia of the joint region is

#no-num[$
  I_j = I_s + 2(I_(p,c) + A_p d_p^2)
$]

#no-num[$
  I_j = 9.082 times 10^(-8) "m"^4
$]

Thus, the bending stiffnesses are

#no-num[$
  E I_s = (40 times 10^9)(1.635 times 10^(-8))
$]

#no-num[$
  E I_s = 653.8 "N" dot "m"^2
$]

#no-num[$
  E I_j = (40 times 10^9)(9.082 times 10^(-8))
$]

#no-num[$
  E I_j = 3632.9 "N" dot "m"^2
$]

== Derivation of Slope and Deflection

For the joint region, where $0 <= x <= L_b$, the bending moment is

#no-num[$
  M(x) = F_T((L_b + L_s) - x)
$]

Using the Euler-Bernoulli beam relation,

#no-num[$
  E I_j (d^2 y) / (d x^2) = M(x)
$]

so

#no-num[$
  (d^2 y) / (d x^2)
  =
  F_T / (E I_j) ((L_b + L_s) - x)
$]

Integrating once gives the slope:

#no-num[$
  theta(x)
  =
  F_T / (E I_j) ((L_b + L_s)x - x^2 / 2) + C_1
$]

Because the airframe center is fixed,

#no-num[$
  theta(0) = 0
$]

so

#no-num[$
  C_1 = 0
$]

Therefore,

#no-num[$
  theta(x)
  =
  F_T / (E I_j) ((L_b + L_s)x - x^2 / 2)
$]

At $x = L_b$,

#no-num[$
  theta(L_b)
  =
  F_T / (E I_j) ((L_b + L_s)L_b - L_b^2 / 2)
$]

#no-num[$
  theta(L_b)
  =
  F_T / (E I_j) (L_s L_b + L_b^2 / 2)
$]

Integrating a second time gives the deflection:

#no-num[$
  y(x)
  =
  F_T / (E I_j) ((L_b + L_s)x^2 / 2 - x^3 / 6) + C_2
$]

Because

#no-num[$
  y(0) = 0
$]

we have

#no-num[$
  C_2 = 0
$]

Thus,

#no-num[$
  y(x)
  =
  F_T / (E I_j) ((L_b + L_s)x^2 / 2 - x^3 / 6)
$]

At $x = L_b$,

#no-num[$
  y(L_b)
  =
  F_T / (E I_j) ((L_b + L_s)L_b^2 / 2 - L_b^3 / 6)
$]

#no-num[$
  y(L_b)
  =
  F_T / (E I_j) (L_s L_b^2 / 2 + L_b^3 / 3)
$]

For the free spar region, the additional slope and deflection from the free spar length are the standard cantilever end-load results:

#no-num[$
  theta_s = (F_T L_s^2) / (2 E I_s)
$]

#no-num[$
  y_s = (F_T L_s^3) / (3 E I_s)
$]

Therefore, the total tip slope is

#no-num[$
  theta_(tip)
  =
  theta(L_b) + (F_T L_s^2) / (2 E I_s)
$]

and the total tip deflection is

#no-num[$
  y_(tip)
  =
  y(L_b) + theta(L_b)L_s + (F_T L_s^3) / (3 E I_s)
$]

== Numerical Results

At $x = L_b$,

#no-num[$
  theta(L_b)
  =
  F_T / (E I_j) (L_s L_b + L_b^2 / 2)
$]

#no-num[$
  theta(L_b)
  =
  7.33 times 10^(-4) "rad"
$]

#no-num[$
  theta(L_b)
  =
  0.0420 degree
$]

The deflection at the end of the plate/spar joint is

#no-num[$
  y(L_b)
  =
  F_T / (E I_j) (L_s L_b^2 / 2 + L_b^3 / 3)
$]

#no-num[$
  y(L_b)
  =
  2.866 times 10^(-5) "m"
  =
  0.0287 "mm"
$]

At the motor tip,

#no-num[$
  theta_(tip)
  =
  theta(L_b) + (F_T L_s^2) / (2 E I_s)
$]

#no-num[$
  theta_(tip)
  =
  1.052 times 10^(-2) "rad"
$]

#no-num[$
  theta_(tip)
  =
  0.603 degree
$]

The total tip deflection is

#no-num[$
  y_(tip)
  =
  y(L_b) + theta(L_b)L_s + (F_T L_s^3) / (3 E I_s)
$]

#no-num[$
  y_(tip)
  =
  2.932 times 10^(-3) "m"
  =
  2.93 "mm"
$]

#figure(
  table(
    columns: 4,
    table.header[*Location*][*Slope*][*Slope in Degrees*][*Deflection*],
    [$x = L_b$], [$7.33 times 10^(-4) "rad"$], [$0.0420 degree$], [$0.0287 "mm"$],
    [$x = L_b + L_s$], [$1.052 times 10^(-2) "rad"$], [$0.603 degree$], [$2.93 "mm"$],
  ),
  caption: [Calculated slope and deflection at the end of the joint and at the motor tip.]
)

== Simple Checks

First, if the plate/spar joint were perfectly rigid, only the free spar length $L_s$ would bend. This gives a lower-bound estimate:

#no-num[$
  y_(lower) = (F_T L_s^3) / (3 E I_s)
$]

#no-num[$
  y_(lower) = 2.61 "mm"
$]

Second, if the entire length $L_b + L_s$ behaved like the spar alone, the deflection would be

#no-num[$
  y_(upper) = (F_T (L_b + L_s)^3) / (3 E I_s)
$]

#no-num[$
  y_(upper) = 4.40 "mm"
$]

The calculated result is

#no-num[$
  2.61 "mm" < 2.93 "mm" < 4.40 "mm"
$]

This makes physical sense. The real structure is more flexible than a perfectly rigid joint, but stiffer than a full-length spar-only cantilever.

== Factor of Safety

Since the carbon fiber is brittle, I use a maximum normal stress failure criterion:

#no-num[$
  n = sigma_u / sigma_max
$]

The maximum bending moment occurs at the fixed end:

#no-num[$
  M(0) = F_T(L_b + L_s)
$]

#no-num[$
  M(0) = 80(0.476) = 38.08 "N" dot "m"
$]

The outer fiber distance for the joint is

#no-num[$
  c_j = d_o / 2 + t_p
$]

#no-num[$
  c_j = 12.5 "mm" + 4 "mm" = 16.5 "mm"
$]

Thus, the maximum normal stress in the joint region is

#no-num[$
  sigma_j = (M(0)c_j) / I_j
$]

#no-num[$
  sigma_j = 6.92 "MPa"
$]

For the free spar region, the maximum bending moment occurs at $x = L_b$:

#no-num[$
  M(L_b) = F_T L_s
$]

#no-num[$
  M(L_b) = 80(0.400) = 32.0 "N" dot "m"
$]

The outer fiber distance for the spar is

#no-num[$
  c_s = d_o / 2 = 12.5 "mm"
$]

The bending stress in the free spar is

#no-num[$
  sigma_s = (M(L_b)c_s) / I_s
$]

#no-num[$
  sigma_s = 24.5 "MPa"
$]

The free spar controls because

#no-num[$
  sigma_s > sigma_j
$]

Therefore,

#no-num[$
  n = sigma_(u,0) / sigma_s
$]

#no-num[$
  n = (800 "MPa") / (24.5 "MPa")
$]

#no-num[$
  n = 32.7
$]

== Discussion

The estimated maximum tip deflection is

#no-num[$
  y_(tip) approx 2.93 "mm"
$]

This is small compared with the free spar length of $400 "mm"$:

#no-num[$
  y_(tip) / L_s = 2.93 / 400 = 0.00733
$]

or about $0.73%$ of the free spar length. The static deflection therefore seems reasonably small.

The factor of safety against carbon-fiber bending failure is

#no-num[$
  n approx 32.7
$]

which is very large. Thus, the carbon fiber itself is not close to brittle bending failure under the maximum thrust load. However, the original motivation for this calculation is vibration, and a static deflection calculation does not by itself guarantee that the natural frequency is high enough. The more concerning real failure modes are probably joint slip, screw bearing, local crushing, delamination near the holes, fatigue, or low-frequency vibration rather than gross carbon-fiber bending failure.

== Extra Credit: Rough Estimate for Original Socket Design

For the original socket design, I estimate the joint stiffness by including the carbon-fiber spar, the 45° carbon-fiber plates, and the ASA socket material.

The plate modulus is

#no-num[$
  E_(CF,45) = 10 "GPa"
$]

and the socket modulus is

#no-num[$
  E_(ASA) = 2.1 "GPa"
$]

A rough square ASA collar model uses

#no-num[$
  I_(ASA) = ((d_o + 2t_(ASA))^4 - d_o^4) / 12
$]

with

#no-num[$
  t_(ASA) = 5 "mm"
$]

This gives a rough original joint flexural rigidity of

#no-num[$
  (E I)_(j,orig) approx 2191 "N" dot "m"^2
$]

The simplified new joint had

#no-num[$
  (E I)_(j,new) approx 3633 "N" dot "m"^2
$]

Using the same beam formulas,

#no-num[$
  y_(tip,orig) approx 3.14 "mm"
$]

The ratio is

#no-num[$
  y_(tip,orig) / y_(tip,new) = 3.14 / 2.93 = 1.07
$]

Thus, this rough estimate predicts that the original socket design is about $7%$ more flexible than the simplified new design. This difference is not large because most of the deflection comes from the long free spar, not from the short joint region.

= Question 2

== Screw Shear Force

The simplified design uses 8 screws to hold the plates and spar together. The problem states to assume that the screws bear equal shear loads. Therefore, the shear load per screw is estimated by dividing the applied thrust force equally among the 8 screws:

#no-num[$
  V_(screw) = F_T / 8
$]

#no-num[$
  V_(screw) = (80 "N") / 8
$]

#no-num[$
  V_(screw) = 10 "N"
$]

Thus,

#no-num[$
  boxed(V_(screw) = 10 "N per screw")
$]

== Shear Stress in One Screw

Each screw has diameter

#no-num[$
  d = 3 "mm"
$]

The cross-sectional area of one screw is

#no-num[$
  A_s = pi d^2 / 4
$]

#no-num[$
  A_s = pi(3 "mm")^2 / 4
$]

#no-num[$
  A_s = 7.07 "mm"^2
$]

The average shear stress in one screw is therefore

#no-num[$
  tau_(screw) = V_(screw) / A_s
$]

#no-num[$
  tau_(screw) = (10 "N") / (7.07 "mm"^2)
$]

Since

#no-num[$
  1 "N/mm"^2 = 1 "MPa"
$]

we get

#no-num[$
  tau_(screw) = 1.41 "MPa"
$]

== Discussion

A shear stress of only

#no-num[$
  tau_(screw) approx 1.41 "MPa"
$]

is very small for a typical 3 mm metal screw. Therefore, the screw shank itself is unlikely to fail in simple shear. The more concerning failure modes would be bearing failure in the carbon-fiber plate, local crushing around the screw holes, tear-out, delamination, or loosening of the bolted joint.

As a conservative composite-action check, one can also estimate the shear flow needed to make one plate act compositely with the spar:

#no-num[$
  q = V Q / I_j
$]

where

#no-num[$
  Q = A_p d_p
$]

Using the values from Question 1,

#no-num[$
  Q = (1.76 times 10^(-4))(0.0145)
$]

#no-num[$
  Q = 2.552 times 10^(-6) "m"^3
$]

Thus,

#no-num[$
  q = ((80)(2.552 times 10^(-6))) / (9.082 times 10^(-8))
$]

#no-num[$
  q = 2248 "N/m"
$]

Over the overlap length,

#no-num[$
  F_(plate) = q L_b
$]

#no-num[$
  F_(plate) = (2248)(0.076) = 170.8 "N"
$]

For two plates, this is

#no-num[$
  F_(total) = 2(170.8) = 341.6 "N"
$]

If this shear-transfer force were shared by 8 screws,

#no-num[$
  V_(screw,flow) = 341.6 / 8 = 42.7 "N"
$]

Even this more conservative estimate gives

#no-num[$
  tau_(screw,flow) = 42.7 / 7.07 = 6.04 "MPa"
$]

which is still a small shear stress for a 3 mm metal screw. Therefore, either estimate suggests that direct screw shear is not the limiting issue.

== Extra Credit: Original Socket Design

For the original design, there are 4 screws rather than 8. If the total shear is shared equally by the 4 screws,

#no-num[$
  V_(screw,orig) = F_T / 4
$]

#no-num[$
  V_(screw,orig) = (80 "N") / 4
$]

#no-num[$
  V_(screw,orig) = 20 "N"
$]

The corresponding average shear stress is

#no-num[$
  tau_(screw,orig) = 20 / 7.07
$]

#no-num[$
  tau_(screw,orig) = 2.83 "MPa"
$]

This is also small for a 3 mm screw.

= Question 3

== Given Values and Model

The leg is modeled as a fixed-free column. The spar end is fixed, while the other end is free to deflect and rotate. Therefore, for Euler buckling,

#no-num[$
  K = 2
$]

The leg dimensions are

#no-num[$
  L = 8 "in"
$]

#no-num[$
  D_o = 1/2 "in"
$]

#no-num[$
  t = 1/16 "in"
$]

Converting to SI units,

#no-num[$
  L = 8(0.0254) = 0.2032 "m"
$]

#no-num[$
  D_o = 0.5(0.0254) = 0.0127 "m"
$]

#no-num[$
  t = (1/16)(0.0254) = 0.0015875 "m"
$]

The inner diameter is

#no-num[$
  D_i = D_o - 2t
$]

#no-num[$
  D_i = 0.0127 - 2(0.0015875)
$]

#no-num[$
  D_i = 0.009525 "m"
$]

The carbon fiber is 0°/90°, so

#no-num[$
  E = 40 "GPa"
$]

and

#no-num[$
  sigma_u = 800 "MPa"
$]

== Cross-Sectional Properties

The cross-sectional area of the hollow circular tube is

#no-num[$
  A = pi / 4 (D_o^2 - D_i^2)
$]

#no-num[$
  A = pi / 4 ((0.0127)^2 - (0.009525)^2)
$]

#no-num[$
  A = 5.542 times 10^(-5) "m"^2
$]

The area moment of inertia is

#no-num[$
  I = pi / 64 (D_o^4 - D_i^4)
$]

#no-num[$
  I = pi / 64 ((0.0127)^4 - (0.009525)^4)
$]

#no-num[$
  I = 8.729 times 10^(-10) "m"^4
$]

== Direct Compressive Failure Check

If the leg failed by direct compressive stress, then

#no-num[$
  sigma = P / A
$]

Setting

#no-num[$
  sigma = sigma_u
$]

gives

#no-num[$
  P_(material) = sigma_u A
$]

#no-num[$
  P_(material) = (800 times 10^6)(5.542 times 10^(-5))
$]

#no-num[$
  P_(material) = 4.43 times 10^4 "N"
$]

#no-num[$
  P_(material) = 44.3 "kN"
$]

Thus, direct compressive material failure would require a very large load.

== Euler Buckling Check

For a column, the Euler critical load is

#no-num[$
  P_(cr) = (pi^2 E I) / ((K L)^2)
$]

For a fixed-free column,

#no-num[$
  K = 2
$]

Therefore,

#no-num[$
  P_(cr) = (pi^2 E I) / ((2L)^2)
$]

Substituting,

#no-num[$
  P_(cr)
  =
  (pi^2(40 times 10^9)(8.729 times 10^(-10))) / ((2(0.2032))^2)
$]

#no-num[$
  P_(cr) = 2087 "N"
$]

Therefore,

#no-num[$
  boxed(P_(cr) approx 2.09 "kN")
$]

In pounds-force,

#no-num[$
  P_(cr) = 469 "lbf"
$]

At this buckling load, the average compressive stress is

#no-num[$
  sigma_(cr) = P_(cr) / A
$]

#no-num[$
  sigma_(cr) = 2087 / (5.542 times 10^(-5))
$]

#no-num[$
  sigma_(cr) = 37.6 "MPa"
$]

This is much smaller than the ultimate strength of the carbon fiber:

#no-num[$
  37.6 "MPa" << 800 "MPa"
$]

Therefore, the leg buckles before the material reaches its compressive ultimate strength.

== Likely Failure Mode

The direct material failure load is

#no-num[$
  P_(material) = 44.3 "kN"
$]

The Euler buckling load is

#no-num[$
  P_(cr) = 2.09 "kN"
$]

Since

#no-num[$
  P_(cr) << P_(material)
$]

the likely failure mode is

#no-num[$
  boxed("Euler buckling of the fixed-free carbon-fiber tube")
$]

Thus, the maximum axial load that one leg can take before failing is approximately

#no-num[$
  boxed(P_(max) approx 2.09 "kN")
$]

== Discussion

The loaded weight of the aircraft is

#no-num[$
  W = 89 "N"
$]

If the load were shared equally by four legs, then each leg would carry

#no-num[$
  W_(leg) = 89 / 4
$]

#no-num[$
  W_(leg) = 22.25 "N"
$]

The static factor of safety against Euler buckling would be

#no-num[$
  n = P_(cr) / W_(leg)
$]

#no-num[$
  n = 2087 / 22.25
$]

#no-num[$
  n = 93.8
$]

This suggests that the legs are very safe under static axial compression. However, real landing loads can be much larger than the static aircraft weight because of impact loading, uneven load sharing, angled landings, side loads, and stress concentrations at the spar connection.

If the leg is loaded laterally as a cantilever rather than axially as a column, then bending stress would control. For a lateral tip load,

#no-num[$
  sigma_max = (P L c) / I
$]

where

#no-num[$
  c = D_o / 2
$]

Solving for the lateral bending load,

#no-num[$
  P_(bend) = (sigma_u I) / (L c)
$]

#no-num[$
  P_(bend) = ((800 times 10^6)(8.729 times 10^(-10))) / ((0.2032)(0.0127 / 2))
$]

#no-num[$
  P_(bend) = 541 "N"
$]

Therefore, under the fixed-free axial-column interpretation, the controlling load is

#no-num[$
  P_(max) approx 2.09 "kN"
$]

with buckling as the likely failure mode. Under a lateral landing-load interpretation, bending could become more important and would give a lower approximate limit of

#no-num[$
  P_(bend) approx 541 "N"
$]