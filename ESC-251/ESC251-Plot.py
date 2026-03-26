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