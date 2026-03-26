#import "@preview/axiom:0.1.0": *
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
3/3/2026 \ 
#align(center)[*#underline[Midterm 1 Take-Home]*]

Consider a car of mass $m = 1000"kg"$, suspension damping coefficient $b = 4000"kg/s"$, and stiffness $k=20000"N/m"$ as shown in figure 1. Consider the road surface shown as a displacement input of the base u(t). Neglect the mass and stiffness of the tire (unsprung mass and stiffness is zero). Assume x(t) is measured froms static equilibrium. \ \
Note that, by my sign convention, the positive $ hat(y)$ points directly upward, and the positive $hat(x)$ direction lies directly to the right. \ 
In part (a), we want to determine the transfer function $ (frac("X(s)", "U(s)", style: "horizontal"))$.
First, after applying Newton's second law, we get:
#numbered_eq[$ sum F_y = m dot.double(x) = -k(x - u) - b(dot(x) - dot(u)) $]<eq-1>
Rearranging  @eq-1 yields:
#numbered_eq[$ m dot.double(x) + b dot(x) + k x = b dot(u) + k u $]<eq-2>
If you were to take the Laplace Transform of both sides of  @eq-2, we get @eq-3 (assuming zero initial conditions):
#numbered_eq[$ m s^2 X(s) + b s X(s) + k X(s) = X(s)(m s^2 + b s + k) = U(s)(b s + k) = b s U(s) + k U(s) $]<eq-3>
Considering the form of @eq-3 where $X(s)$ and $U(s)$ are factored out of the equation, we can find the transfer equation by divide both sides of the equation by $U(s)$ and $m s^2 + b s + k$, hence:
#numbered_eq[$ X(s) / U(s) = (b s + k) / (m s^2 + b s + k) $]<eq-4>

Now consider $(u(t) = (0.01m)sin(omega_b t))$. If we were to take the Laplace Transform of $u$, we get:
#numbered_eq[$ U(s) = (0.01m)(omega_b / (s^2+omega_b^2)) $]<eq-5>

Plugging @eq-5 into @eq-4 and multiplying both sides by $U(s)$ yields the similar:
#numbered_eq[$X(s) = ( 100 (s^2 + omega_b^2)(b s+k)) / (omega_b (m s^2 + b s + k)) $]<eq-6>

This looks very ugly! Let's use ```py sympy``` (see reference code in Appendix Code) to solve for the closed form of $x(t):$
#numbered_eq[$ x(t) = (omega(4omega^2cos(4t) + (3omega^2 - 100)sin(4t)) - 4(omega^3cos(omega t) + (omega^2 - 100)sin(omega t)))/(100(omega^4 - 24omega^2 + 400)) $]<eq-7>
On the following page, we provide the plots/tables for parts (A)-(D). Note that all plots were generated using matplotlib.

#figure(
  image("ESC251_TakeHome1.png", width: 95%),
  caption: [$x(t)$ vs. Time $t$ (Part A)]
)<figure-1>

#figure(
  image("ESC251_TakeHome2.png", width: 95%),
  caption: [$X_max$ vs. Speed $v$ (Part B)]
)<figure-2>

#figure(
  image("ESC251_TakeHome3.png", width: 95%),
  caption: [$X_max$ vs. Angular Frequency $omega$ (Part C)]
)<figure-3>

#figure(
  table(
    columns: 3,

    table.header[Speed (km/h)][Ang. Freq. (rad/s)][*$X_max$ (m)*],
    [10],[2.909],[$1.412*10^-2$],
    [20],[5.818],[$1.133*10^-2$],
    [40],[11.636],[$4.072*10^-3$],
    [80],[23.271],[$1.797*10^-3$],
  ),
  caption: [Maximum Displacements for 4 Vehicle Speeds and Corresponding Ang. Frequencies (Part D)],
) <table-1>

Out of all possible frequencies, $max(x(t)) = 1.554*10^-2 "m"$ with corresponding $v = 13.52 "km/h"$ and $omega = 3.936 "rad/s"$.

#pagebreak()
#underline[*Appendix Code*]<Appendix> \
Here is the following python code used to solve for a closed form of $x(t)$ and plot all of the graphs:
```py
import sympy as sp
import numpy as np
import matplotlib.pyplot as plt

# parameters
m_val = 1000   # kg
b_val = 4000   # N*s/m (kg/s)
k_val = 20000  # N/m
A_val = sp.Rational(1, 100)  # m

def x_t_expression():
    # symbols
    t, s = sp.symbols("t s", real=True)
    omega = sp.symbols("omega", positive=True, real=True)  # forcing freq (rad/s)
    v_sym = sp.symbols("v", positive=True, real=True)      # speed parameter (for omega_b)

    # transfer function: X/U = (b s + k)/(m s^2 + b s + k)
    H = (b_val * s + k_val) / (m_val * s**2 + b_val * s + k_val)

    # input: u(t) = A sin(omega t)  -> U(s) = A*omega/(s^2 + omega^2)
    U = A_val * omega / (s**2 + omega**2)

    # output in Laplace domain and inverse Laplace
    X = sp.simplify(H * U)
    x_t_omega = sp.simplify(sp.inverse_laplace_transform(X, s, t))

    # remove implicit Heaviside(t) for t > 0
    x_t_omega = x_t_omega.subs(sp.Heaviside(t), 1)

    # omega_b(v) symbolically: omega_b = (5*pi/54)*v
    omega_b_sym = sp.Rational(5, 54) * sp.pi * v_sym
    x_t_v = sp.simplify(x_t_omega.subs(omega, omega_b_sym))

    return t, omega, v_sym, x_t_omega, x_t_v


if __name__ == "__main__":
    t_sym, omega_sym, v_sym, x_t_omega, x_t_v = x_t_expression()

    print("\nClosed-form x(t) in terms of omega (rad/s):")
    print(x_t_omega)

    # compute omega_b_values
    v_values = np.array([10.0, 20.0, 40.0, 80.0])  # (use whatever units your formula assumes)
    omega_b_values = (5.0 * np.pi / 54.0) * v_values    # rad/s

    # time
    t_vals = np.linspace(0.0, 6.0, 10000)

    # change equation syntax to numpy syntax
    x_num = sp.lambdify((t_sym, omega_sym), x_t_omega, modules="numpy")
    
    v_scan = np.linspace(0.0, 100.0, 600)                 # km/h (choose range/resolution you want)
    omega_scan = (5.0 * np.pi / 54.0) * v_scan            # rad/s

    # Evaluate on a (Nt x Nv) grid via broadcasting
    # t_vals[:, None] is (Nt,1), omega_scan[None,:] is (1,Nv) -> broadcast to (Nt,Nv)
    Y = x_num(t_vals[:, None], omega_scan[None, :])
    Y = np.asarray(Y, dtype = float)

    # choose X_max
    absY = np.abs(Y)
    it, iv = np.unravel_index(np.argmax(absY), absY.shape)

    t_star = t_vals[it]
    v_star = v_scan[iv]
    omega_star = omega_scan[iv]
    x_star = Y[it, iv]

    print("\nGlobal peak over t in [0, 6] s and v in linspace:")
    print(f"  max |x(t)| = {abs(x_star):.6e} m  (x = {x_star:+.6e} m)")
    print(f"  at t = {t_star:.4f} s,  v = {v_star:.2f} km/h,  ω = {omega_star:.4f} rad/s")

    # plot for part (a)
    plt.figure()
    for v, w in zip(v_values, omega_b_values):
        y = x_num(t_vals, float(w)) 
        y = np.asarray(y, dtype=float)
        plt.plot(t_vals, y, label=f"v={v:g} km/h, ω={w:.3f} rad/s")

    plt.title("$x(t)$ vs. Time")
    plt.xlabel("t (s)")
    plt.ylabel("$x(t)$ (m)")
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    plt.show()

    def H_mag(omega_arr: np.ndarray) -> np.ndarray:
        omega_arr = np.asarray(omega_arr, dtype=float)
        num = np.sqrt(k_val**2 + (b_val * omega_arr)**2)
        den = np.sqrt((k_val - m_val * omega_arr**2)**2 + (b_val * omega_arr)**2)
        return num / den

    # Smooth curve over speed
    v_plot = np.linspace(0.0, 100.0, 600)  # km/h
    omega_plot_from_v = (5.0 * np.pi / 54.0) * v_plot
    Xmax_vs_v = A_val * H_mag(omega_plot_from_v)

    # highlight requested speeds
    v_hi = np.array([10.0, 20.0, 40.0, 80.0])
    omega_hi = (5.0 * np.pi / 54.0) * v_hi
    Xmax_hi = A_val * H_mag(omega_hi)

    # plot for part (b)
    plt.figure()
    plt.plot(v_plot, Xmax_vs_v, linewidth=2, label=r"$X_{\max}(v)=A\,|H(j\omega_b(v))|$")
    plt.scatter(v_hi, Xmax_hi, zorder=5)

    for vv, xx in zip(v_hi, Xmax_hi):
        plt.annotate(f"{vv:g} km/h\n{xx:.4e} m",
                     xy=(vv, xx),
                     xytext=(8, 10),
                     textcoords="offset points")

    plt.title(r"$X_{\max}$ vs. Speed")
    plt.xlabel("$v$ (km/h)")
    plt.ylabel(r"$X_{\max}$ (m)")
    plt.grid(True)
    plt.tight_layout()
    plt.show()

    # Smooth curve over frequency
    omega_plot = np.linspace(0.0, 1.25 * omega_hi.max(), 800)  # rad/s
    Xmax_vs_omega = A_val * H_mag(omega_plot)

    # plot for part (c)
    plt.figure()
    plt.plot(omega_plot, Xmax_vs_omega, linewidth=2, label=r"$X_{\max}(\omega)=A\,|H(j\omega)|$")

    # highlight the base frequencies for the requested speeds
    plt.scatter(omega_hi, Xmax_hi, zorder=5)

    for vv, ww, xx in zip(v_hi, omega_hi, Xmax_hi):
        plt.annotate(f"ω={ww:.3f}rad/s \n{xx:.4e} m",
                     xy=(ww, xx),
                     xytext=(8, 10),
                     textcoords="offset points")

    plt.title(r"$X_{\max}$ vs. Angular Frequency")
    plt.xlabel(r"$\omega$ (rad/s)")
    plt.ylabel(r"$X_{\max}$ (m)")
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    plt.show()
    ```<code-1>

the script returns the following:

```py
(omega*(4*omega**2*cos(4*t) + (3*omega**2 - 100)*sin(4*t)) - 4*(omega**3*cos(omega*t) + (omega**2 - 100)*sin(omega*t))*exp(2*t))*exp(-2*t)/(100*(omega**4 - 24*omega**2 + 400))

Global peak over t in [0, 6] s and v in linspace:
  max |x(t)| = 1.554239e-02 m  (x = +1.554239e-02 m)
  at t = 5.3501 s,  v = 13.52 km/h,  ω = 3.9335 rad/s
```

