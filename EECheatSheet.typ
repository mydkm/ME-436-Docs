#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#set page(
  flipped: true,
  paper: "a5",
  margin: 0.75in,
)
#set par(
  spacing: 0.50em
)
#set text(12pt)


#columns(3)[
  $ Q_(e/p) = minus.plus 1.609*10^-19 C $ 
  $ i = dv(q,t) $
  $ Delta q(t) = integral^t_(t_0) i d t' $
  $ P = V i = i^2R  =V^2 / R $
  $ [V] = v, [Q] = C, [W] = J, [i] = A $
  $ V = i R $
  $ G = i/V = R^-1 $
  $ w = v Q $
  $ sum_I i = 0 "for some node I" $
  $ sum_P V = 0 "for some path P" $
  $ sum_E P#sub[absorbed] = sum _E P#sub[supplied] $
  $ "for a set of elements" E $
  $ R_#sub[eq]  = sum R_i "(series)" $
  $ 1/R_#sub[eq]  = sum 1/R_i "(parallel)" $
  $ v_k = (R_k / R_#sub[eq])v $
  $ i_k = ((R#sub[eq]) / (R_k))i $
  $ "A planar circuit has no" $
  $ "intersecting wires" $
  $ p_L = i^2_L R_L = (v^2_s R_L) / (R_s + R_L)^2  $
  $(R_L "will absorb max power") arrow$ 
  $ (R_L = R_s) $
  $ p_max = v_s^2 / (4R_s) = (v^2#sub[TH]) / (4 R#sub[TH]) $
  #figure(
  image("Delta-Wye-Calculator.jpg", width: 100%)
)<figure-1>
#figure(
  image("Screenshot 2026-03-26 at 11-06-21 Engineering Circuit Analysis 9th edition by William Hayt - engineering-circuit-analysis-9th edn by hayt.pdf.png", width: 80%)
)<figure-2>
#figure(
  image("Screenshot 2026-03-26 at 12-25-30 ESC 221 Lect 3 Summary a.pdf.png", width: 100%)
)<figure-3>
$ "No" i "ever flows" $ 
$ "into an I.O.A. terminal" $
$ "No volt. diff. between" $
$ "I.O.A. terminals" #h(0.5em) (v_+ = v_-) $
$ i = (v#sub[in]) / R_1 $
$ v#sub[out] = (- R_f / R_1)v#sub[in] $
#figure(
  image("Screenshot 2026-03-26 at 11-27-05 Engineering Circuit Analysis 9th edition by William Hayt - engineering-circuit-analysis-9th edn by hayt.pdf.png", width: 110%)
)<figure-3>
$ "+ is the non-inverting input" $
$ "- is the inverting input" $
]

