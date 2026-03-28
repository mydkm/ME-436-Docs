import numpy as np
import matplotlib.pyplot as plt

# Motor parameters from the pre-lab
R = 8.4          # ohm
L = 0.00116      # H
Jm = 4.65e-6     # kg*m^2
Km = 0.042       # N*m/A
Kb = 0.042       # V/(rad/s)
B = 0.0          # viscous damping neglected for part (e)

# Disc parameters
m_disc = 0.053    # kg
r_disc = 0.0248   # m

# Disc inertia: Jd = (1/2) m r^2
Jd = 0.5 * m_disc * r_disc**2

# Total inertia
J = Jm + Jd

# Second-order transfer function denominator:
# G(s) = Km / [LJ s^2 + (LB + RJ) s + (RB + Kb*Km)]
den = [L * J, L * B + R * J, R * B + Kb * Km]

# Find poles
poles = np.roots(den)

# Print results
print(f"Disc inertia Jd = {Jd:.8e} kg*m^2")
print(f"Total inertia J  = {J:.8e} kg*m^2")
print("\nDenominator coefficients:")
print(f"a2 = {den[0]:.8e}")
print(f"a1 = {den[1]:.8e}")
print(f"a0 = {den[2]:.8e}")

print("\nPoles of the system:")
for i, p in enumerate(poles, start=1):
    print(f"pole {i} = {p:.8f}")

# Optional: identify dominant pole
dominant_pole = poles[np.argmax(np.real(poles))]   # closest to the imaginary axis
print(f"\nDominant pole = {dominant_pole:.8f}")

# Optional: plot poles on the complex plane
plt.figure(figsize=(6, 6))
plt.axhline(0, linewidth=1)
plt.axvline(0, linewidth=1)
plt.plot(np.real(poles), np.imag(poles), 'x', markersize=10, label='Poles')
plt.xlabel('Real')
plt.ylabel('Imaginary')
plt.title('Pole Locations of DC Motor System')
plt.grid(True)
plt.legend()
plt.show()