import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Parameters
L = 1.0      # H
R = 10.0      # ohm
C = 0.10     # F

# Input function e_i(t)
def e_i(t):
    return 1.0   # 1 V step input

# State-space ODE
# x[0] = q
# x[1] = q_dot
def state_equations(t, x):
    q = x[0]
    q_dot = x[1]

    dqdt = q_dot
    dqdotdt = -(1/(L*C))*q - (R/L)*q_dot + (1/L)*e_i(t)

    return [dqdt, dqdotdt]

# Time span and initial conditions
t_span = (0, 10)
t_eval = np.linspace(t_span[0], t_span[1], 1000)
x0 = [0.0, 0.0]   # q(0)=0, q_dot(0)=0

# Solve
sol = solve_ivp(state_equations, t_span, x0, t_eval=t_eval)

# Extract states
t = sol.t
q = sol.y[0]
q_dot = sol.y[1]

# Output equation: e_o = (1/C) q
e_o = q / C

# Plot
plt.figure(figsize=(8, 5))
plt.plot(t, q, label=r'q(t)')
plt.plot(t, q_dot, label=r'dq/dt')
plt.plot(t, e_o, label=r'e_o(t) = q/C')
plt.xlabel('Time (s)')
plt.ylabel('Response')
plt.title('State-Space Solution of RLC System')
plt.grid(True)
plt.legend()
plt.show()