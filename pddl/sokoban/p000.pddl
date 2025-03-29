(define (problem p000)
(:domain sokoban)
(:objects
pos_0_0 - position
pos_1_0 - position
pos_2_0 - position
pos_0_1 - position
pos_1_1 - position
pos_2_1 - position
pos_0_2 - position
pos_1_2 - position
pos_2_2 - position
box_1_1 - box
)
(:init
(at pos_0_2)
(isNotStorage pos_0_0)
(isNotStorage pos_0_1)
(isNotStorage pos_0_2)
(isStorage pos_2_0)
(box_not_on_storage box_1_1)
(box_at box_1_1 pos_1_1)
(empty pos_0_0)
(empty pos_0_1)
(empty pos_1_0)
(empty pos_2_1)
(empty pos_2_2)
(empty pos_1_2)
(empty pos_2_0)

(isNotStorage pos_1_0)
(isNotStorage pos_1_1)
(isNotStorage pos_1_2)
(isNotStorage pos_2_1)
(isNotStorage pos_2_2)
(ligne pos_0_0 pos_1_0)
(ligne pos_1_0 pos_0_0)
(ligne pos_1_0 pos_2_0)
(ligne pos_2_0 pos_1_0)

(ligne pos_0_1 pos_1_1)
(ligne pos_1_1 pos_0_1)
(ligne pos_1_1 pos_2_1)
(ligne pos_2_1 pos_1_1)

(ligne pos_0_2 pos_1_2)
(ligne pos_1_2 pos_0_2)
(ligne pos_1_2 pos_2_2)
(ligne pos_2_2 pos_1_2)

(colonne pos_0_0 pos_0_1)
(colonne pos_0_1 pos_0_0)
(colonne pos_0_1 pos_0_2)
(colonne pos_0_2 pos_0_1)


(colonne pos_1_0 pos_1_1)
(colonne pos_1_1 pos_1_0)
(colonne pos_1_1 pos_1_2)
(colonne pos_1_2 pos_1_1)

(colonne pos_2_0 pos_2_1)
(colonne pos_2_1 pos_2_0)
(colonne pos_2_1 pos_2_2)
(colonne pos_2_2 pos_2_1)



)
(:goal (and
(box_on_storage box_1_1)
)))