import numpy as np
import matplotlib.pyplot as plt
import os

# Chemin vers le dossier contenant les fichiers
path = './vrai_result/'

# Chargement des données
b1st_cas1 = np.load(os.path.join(path, 'bathy_1st_cas1.npy'))
b1st_cas2 = np.load(os.path.join(path, 'bathy_1st_cas2.npy'))
#b1st_cas3 = np.load(os.path.join(path, 'bathy_1st_cas3.npy'))

bst_cas1 = np.load(os.path.join(path, 'bathy_star_cas1.npy'))
bst_cas2 = np.load(os.path.join(path, 'bathy_star_cas2.npy'))
#bst_cas3 = np.load(os.path.join(path, 'bathy_star_cas3.npy'))

b_true = np.load(os.path.join(path, 'bathy_t.npy'))  # Si vous avez ce fichier
# Création de l'axe x (supposons une rivière de 100 km discrétisée)
L = 100  # Longueur en km
x = np.linspace(0, L, len(b1st_cas1))

# Configuration du graphique
plt.figure(figsize=(12, 8))

# Tracer les bathymétries initiales (b1st)
plt.plot(x, b1st_cas1, 'r--', label='1st guess Cas 1', linewidth=1.5)
plt.plot(x, b1st_cas2, 'g--', label='1st guess Cas 2', linewidth=1.5)
#plt.plot(x, b1st_cas3, 'b--', label='1st guess Cas 2', linewidth=1.5)

# Tracer les bathymétries estimées (bstar)
plt.plot(x, bst_cas1, 'r-', label='Solution estimée Cas 1', linewidth=2)
plt.plot(x, bst_cas2, 'g-', label='Solution estimée Cas 2', linewidth=2)
#plt.plot(x, bst_cas3, 'b-', label='Solution estimée Cas 2', linewidth=2)
plt.plot(x, b_true, 'k-', label='Vraie bathymétrie', linewidth=3)

# Personnalisation
plt.xlabel('Distance (km)', fontsize=12)
plt.ylabel('Élévation (m)', fontsize=12)
plt.title('Comparaison des bathymétries initiales et estimées', fontsize=14)
plt.legend(fontsize=10, bbox_to_anchor=(1.05, 1), loc='upper left')
plt.grid(True, linestyle='--', alpha=0.7)
plt.tight_layout()

# Sauvegarde et affichage
plt.savefig(os.path.join(path, 'comparaison_bathymetries.png'), dpi=300, bbox_inches='tight')
plt.show()