import scipy.signal
from scipy.integrate import odeint
import numpy as np
import matplotlib.pyplot as plt

m = 3000.0 #kg
x0 = [0.0, 0.0]
md = 2000.0 #kg, derived from mdg = 20000N
c = 40.0 * (10**3) #kg/s
k = 80.8 * (10**5) #N/m
num = np.array([0.0,0.0,20000.0])
dem = np.array([m, c, k, 0.0])

r, p, k0 = scipy.signal.residue(num, dem)

print("Residues (r):", r)
print("Poles (p):", p)
print("Direct term (k):", k)

def mass_spring_damper(state, t, m, c, k):
    x, v = state # Unpack position and velocity
    dxdt = v     # Derivative of position is velocity
    dvdt = (md*10 - c*v - k*x) / m # Acceleration (F=ma => a = (-cv -kx)/m)
    return [dxdt, dvdt]

t = np.linspace(0, 2.5, 1000)
sol1 = odeint(mass_spring_damper, x0, t, args=(m, c, k))
sol2 = odeint(mass_spring_damper, x0, t, args=(m + md, c, k))
position1 = sol1[:, 0]
velocity1 = sol1[:, 1]
position2 = sol2[:, 0]
velocity2 = sol2[:, 1]

fig, ax = plt.subplots(2, 1, figsize=(10, 7), sharex=True)

# Position
ax[0].plot(t, position1, label='m')
ax[0].plot(t, position2, label='m+md', linestyle='--')
ax[0].set_ylabel('Position (m)')
ax[0].set_title('Mass-Spring-Damper Response (m vs m+md)')
ax[0].grid(True)
ax[0].legend()

# Velocity
ax[1].plot(t, velocity1, label='m')
ax[1].plot(t, velocity2, label='m+md', linestyle='--')
ax[1].set_xlabel('Time (s)')
ax[1].set_ylabel('Velocity (m/s)')
ax[1].grid(True)
ax[1].legend()

plt.tight_layout()
plt.show()
