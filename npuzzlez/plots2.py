import pandas as pd
import matplotlib.pyplot as plt
import sys

if len(sys.argv) != 2:
    print("Usage: python plot_benchmark.py <taquin_size>")
    sys.exit(1)

target_size = int(sys.argv[1])  # Taille du taquin à visualiser

df = pd.read_csv('benchmark_results.csv')

# Filtrer par taille
df = df[df['Size'] == target_size]

# Calculer la moyenne des temps pour chaque combinaison (Length, Algorithm)
avg_times = df.groupby(['Length', 'Algorithm'])['Time'].mean().reset_index()

# Créer le graphique
plt.figure(figsize=(10, 6))
for algo in avg_times['Algorithm'].unique():
    subset = avg_times[avg_times['Algorithm'] == algo]
    plt.plot(subset['Length'], subset['Time'], marker='o', label=algo.upper())

plt.title(f'Temps moyen de résolution - Taquin {target_size}x{target_size}')
plt.xlabel('Longueur de la solution (Difficulty)')
plt.ylabel('Temps moyen (s)')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig(f'plot_{target_size}x{target_size}.png')
plt.show()
