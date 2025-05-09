# Résolution du Taquin par algorithmes de recherche

## Générer les données

1. Génèrer les puzzles

On génère des puzzles taquin random de la taille 3 à 17 (avec 2 incréments), et des maxlengths de 1 à 45.
Le détail est dans le fichier generate_custom_npuzzle qui s'inspire largement du fichier donné generate_npuzzle.

Les puzzles générés sont stockés dans le dossier `puzzlez`.

```
python generate_npuzzle.py
```

2. Créer le fichier CSV 

On crée le fichier csv `benchmark_results.csv` à partir des puzzles du dossier `puzzlez`. Le timeout par défaut est de 120 secondes.

```
python generate_data_csv.py
```

## Consulter les graphiques

Nous avons généré différents graphiques à partir des données sur google sheets.

Pour voir les détails vous pouvez accéder au [lien du fichier pour voir/éditer](https://docs.google.com/spreadsheets/d/1ZHJkv11eW2VT8pca6hSxutpdCd5TWnT9HfM9MQNT3RA/edit?usp=sharing) les formules et données des graphes.

Dans le graphe suivant on évalue, les données selon la taille indépendamment de la longueur maximale du taquin.

<img src="./assets/graphique.png" width=500>

Ici on a les données exactes des moyennes selon les tailles du taquin:

<img src="./assets/donnees_exactes.png" width=500>


**Edition du google sheet:**

1. Se rendre sur le [fichier](https://docs.google.com/spreadsheets/d/1ZHJkv11eW2VT8pca6hSxutpdCd5TWnT9HfM9MQNT3RA/edit?usp=sharing).
2. Coller les données dans la feuille **benchmark_csv**
3. Remplacer les `.` par des `,` (sinon risque d'erreur)
