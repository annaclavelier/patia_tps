# PDDL

## Hanoi

Les fichiers des tours de hanoi sont dans le sous-dossier `hanoi`.

**Tests**

| Fichier test | Disques | Nombre de piles |
| ------------ | ------- | --------------- |
| p001.pddl    | 3       | 3               |
| p002.pddl    | 4       | 3               |

## Taquin

Les fichiers du taquin sont dans le sous-dossier `taquin`.

**Tests**
Nous avons créé 5 tests, 4 premiers avec la configuration 3x3 et le 5ème avec la configuration 5x5.

**Générer d'autres tests**
On peut générer d'autres tests grâce au fichier generate_taquin_pddl.py uniquement depuis les fichiers du dossier npuzzlez.

Par exemple, ici, on précise le chemin de l'entrée et le nom du fichier de sortie (depuis le dossier `taquin`) .

```
python generate_taquin_pddl.py -i ../../npuzzlez/puzzlez/npuzzle_5x5_len5_0.txt -o p006.pddl
```

## Exécution

L'exécution se fait en exécutant classiquement le script `pddl4j.sh` et en rentrant les informations.
