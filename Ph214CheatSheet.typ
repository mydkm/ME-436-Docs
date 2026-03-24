#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *

#set page(
)
#set par(
  spacing: 2.0em,
)
#set text(7.5pt)

#columns(3, gutter: 12em)[
  = Vector Algebra
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
  $ nabla^2 t = pdv(t, x, 2) + pdv(t, y, 2) + pdv(t, z, 2) $

  $ A dot (B times C) = B dot (C times A) = C dot (A times B) $
  $ A times (B times C) = B (A dot C) - C (A dot B) $
  $ nabla (f g) = f (nabla g) + g (nabla f) $
  $ nabla (A dot B) = A times (nabla times B) + B times (nabla times A) + (A dot nabla) B + (B dot nabla) A $
  $ nabla dot (f A) = f (nabla dot A) + A dot (nabla f) $
  $ nabla dot (A times B) = B dot (nabla times A) - A dot (nabla times B) $
  $ nabla times (f A) = f (nabla times A) - A times (nabla f) $
  $ nabla times (A times B) = (B dot nabla) A - (A dot nabla) B + A (nabla dot B) - B (nabla dot A) $
  $ nabla dot (nabla times A) = 0 $
  $ nabla times (nabla f) = 0 $
  $ nabla times (nabla times A) = nabla (nabla dot A) - nabla^2 A $

  = Fundamental Theorems
  $ integral_a^b (nabla f) dot d l = f(b) - f(a) $
  $ integral_V (nabla dot A) d tau = integral_S A dot d a $
  $ integral_S (nabla times A) dot d a = integral_P A dot d l $

  = Units
  $ 1 N = 1 (("kg" dot m) / s^2) $
  $ 1 J = 1 (N dot m) $
  $ 1 W = 1 (J/s) $
  $ 1 V = 1 (J/C) $
  $ 1 F = 1 (C/V) $
  $ 1 A = 1 (C/s) $
  $ 1 T = 1 (N/(A dot m)) $

  = Constants 
  $ k = 9 times 10^9 ((N dot m^2) / C^2) $
  $ epsilon_0 = 8.85 times 10^(-12) (C^2 / (N dot m^2)) $
  $ e = 1.6 times 10^(-19) C $
  $ m_e = 9.1 times 10^(-31) "kg" $
  $ m_p = 1.67 times 10^(-27) "kg" $
  $ mu_0 = 4 pi times 10^(-7) ((T dot m) / A) $
  $ c = 2.998 times 10^8 (m/s) $
  $ "kilo" = 10^3, "mega" = 10^6 $ 
  $ "giga" = 10^9, "tera" = 10^12 $
  $ "milli" = 10^(-3), "micro" = 10^(-6) $ 
  $ "nano" = 10^(-9), "pico" = 10^(-12) $

  $ e^(i x) = cos x + i sin x $

  = Ch. 1
  $ k: "wave number" $
  $ omega: "angular frequency" $
  $ k = (2 pi) / lambda $
  $ omega/(2 pi) = f = 1/T $
  $ 1/sqrt(mu epsilon) = v = omega/k $
  $ 1/sqrt(mu_0 epsilon_0) = c = omega/k #h(1em) ("in free space") $
  $ arrow(F)_E = 1/(4 pi epsilon_0) ((q_1 q_2) / r^2) hat(r) $
  $ arrow(F)_B = q arrow(v) times arrow(B) $
  $ arrow(E) = 1/(4 pi epsilon_0) (q/r^2) hat(r) $
  $ arrow(B) = mu_0/(4 pi) integral_P (I d arrow(s) times hat(r)) / r^2 $
  $ integral_S arrow(E) dot d arrow(a) = (q#sub[enc])/epsilon_0,#h(1.0em) nabla dot arrow(E) = rho/epsilon_0 #h(1em) (=0, "in free space") $
  $ integral_S arrow(B) dot d arrow(a) = 0, #h(1.0em) nabla dot arrow(B) = 0 $
  $ integral_P arrow(B) dot d arrow(l) = mu_0 i#sub[enc] + mu_0 epsilon_0 (d Phi_E) / (d t) $ 
  $ nabla times arrow(B) = mu_0 arrow(J) + mu_0 epsilon_0 pdv(arrow(E), t) #h(1em) (=mu_0 epsilon_0 pdv(arrow(E), t), "in free space") $
  $ integral_P arrow(E) dot d arrow(l) = - (d Phi_B) / (d t) , #h(1.0em) nabla times arrow(E) = - pdv(arrow(B), t) $
  $ nabla dot arrow(J) + pdv(rho, t) = 0, #h(1.0em) integral_S arrow(J) dot d arrow(a) = - (d q) / (d t) $
  $ nabla^2 arrow(F) = mu_0 epsilon_0 pdv(arrow(F), t, 2) = 1/v^2 pdv(arrow(F), t, 2) $
  $ arrow(E) = (E_(0x) e^(i phi_x) hat(x) + E_(0y) e^(i phi_y) hat(y)) e^(i (k z - omega t)) $
  $ |arrow(E)|^2 = arrow(E) dot overline(arrow(E)) $
  $ "Re" {arrow(E)} = E_(0x) cos(k z - omega t + phi_x) hat(x) + E_(0y) cos(k z - omega t + phi_y) hat(y) $
  $ epsilon = |phi_x - phi_y| $
  $ ((epsilon) ("mod" pi) = 0) => "linear polarization" $
  $ ((epsilon) ("mod" pi) = pi/2) => "circular polarization" $
  $ "else" => "elliptical polarization" $
  $ x^2 / E_(0x)^2 + y^2 / E_(0y)^2 - (2 x y)/(E_(0x) E_(0y)) cos epsilon = sin^2 epsilon $
  $ arrow(E)(arrow(r), t) = arrow(E)_0 e^(i (arrow(k) dot arrow(r) - omega t)) $
  $ arrow(B)(arrow(r), t) = arrow(B)_0 e^(i (arrow(k) dot arrow(r) - omega t)) $
  $ arrow(k) = k_x hat(x) + k_y hat(y) + k_z hat(z) #h(1em) ("dir. of wave propagation") $
  $ arrow(r) = x hat(x) + y hat(y) + z hat(z) $
  $ R_theta(arrow(x)) = mat(delim: "(", cos theta, -sin theta; sin theta, cos theta) arrow(x) $

  = Ch. 2
  $ nabla dot arrow(E) = i arrow(k) dot arrow(E) $
  $ nabla times arrow(E) = i arrow(k) times arrow(E) $
  $ norm(arrow(E)) / norm(arrow(B)) = omega/k = c $
  $ u_E = 1/2 epsilon_0 norm(arrow(E))^2 $
  $ u_B = 1/(2 mu_0) norm(arrow(B))^2 $
  $ u_E = u_B $
  $ u = u_E + u_B = epsilon_0 norm(arrow(E))^2 $
  $ arrow(S) = (mu_0)^(-1) (arrow(E) times arrow(B)) = arrow(E) times arrow(H) $
  $ pdv(u, t) + nabla dot arrow(S) = 0 $
  $ arrow(S) = (1 / mu_0) norm(arrow(E)) norm(arrow(B)) hat(k) = (1/(c mu_0)) norm(arrow(E))^2 hat(k) = c u hat(k) $
  $ I = chevron.l arrow(S) chevron.r = 1/2 epsilon_0 E_0^2 c $
  $ chevron.l u chevron.r = 1/2 epsilon_0 E_0^2 $
  $ arrow(E) = 1/(mu_0 epsilon_0) integral_0^t (nabla times arrow(B)) d t' $
  $ arrow(B) = - integral_0^t (nabla times arrow(E)) d t' $
  $ arrow(E)(arrow(r), t) = (q a sin theta) / (4 pi epsilon_0 c^2 r) hat(theta) $
  $ arrow(S)(arrow(r), t) = (arrow(E) times arrow(B))/mu_0 $
  $ |arrow(S)| = epsilon_0 c |arrow(E)|^2 = (q^2 a^2 sin^2 theta) / (16 pi^2 epsilon_0 r^2 c^3) $
  $ P#sub[rad] = (q^2 a^2) / (6 pi epsilon_0 c^3) $
  $ P(t) = (q^4 |arrow(E)_0|^2 cos^2(omega t)) / (6 pi epsilon_0 c^3) $
  $ a = q norm(arrow(E)_0) cos(omega t) $
  $ chevron.l P(t) chevron.r = (q^4 norm(arrow(E)_0)^2) / (12 pi epsilon_0 m^2 c^3) $
  $ chevron.l P(t) chevron.r = ((8 pi) / 3) (q^2 / (4 pi epsilon_0 m c^2))^2 $ $  =  chevron.l S chevron.r#sub[inc] = sigma_T chevron.l S chevron.r#sub[inc] $
  $ chevron.l S chevron.r#sub[inc] = 1/2 epsilon_0 c |arrow(E)_0|^2 $
  $ chevron.l S chevron.r = chevron.l S_0 chevron.r e^(-n sigma z) $
  $ ("frac. scattered light") = 1 - e^(-n sigma z) $

  $ P(t) = (q^4 norm(arrow(E)_0)^2) / (6 pi epsilon_0 m^2 c^3) (omega^2 / (omega^2 - omega_0^2))^2 cos(omega t) $
  $ chevron.l P(t) chevron.r#sub[scatt] = sigma_T (omega^2 / (omega^2 - omega_0^2))^2 chevron.l S chevron.r#sub[inc] = sigma#sub[ray] chevron.l S chevron.r#sub[inc] $
  $ (chevron.l P(t) chevron.r#sub[scatt,1]) / (chevron.l P(t) chevron.r#sub[scatt,2]) = (sigma#sub[ray,1]) / (sigma#sub[ray,2]) = (omega_1/omega_2)^4 = (lambda_2/lambda_1)^4 $
  $ (a != 0) => ("radiates") $
  $ (v << c) => ("non-relativistic") $

  = Ch. 3
  $ arrow(B) := mu_0 arrow(H) + mu_0 arrow(M) = mu arrow(H) $
  $ arrow(D) := epsilon_0 arrow(E) + arrow(P) = epsilon arrow(E) = epsilon_0 kappa arrow(E) $
  $ arrow(p) = q d arrow(p) $
  $ arrow(tau) = arrow(p) times arrow(E) $
  $ arrow(P) = n chevron.l arrow(p)_i chevron.r = epsilon_0 chi_e arrow(E) $
  $ arrow(M) = n chevron.l arrow(m)_i chevron.r = chi_m arrow(H) $
  $ nabla dot arrow(D) = 0 , #h(1em) (hat(n) dot (arrow(D)_1 - arrow(D)_2) = 0 => D_1^perp = D_2^perp) $
  $ nabla dot arrow(B) = 0, #h(1em) (hat(n) dot (arrow(B)_1 - arrow(B)_2) = 0 => B_1^perp = B_2^perp) $
  $ nabla times arrow(E) = - pdv(arrow(B), t), #h(1em) (hat(n) times (arrow(E)_1 - arrow(E)_2) = 0 => E_1^parallel = E_2^parallel) $
  $ nabla times arrow(H) = pdv(arrow(D), t), #h(1em) (hat(n) times (arrow(H)_1 - arrow(H)_2) = 0 => H_1^parallel = H_2^parallel) $

  $ norm(arrow(E)) / norm(arrow(H)) = Z = (mu / epsilon)^(1/2) $
  $ n_1 sin (theta_i) = n_2 sin(theta_t) $
  $ theta_i = theta_r $
  $ r_perp = -(n_1 cos(theta_i) - n_2 cos(theta_t)) / (n_1 cos(theta_i) + n_2 cos(theta_t)) = - (cos(theta_i) - sqrt((n_2 / n_1)^2 - sin^2(theta_i) )) / ( cos(theta_i) + sqrt((n_2 / n_1)^2 - sin^2(theta_i) ) ) $
  $ t_perp = (2 n_1 cos(theta_i)) / (n_1 cos(theta_i) + n_2 cos(theta_t)) = (2cos(theta_i)) / ( cos(theta_i) + sqrt((n_2 / n_1)^2 - sin^2(theta_i) ) ) $
  $ r_parallel = (n_2 cos(theta_i) - n_1 cos(theta_t)) / (n_2 cos(theta_t) + n_1 cos(theta_i)) =  ((n_2 / n_1)^2 cos(theta_i) - sqrt((n_2 / n_1)^2 - sin^2(theta_i) )) / ( (n_2 / n_1)^2 cos(theta_i) + sqrt((n_2 / n_1)^2 - sin^2(theta_i) ) ) $
  $ t_parallel = (2n_1 cos(theta_i)) / (n_2 cos(theta_t) + n_1 cos(theta_i)) =  (2(n_2 / n_1) cos(theta_i)) / ( (n_2 / n_1)^2 cos(theta_i) + sqrt((n_2 / n_1)^2 - sin^2(theta_i) ) ) $
  $ R = r^2, #h(1em) T = t^2 $
  $ theta_B = tan^-1(n_2 / n_1) $
]