#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#set page(
  numbering: "1",
)
#set document(
  title: []
)
#show columns: set text(size: 10pt)
#set heading(numbering: "1.a") 
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

=
Consider the following rotational mechanical system with inertia $J_1$ and $J_2$ connected by shafts with rotational stiffnesses $K_1$ and $K_2$, respectively, with inputs $T_1(t)$ and $T_2(t)$ and outputs $omega_1$ and $omega_2$. Assume the rods are rigid.
#figure(
  image("Screenshot 2026-03-26 at 13-31-17 ESC 161 Systems Engineering - ESC251_HW4_S26v2.pdf.png", width: 50%),
  caption: [Schematic for rotational mechanical system for Q1".] 
)<figure-1>
==
Use the rotational form of N2L on disks 1 and 2 to get:
$ sum tau_1 = J_1 dot.double(theta)_1 = T_1 - B_1dot(theta_1) - K_1 (theta_1-theta_2) $<eq-1>
$ sum tau_2 = J_2 dot.double(theta)_2 = T_2 - B_2dot(theta_2) - K_2x_2-K_1(theta_2 - theta_1) $<eq-2>
With @eq-1 and @eq-2, we can express this system with two differential equations:
#block(stroke: black, inset: 0.5em)[
  $ J_1 dot.double(theta)_1 + B_1 dot(theta)_1 + K_1(theta_1-theta_2) = T_1 $<eq-3>
  $ J_2 dot.double(theta)_2 + B_2dot(theta_2) + K_2x_2+K_1(theta_2 - theta_1) = T_2 $<eq-4>
  ]

==
First, let our state vector and its derivative be:
$ x = mat(delim: "[", 
theta_1; 
theta_2; 
dot(theta)_1; 
dot(theta)_2), #h(1em) 
dot(x) = mat(delim: "[", 
dot(theta)_1; 
dot(theta)_2; 
dot.double(theta)_1; 
dot.double(theta)_2) $<eq-5>
Note that:
#no-num($ dot(theta)_1 = mat(delim: "[", 
0, 0, 1, 0
)mat(delim: "[", 
theta_1; 
theta_2; 
dot(theta)_1; 
dot(theta)_2) +
mat(delim: "[",
0, 0)
mat(delim: "[",
T_1;
T_2), #h(1em) 
dot(theta)_2 = mat(delim: "[", 
0, 0, 0, 1)
mat(delim: "[", 
theta_1; 
theta_2; 
dot(theta)_1; 
dot(theta)_2) +
mat(delim: "[",
0, 0)
mat(delim: "[",
T_1;
T_2) $)
From @eq-1 and @eq-2, we can get equations to express $dot.double(theta)_1$ and $dot.double(theta)_2$ as a linear combination of the elements of $x$:
$ dot.double(theta)_1 = J_1^(-1)(T_1 - B_1dot(theta_1) - K_1 (theta_1-theta_2)) = -(K_1 / J_1) theta_1 + (K_2 / J_1) theta_1 - (B_1 / J_1) dot(theta)_1 + T_1 / J_1 $<eq-6>
#no-num($ =mat(delim: "[", 
-K_1 / J_1, K_2/J_1 , -B_1/J_1, 0)
mat(delim: "[", 
theta_1; 
theta_2; 
dot(theta)_1; 
dot(theta)_2) + 
mat(delim: "[",
1/J_1, 0)
mat(delim: "[",
T_1;
T_2)$)
$ dot.double(theta)_2 = J_2^(-1)(T_2 - B_2dot(theta_2) - K_2x_2-K_1(theta_2 - theta_1)) $<eq-7>
#no-num($ = (K_1 / J_2)theta_1 -((K_1 + K_2) / J_2) theta_2 -(B_2 / J_2)dot(theta)_2 + T_2 / J_2 $)
#no-num($ = mat(delim: "[", 
K_1/J_2, -((K_1 + K_2) / J_2), 0, -B_2 / J_2)
mat(delim: "[", 
theta_1; 
theta_2; 
dot(theta)_1; 
dot(theta)_2) +
mat(delim: "[",
0, 1/J_2;
)
mat(delim: "[",
T_1;
T_2)
$)
Therefore, the state-space representation of this system is:
#block(stroke: black, inset: 0.5em)[$ 
dot(x) =  
mat(delim: "[", 
dot(theta)_1; 
dot(theta)_2; 
dot.double(theta)_1; 
dot.double(theta)_2) =
mat(delim: "[",
0,0,1,0;
0,0,0,1;
-K_1 / J_1, K_2/J_1 , -B_1/J_1, 0;
K_1/J_2, -((K_1 + K_2) / J_2), 0, -B_2 / J_2;)
mat(delim: "[", 
theta_1; 
theta_2; 
dot(theta)_1; 
dot(theta)_2) + 
mat(delim: "[",
0, 0;
0, 0;
1/J_1, 0;
0, 1/J_2)
mat(delim: "[",
T_1;
T_2) $<eq-8>
$ y = mat(delim: "[",
omega_1;
omega_2) = 
mat(delim: "[",
0,0,1,0;
0,0,0,1;)
mat(delim: "[", 
theta_1; 
theta_2; 
dot(theta)_1; 
dot(theta)_2) + 
mat(delim: "[",
0, 0;
0, 0;
)
mat(delim: "[",
T_1;
T_2) $<eq-9>]

#pagebreak()

=

Consider the system portrayed in @figure-2.
#figure(
  image("Screenshot 2026-03-26 at 19-34-34 (6) Assignments Assignments Microsoft Teams.png", width: 75%),
  caption: [Schematic for mechanical system for Q2".] 
)<figure-2>
==
Let the state space vector be:
$ x = mat(delim: "[", 
x_1; 
x_2; 
dot(x)_1; 
dot(x)_2), #h(1em) 
dot(x) = mat(delim: "[", 
dot(x)_1; 
dot(x)_2; 
dot.double(x)_1; 
dot.double(x)_2) $<eq-10>
Recall from ESC251 HW2, we derived the following differential equations for this corresponding system (for a reminder for how we derived this, see @appendix-1[the Appendix in Section]):
$ m_1 dot.double(x) +b(dot(x)_1 - dot(x)_2) + k_1(x_1-x_2) = 0)  $<eq-11>
$ m_2 dot.double(x) + b(dot(x)_2 - dot(x)_1) + k_1(x_2 - x_1) + k_2 x_2 = k_2u $<eq-12>
Note that:
#no-num($ dot(x)_1 = mat(delim: "[", 
0, 0, 1, 0
)mat(delim: "[", 
x_1; 
x_2; 
dot(x)_1; 
dot(x)_2) +
mat(delim: "[",
0)
mat(delim: "[",
u), #h(1em) 
dot(x)_2 = mat(delim: "[", 
0, 0, 0, 1)
mat(delim: "[", 
x_1; 
x_2; 
dot(x)_1; 
dot(x)_2) +
mat(delim: "[",
0)
mat(delim: "[",
u
) $)
From @eq-11 and @eq-12, we can get equations to express $dot.double(x)_1$ and $dot.double(x)_2$ as a linear combination of the elements of $x$:
$ dot.double(x)_1 = m_1^(-1)(- b(dot(x)_1 - dot(x)_2) - k_1(x_1 - x_2)) $<eq-13>
#no-num($ = -(k_1 / m_1)x_1 + (k_2 / m_2)x_2 -(b/m_1)dot(x)_1 + (b/m_1) dot(x)_2 $)
#no-num($ =mat(delim: "[", 
-k_1 / m_1, k_2/m_1 , -b/m_1, b/m_1)
mat(delim: "[", 
x_1; 
x_2; 
dot(x)_1; 
dot(x)_2) + 
mat(delim: "[",
0)
mat(delim: "[",
u)$)
$ dot.double(x)_2 = m_2^(-1)(b(dot(x)_2 - dot(x)_1) -k_1(x_2 - x_1) - k_2(x_2 - u)) $<eq-14>
#no-num($ = (k_1/m_2)x_1 -((k_1 + k_2)/m_2 )x_2 + (b/m_2)dot(x)_1 - (b/m_2)dot(x)_2 + (k_2/m_2)u $)
#no-num($ = mat(delim: "[", 
k_1/m_2, -((k_1+k_2) / m_2), b/m_2, -b/m_2)
mat(delim: "[", 
x_1; 
x_2; 
dot(x)_1; 
dot(x)_2) +
mat(delim: "[",
k_2 / m_2;
)
mat(delim: "[",
u)
$)
Therefore, the state-space representation of this system is:
#block(stroke: black, inset: 0.5em)[$ 
dot(x) =  
mat(delim: "[", 
dot(x)_1; 
dot(x)_2; 
dot.double(x)_1; 
dot.double(x)_2) =
mat(delim: "[",
0,0,1,0;
0,0,0,1;
-k_1 / m_1, k_1/m_1 , -b/m_1, b/m_1;
k_1/m_2, -((k_1+k_2) / m_2), b/m_2, -b/m_2)
mat(delim: "[", 
x_1; 
x_2; 
dot(x)_1; 
dot(x)_2) + 
mat(delim: "[",
0;
0;
0;
k_2/m_2)
mat(delim: "[",
u) $<eq-15>
$ y = mat(delim: "[",
x_1) = 
mat(delim: "[",
1,0,0,0;
)
mat(delim: "[", 
x_1; 
x_2; 
dot(x)_1; 
dot(x)_2) + 
mat(delim: "[",
0
)
mat(delim: "[",
u) $<eq-16>]


==
Consider the following given values:
#no-num($ m_1 = (1000)"kg", #h(1em) b = (4000) "kg"/s, #h(1em) k_1 = (20000) N/m, k_2 = [(5000)N/m, (10000)N/m], #h(1em) t = (16)s  $)
Plugging these values into @eq-15 and @eq-16, and running these numbers through @appendix-2[the Appendix Code in Section], yields the following figure:
#figure(
  image("ESC251_HW4Q2.png", width: 75%),
  caption: [Driver/Body Displacement $x_2(t)$] 
)<figure-3>

==
As per @figure-3, #block(stroke: black, inset: 0.5em)[$k_2 = (10000)N/m$] resulted in a lower driver displacement.

#pagebreak()

= Appendix <appendix-1>
#v(0.25em)
Refer to @figure-2 for the system corresponding to question 2.

By N2L for mass $m_1$:
$ sum F_y = m_1 dot.double(x)_1 = - b(dot(x)_1 - dot(x)_2) - k_1(x_1 - x_2) $<eq-x>
By N2L for mass $m_2$:
$ sum F_y = m_2 dot.double(x)_2 = - b(dot(x)_2 - dot(x)_1) -k_1(x_2 - x_1) - k_2(x_2 - u) $<eq-y>
These equations can be rewritten as @eq-11 and @eq-12 respectively.

#pagebreak()

= Appendix Code <appendix-2>
#v(0.25em)
The following Matlab script was used to generate @figure-3.
```matlab
m1 = 1000;   % kg
m2 = 100;    % kg
b  = 4000;   % kg/s
k1 = 20000;  % N/m
k2_values = [5000 10000];  % N/m
t = 0:0.01:16;

% Triangle bump: 0 -> 1 cm -> -1 cm -> 0 over first 4 s
u1 = 0:0.01:1;
u2 = 0.99:-0.01:-1;
u3 = -0.99:0.01:0;
u4 = zeros(size(4.01:0.01:16));
u_cm = [u1 u2 u3 u4];   % bump in cm
u = 0.01 * u_cm;        % convert to meters

% Output both displacements: y = [x1; x2]
C = [1 0 0 0];
D = [0];

y_store = cell(length(k2_values),1); 

for i = 1:length(k2_values)
    k2 = k2_values(i);

    A = [0       0           1       0;
         0       0           0       1;
        -k1/m1   k1/m1      -b/m1    b/m1;
         k1/m2  -(k1+k2)/m2  b/m2   -b/m2];

    B = [0;
         0;
         0;
         k2/m2];

    sys = ss(A,B,C,D);
    y = lsim(sys,u,t);

    y_store{i} = y;
end

% Plot x1 (driver/body displacement)
figure;
plot(t, y_store{1}(:,1), 'LineWidth', 1.5); hold on;
plot(t, y_store{2}(:,1), 'LineWidth', 1.5);
plot(t, u, '--k', 'LineWidth', 1.2);
grid on;
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Driver/Body Displacement x_1(t)');
legend('x_1, (k_2 = 5000 N/m)', 'x_1, (k_2 = 10000 N/m)', 'Road input u(t)');

```