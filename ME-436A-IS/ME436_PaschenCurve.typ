#import "conf.typ": conf
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

#show: doc => conf(
  course_code: [ME436A-IS],
  course_title: [Plasma Engineering],
  course_color: black,
  authors: ("Joshua Davidov",),
  title: [*Paschen Curve Graphing Assignment*],
  instructors: ("Professor Wright",),
  month: date.display("[month repr:long] [day],"),
  year: date.display("[year]"),
  doc,
)

// Document Contents

= Introduction
#v(0.5em)
In this assignment, we:

a) Plot the Paschen curves for air, argon, and carbon dioxide.

b) Plot points representing the breakdown voltage of air at different selected $p d$ values.

c) Derive $min(V_(B D))$.

All relevant Paschen Law constants $(A$ and $B)$ to plot the Paschen curves of relevant gases were derived from Table 1 of #link("https://iopscience.iop.org/article/10.1088/1748-0221/17/09/P09029")["Suppression of electrical breakdown phenomena in liquid TriMethyl Bismuth based ionization detectors"]#super[1].
#figure(
  table(
    columns: 3,

    table.header[Gas][A $("mbar"^(-1) dot "cm"^(-1))$) ][B $(V dot "mbar"^(-1) dot "cm"^(-1))$],
    [He], [2], [26],
    [Ar], [9], [135],
    [Air], [11], [274],
    [Ne], [3], [751],
    [$"CO"_2$], [15], [350]
  ),
  caption: [_Table of Paschen Constants, derived from "Suppression of electrical breakdown phenomena in liquid TriMethyl Bismuth based ionization detectors"_],
) <table-1>


#figure(
  image("ME436_PaschenGasCurve.png", width: 80%),
  caption: [_Paschen curves for air, argon, and carbon dioxide, with selected air breakdown-voltage points._]
) <figure-1>

#pagebreak()
= Derivation of $min(V_(B D))$
#v(0.5em)
We claim:
#no-num($ min(V_(B D)) = (B e ln(gamma^(-1) + 1)) / A $)

Recall the equation for Paschen's Law:
$ V_(B D)(p d) = (B p d) / (ln(A p d) - ln(ln(gamma^(-1) + 1))) $<eq-1>

To find $min(V_(B D))$, take the derivative of $V_(B D)$ with respect to $p d$:
#no-num($ (d V_(B D)) / d(p d) = (B(ln(A p d) - ln(ln(gamma^(-1) + 1))) - B p d (p d)^(-1)) / (ln(A p d) - ln(ln(gamma^(-1) + 1)))^2 $)
$ (d V_(B D)) / d(p d) = (B(ln(A p d) - ln(ln(gamma^(-1) + 1)) - 1)) / (ln(A p d) - ln(ln(gamma^(-1) + 1)))^2 $<eq-2>

Recall that $V_(B D)$ has a local extrema at $(p d = x)$ if:
#no-num($ lr(dv(V_(B D), p d)|, size: #125%)_(p d = x) = 0 $)

Note that
#no-num($ (ln(A p d) - ln(ln(gamma^(-1) + 1)) - 1 != ln(A p d) - ln(ln(gamma^(-1) + 1))) $)
#no-num($ => ((ln(A p d) - ln(ln(gamma^(-1) + 1)) - 1 = 0) arrow.double (ln(A p d) - ln(ln(gamma^(-1) + 1)) != 0)) $)

Therefore, we can compute the zero(es) of the derivative of $V_(B D)$ with respect to $p d$ by calculating the zero(es) of $(ln(A p d) - ln(ln(gamma^(-1) + 1)) - 1)$. Let:
#no-num($ 0 = ln(A p d) - ln(ln(gamma^(-1) + 1)) - 1 $)
#no-num($ => 1 = ln((A p d) / ln(gamma^(-1) + 1)) $)
#no-num($ => e = (A p d) / ln(gamma^(-1) + 1) $)
#block(stroke: black, inset: 0.5em)[$ => p d = (e ln(gamma^(-1) + 1)) / A $<eq-3>] 

Therefore, $(x = (e ln(gamma^(-1) + 1)) / A)$ is a local extrema of $V_(B D)$.

We also claim that $(V_(B D)(x) = min(V_(B D)))$, which we can prove rigorously by analyzing the second derivative of $V_(B D)$ with respect to $p d$.

Now, consider the second derivative of $V_(B D)$ with respect to $p d$ (done with Wolfram Alpha):
#no-num[$ dv(V_(B D), (p d), 2) = (B) / (p d(ln(A p d) - ln(ln(gamma^(-1) + 1)))^2) $]

In the context of a Paschen Curve: 
#no-num[$ ((p > 0) and (d > 0)) => (p d > 0) $]
Additionally, per Table 1, $(B > 0)$. Since $((p d(ln(A p d) - ln(ln(gamma^(-1) + 1)))^2) > 0)$, this then implies that $(dv(V_(B D), (p d), 2) > 0)$. Therefore, since the graph of $V_(B D)$ is concave up, then the extrema $(x = (e ln(gamma^(-1) + 1)) / A)$ is an absolute minimum. 

Now, compute $V_(B D)$ at the local extrema present in @eq-3:
#no-num($ V_(B D)(x) = (B ((e ln(gamma^(-1) + 1)) / A)) / (ln(A ((e ln(gamma^(-1) + 1)) / A)) - ln(ln(gamma^(-1) + 1))) $)
#no-num($ V_(B D)(x) = (B (e ln(gamma^(-1) + 1))) / (A(ln(e ln(gamma^(-1) + 1)) - ln(ln(gamma^(-1) + 1)))) $)
#no-num($ V_(B D)(x) = (B (e ln(gamma^(-1) + 1))) / (A(1 + ln(ln(gamma^(-1) + 1)) - ln(ln(gamma^(-1) + 1)))) $)
#block(stroke: black, inset: 0.5em)[$ min(V_(B D)) = V_(B D)(x) = (B (e ln(gamma^(-1) + 1))) / A $] <eq-4>

#pagebreak()

= Appendix MATLAB Code <app-matlab>
#v(0.5em)

Here was the following code to generate the MATLAB figure:
```matlab
%% Params. for Paschen Curve
pd = logspace(-1,3,2000); % 0.1 to 1000 on a log-spaced grid
gamma = 0.01; %dimensionless; assuming electrodes are made out of stainless steel
Patm = 1013.25 %mbar
x = [Patm*0.2, (Patm+(4*68.948))*0.2] %mbar*cm

% Air
A_Air = 11; %m*bar^(-1)*cm^(-1)
B_Air = 274; %V*bar^(-1)*cm^(-1)

% Calculate the Paschen curve for Air
V_Air = B_Air .* pd ./ (log(pd) + log(A_Air) - log(log((1 / gamma) + 1)));
V_Air((log(pd) + log(A_Air) - log(log((1 / gamma) + 1))) <= 0) = NaN;

% Ar
A_Ar = 9; %m*bar^(-1)*cm^(-1)
B_Ar = 135; %V*bar^(-1)*cm^(-1)
V_Ar = B_Ar .* pd ./ (log(pd) + log(A_Ar) - log(log((1 / gamma) + 1)));
V_Ar((log(pd) + log(A_Ar) - log(log((1 / gamma) + 1))) <= 0) = NaN;

% CO2
A_CO2 = 15 %m*bar^(-1)*cm^(-1)
B_CO2 = 350 %V*bar^(-1)*cm^(-1)
V_CO2 = B_CO2 .* pd ./ (log(pd) + log(A_CO2) - log(log((1 / gamma) + 1)));
V_CO2((log(pd) + log(A_CO2) - log(log((1 / gamma) + 1))) <= 0) = NaN;

% Plot the Paschen curves for Air, Argon, and CO2
figure;
loglog(pd, V_Air, 'b', 'DisplayName', 'Air');
hold on;
loglog(pd, V_Ar, 'r', 'DisplayName', 'Argon');
loglog(pd, V_CO2, 'g', 'DisplayName', 'CO2');
y_air_pts = interp1(pd, V_Air, x, 'makima');
scatter(x, y_air_pts, 'filled', 'DisplayName', 'Selected Paschen Curve Points');
hold off;
grid on;
xlabel('pd (mbar \cdot cm)');
ylabel('Voltage (V)');
title('Paschen Curves for Different Gases');
legend('show');
```
#pagebreak()

= Appendix Typst Code
#v(0.5em)
If you're interested in seeing the code I used to produce this document, here's my template ```conf.typ``` file:
```typ
#show figure: set block(below: (2.0em))
#let numbered_eq(content) = math.equation(
    block: true,
    numbering: "(1)",
    content,
)

#let date = datetime.today()
#show table.cell.where(y: 0): set text(weight: "bold")

#let conf(
  course_code: [XYZ 123],
  course_title: [Course Title],
  course_color: gradient.linear(..color.map.plasma),
  authors: ("Allen Rakhamimov", "Additional Authors"),

  title: [Document Title],
  instructors: ("Professor 1", "Professor 2",),
  month: [datetime.now().month.repr:long],
  year: [2025],
  doc,
) = {
  set page(
    paper: "us-letter",
    margin: (1in),
  )
  
  set text(
    font: "New Computer Modern",
    size: 12pt
  )

  set par(
    leading: 1.30em
  )

  show link: url => underline(text(fill: rgb(0, 0, 255))[#url])
  
  let date = [#month #year]
  let left_head = [#course_code: #title]
  let course = [#course_code: #course_title]
  
  // Dynamic right header :)
  let right_head = [
    Joshua Davidov \
  ]
  
  // Course Title
  text(course_color, size: 24pt)[
    #box(course)
  ]
  v(1em, weak: true)

  for author in authors [
      #if author != authors.at(-1) [
        #author   
      ] else [
        #author
      ]
    ]
  
  // Document Title
  place(
    horizon + center,
    text(size: 24pt)[#title] 
  )
  
  place(
    bottom + right,
    [
      #if instructors.len() > 1 [
        Instructors:
      ] else [
        Instructor:
      ]
      #for instructor in instructors [
        #if instructor != instructors.at(-1) [
          #instructor\
        ] else [
          #instructor
        ]
      ]
      
      #date
    ]
  )
  
  pagebreak()
  // Create header but only after title page
  counter(page).update(1)
  set page(
    numbering: "1",
    header: [
      #set text(10pt)
      #left_head
      #h(1fr) Davidov, J. 2026
      #v(0.6em, weak: true)
      #line(length: 100%, stroke: 0.5pt)
    ],
  )
  doc
}

```
#pagebreak()
= References
#v(1em)

[1] B. Gerke et al., "Suppression of electrical breakdown phenomena in liquid TriMethyl Bismuth based ionization detectors," _Journal of Instrumentation_, vol. 17, no. 09, p. P09029, Sep. 2022, doi: 10.1088/1748-0221/17/09/P09029.
