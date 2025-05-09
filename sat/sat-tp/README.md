# Localisation des Fichiers

- **Domaine** : `sat/sat-tp/domain.pddl`
- **Problème** : `sat/sat-tp/p01.pddl`
- **Implémentation** :
  - `sat/sat-tp/src/fr/uga/pddl4j/yasp/SATEncoding.java`
  - `sat/sat-tp/src/fr/uga/pddl4j/yasp/YetAnotherSATPlanner.java`

# Résultats de l'Implémentation

- **Statut** : Non Fonctionnel
- **Problèmes Identifiés** :
  - La gestion de l'indexation des fluents dans les actions et transitions d'états n'est pas correcte.
  - Le programme ne fonctionne pas et ne reconnaît pas les cas avec plusieurs pièces (rooms).
  - Le programme n'a pas été testé sur d'autres types de problèmes.

# Observations

- **Débuts de Plans** : L'implémentation semble produire des débuts de plans.
- **Perspectives** : Avec plus de temps, il serait probablement possible de résoudre les problèmes actuels et d'améliorer l'implémentation.

# Recommandations

- **Correction des Bugs** : Il est essentiel de corriger la gestion de l'indexation des fluents pour que le programme fonctionne correctement.
- **Tests Additionnels** : Une fois les corrections apportées, il serait bénéfique de tester le programme sur différents types de problèmes pour valider sa robustesse.
- **Documentation** : Documenter les étapes de correction et les résultats des tests pour faciliter la maintenance future.
