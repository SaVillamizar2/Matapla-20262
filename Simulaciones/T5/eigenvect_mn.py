import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path

# Parámetros del dominio
L = 1.0
x = np.linspace(0, L, 200)
y = np.linspace(0, L, 200)
X, Y = np.meshgrid(x, y)

# Configuración de la cuadrícula de subplots (3x3)
fig, axes = plt.subplots(3, 3, figsize=(10, 10), constrained_layout=True)

for n in range(1, 4):
    for m in range(1, 4):
        ax = axes[n - 1, m - 1]

        # Evaluación del autovector (uv)_{nm}
        Z = np.sin(n * np.pi * X / L) * np.sin(m * np.pi * Y / L)

        # Mapa de contornos rellenos
        contour = ax.contourf(X, Y, Z, levels=50, cmap="coolwarm", vmin=-1, vmax=1)

        # Líneas nodales (donde la deformación es exactamente cero)
        ax.contour(X, Y, Z, levels=[0], colors="black", linewidths=1.5)

        ax.set_title(f"$n={n},\\ m={m}$", fontsize=11)
        ax.set_aspect("equal")
        ax.set_xticks([0, L])
        ax.set_yticks([0, L])

fig.suptitle(
    r"Autovectores $uv(x,y) = \sin\left(\frac{n\pi x}{L}\right)\sin\left(\frac{m\pi y}{L}\right)$",
    
    fontsize=14,
)
fig.savefig(Path(__file__).with_name("eigenvect_mn.png"), dpi=300, bbox_inches="tight")
plt.show()