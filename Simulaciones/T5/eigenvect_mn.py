import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path

# Definición del dominio espacial
L = 1.0
x = np.linspace(0, L, 60)
y = np.linspace(0, L, 60)
X, Y = np.meshgrid(x, y)

# Configuración del mosaico 3D de 3x3
fig = plt.subplots(figsize=(13, 11))[0]
plt.close(fig)

fig = plt.figure(figsize=(14, 12))

for n in range(1, 4):
    for m in range(1, 4):
        idx = (n - 1) * 3 + m
        ax = fig.add_subplot(3, 3, idx, projection="3d")

        # Autofunción modal (uv)_{nm}
        Z = np.sin(n * np.pi * X / L) * np.sin(m * np.pi * Y / L)

        # Superficie de deformación transversal
        surf = ax.plot_surface(
            X,
            Y,
            Z,
            cmap="coolwarm",
            edgecolor="none",
            alpha=0.9,
            antialiased=True,
        )

        ax.set_zlim(-1.1, 1.1)
        ax.set_xticks([0, L])
        ax.set_yticks([0, L])
        ax.set_zticks([-1, 0, 1])
        ax.view_init(elev=32, azim=-60)

plt.tight_layout()
plt.show()
import matplotlib.pyplot as plt
import numpy as np

# Definición del dominio espacial
L = 1.0
x = np.linspace(0, L, 60)
y = np.linspace(0, L, 60)
X, Y = np.meshgrid(x, y)

# Configuración del mosaico 3D de 3x3
fig = plt.subplots(figsize=(13, 11))[0]
plt.close(fig)

fig = plt.figure(figsize=(14, 12))

for n in range(1, 4):
    for m in range(1, 4):
        idx = (n - 1) * 3 + m
        ax = fig.add_subplot(3, 3, idx, projection="3d")

        # Autofunción modal (uv)_{nm}
        Z = np.sin(n * np.pi * X / L) * np.sin(m * np.pi * Y / L)

        # Superficie de deformación transversal
        surf = ax.plot_surface(
            X,
            Y,
            Z,
            cmap="coolwarm",
            edgecolor="none",
            alpha=0.9,
            antialiased=True,
        )

        ax.set_title(f"$n = {n},\\ m = {m}$", fontsize=11, pad=10)
        ax.set_zlim(-1.1, 1.1)
        ax.set_xticks([0, L])
        ax.set_yticks([0, L])
        ax.set_zticks([-1, 0, 1])
        ax.view_init(elev=32, azim=-60)

fig.suptitle(
    r"Formas Modales 3D: $\phi_{nm}(x,y) = \sin\left(\frac{n\pi x}{L}\right)\sin\left(\frac{m\pi y}{L}\right)$",
    fontsize=15,
    y=0.96,
)
plt.tight_layout()
fig.savefig(Path(__file__).with_name("eigenvect3D1_mn.png"), dpi=300, bbox_inches="tight")
plt.show()