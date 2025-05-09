import pandas as pd
import matplotlib.pyplot as plt

# Charger le fichier CSV
df = pd.read_csv('benchmark_results.csv')

# Filtrer uniquement les exécutions réussies
df = df[df['Success'] == True]

# Calculer la moyenne des temps par algorithme et taille
grouped = df.groupby(['Size', 'Algorithm'])['Time'].mean().reset_index()

# Tracer le graphique
plt.figure(figsize=(10, 6))

for algo in grouped['Algorithm'].unique():
    subset = grouped[grouped['Algorithm'] == algo]
    plt.plot(subset['Size'], subset['Time'], marker='o', label=algo.upper())

plt.title('Temps moyen de résolution par taille de puzzle')
plt.xlabel('Taille du puzzle (n pour nxn)')
plt.ylabel('Temps moyen (secondes)')
plt.grid(True)
plt.legend()
plt.savefig('benchmark_plot.png')
plt.show()
