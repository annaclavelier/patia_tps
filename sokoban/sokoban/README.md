# Sokoban : domaine PDDL et application web

README original du projet : consignes.md

## Exécution

Lancer la résolution du sokoban avec la commande suivante en replaçant **N** par le numéro du cas de test de sokoban à résoudre et **TIMEOUT** par le timeout en secondes.
Cas de test par défaut : 11.
Timeout par défaut : 600.

```
java --add-opens java.base/java.lang=ALL-UNNAMED \
      -server -Xms2048m -Xmx2048m \
      -cp "$(mvn dependency:build-classpath -Dmdep.outputFile=/dev/stdout -q):target/test-classes/:target/classes" \
      sokoban.SokobanMain N TIMEOUT
```

Une fois la résolution terminée normalement vous pourrez consulter l'app web sur **localhost:4200**.

## Implémentation

On récupère le cas de test demandé JSON, puis on le parse grâce à la classe `ParserJson` et on construit le fichier PDDL associé avec son état initial et ses objets.

On lance ensuite le script pddl4j en donnant le fichier PDDL généré (avec le domaine PDDL,etc).
On vient récupérer la sortie du script et récupérer les actions.

A partir de la liste d'actions, c'est à dire du plan trouvé, on utilise la classe `ParserPlan` pour convertir le plan en une suite de mouvements pour le sokoban (U,L,D,R).

Cette suite de mouvements est stocké dans le fichier `plan.txt` à la racine du projet.

Enfin, la classe Agent a été modifié pour récupérer le contenu du fichier `plan.txt`.

Et le gameRunner est lancé.

## Résultats

Nous avons testé l'ensemble du jeu de tests et tous fonctionne à l'exception de quelque-uns pour lesquels le temps était trop long donc nous avons avorté le test.

## Optimisations

Pour limiter le nombre de mouvements possibles, nous avons utilisé le requirement **equality** PDDL dans des prédicats pour les inégalités entre cases. 