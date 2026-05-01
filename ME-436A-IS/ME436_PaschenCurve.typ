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

a) Derive $min(V_(B D))$.

b) Plot the Paschen curves for air, argon, and carbon dioxide given literature Paschen constants.

c) Plot points representing the breakdown voltage of air at different selected $p d$ values.

d) Plot the Paschen curve for air given different secondary Townsend coefficients. 


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

= Graphs/Tables
#v(0.5em)
To produce these graphs, we first have to assume:
- The electric fields between the electrodes are uniform.
- Secondary electrons are produced at the cathode only due to the impact of positive ions created during a Townsend discharge.
- The density of ionized particles is negligible so that it does not affect the uniform electric field between the cathodes.
- The gas between the plates is ideal.

All relevant Paschen Law constants $(A, B , "and" gamma)$ to plot the Paschen curves of relevant gases were derived from Table 4.1 of _Plasma Chemistry_#super[1] by Alexander Fridman.
#figure(
  table(
    columns: 3,

    table.header[Gas][A $("torr"^(-1) dot "cm"^(-1))$) ][B $(V dot "torr"^(-1) dot "cm"^(-1))$],
    [He], [3], [34],
    [Ar], [12], [180],
    [Air], [15], [365],
    [Ne], [4], [100],
    [$"CO"_2$], [20], [466]
  ),
  caption: [_Table of Paschen Constants, derived from Plasma Chemistry by Alexander Fridman_],
) <table-1>

The selected air Paschen curve points are:

 $ p d in {(760.00 "mbar" dot 2 "mm"), (966.86 "mbar" dot 2 "mm")}$.


#figure(
  image("ME436_PaschenGasCurve.png", width: 100%),
  caption: [_Paschen Curves for Air, Argon, and Carbon Dioxide, with Selected Air Breakdown-Voltage Points_]
) <figure-1>

As per #link("https://ut3-toulouseinp.hal.science/hal-03876835v1/document")["A Townsend’s secondary ionization coefficient estimation
method for partial discharge inception voltage prediction for
insulating polymers"]#super[2], there exists materials that, if they were to be used as electrodes in a plasma system similar to the one used in our Plasma lab, would have a secondary Townsend coefficient of $(gamma in [10^(-5), 10^(-1)])$. Therefore, consider the following figure containing the Paschen curve of air for secondary Townsend coefficients $(gamma in {10^(-5), 10^(-4), 10^(-3), 10^(-2), 10^(-1)})$.

#figure(
  image("ME436_PaschenGasCurve2.png", width: 100%),
  caption: [_Paschen Curve of Air of Selected Secondary Townsend Coefficients_]
) <figure-2>

Note: This behavior makes mathematical sense, as $(V prop log(log(1 / gamma) + 1))$, and physical sense, as a higher secondary Townsend coefficient results in a greater average amount of secondary electrons released per successful atom collision, which increases the likelihood of Townsend discharges to occur.

#pagebreak()


= Appendix MATLAB Code <app-matlab>
#v(0.5em)

Here was the following code to generate the MATLAB figure:

#raw(read("../../ESC-251-Matlab/ME436_PaschenCurve.m"), lang: "matlab", block: true)

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

[1] A. Fridman, Plasma Chemistry. Cambridge, U.K.: Cambridge Univ. Press, 2008.

[2] Y. Kemari, C. van de Steen, G. Belijar, L. Laudebat, S. Diaham, Z. Valdez-Nava, and C. Abadie, “A Townsend’s secondary ionization coefficient estimation method for partial discharge inception voltage prediction for insulating polymers,” in _Proc. 2022 IEEE 4th Int. Conf. on Dielectrics (ICD)_, Palermo, Italy, Jul. 2022, pp. 226–229, doi: 10.1109/ICD53806.2022.9863604. 

