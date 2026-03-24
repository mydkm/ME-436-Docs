#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#set page(
  margin: 0.50in,
)
#set par(
  spacing: 0.50em
)
#set text(12pt)


#columns(3)[
  = Vector Idenities/Derivatives
  $ d l = (d x) hat(x) + (d y) hat(y) + (d z) hat(z) $ 
  $ d tau = d x d y d z $
  $ nabla t = pdv(t, x) hat(x) + pdv(t, y) hat(y) + pdv(t, z) hat(z) $
  $ nabla dot v = pdv(v_x, x) + pdv(v_y, y) + pdv(v_z, z) $
  $ nabla times v = mat(
    delim: "|",
    hat(x), hat(y), hat(z);
    pdv(#none, x), pdv(#none, y), pdv(#none, z);
    v_x, v_y, v_z
    ) $


//   $ Q_(e/p) = minus.plus 1.609*10^-19 C $ 
//   $ i = dv(q,t) $
//   $ Delta q(t) = integral^t_(t_0) i d t' $
//   $ P = V i = i^2R  =V^2 / R $
//   $ [V] = v, [Q] = C, [W] = J, [i] = A $
//   $ V = i R $
//   $ G = i/V = R^-1 $
//   $ w = v Q $
//   $ sum_I i = 0 "for some node I" $
//   $ sum_P V = 0 "for some path P" $
//   $ sum_E P#sub[absorbed] = sum _E P#sub[supplied] $
//   $ "for a set of elements" E $
//   $ R_#sub[eq]  = sum R_i "(series)" $
//   $ 1/R_#sub[eq]  = sum 1/R_i "(parallel)" $
//   $ v_k = (R_k / R_#sub[eq])v $
//   $ i_k = ((R#sub[eq]) / (R_k))i $
//   $ "A planar circuit has no" $
//   $ "intersecting wires" $
//   #figure(
//   image("Screenshot 2026-02-26 at 10-20-26 ECE212H1_20209_661608926347ECE212 Final Cheat Sheet.pdf.png", width: 100%)
// )<figure-1>
]
