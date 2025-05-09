(define (problem p0012)
(:domain sokoban)
(:objects
pos_1_1 - position
pos_2_1 - position
pos_1_2 - position
pos_2_2 - position
pos_1_3 - position
pos_2_3 - position
box_3_3 - box
pos_3_3 - position
pos_4_3 - position
pos_5_3 - position
pos_6_3 - position
box_2_4 - box
pos_2_4 - position
pos_3_4 - position
box_3_4 - box
pos_4_4 - position
pos_5_4 - position
box_5_4 - box
pos_6_4 - position
pos_1_5 - position
pos_2_5 - position
pos_3_5 - position
pos_5_5 - position
pos_1_6 - position
pos_2_6 - position
pos_3_6 - position
pos_4_6 - position
pos_5_6 - position
)
(:init
(empty pos_1_1)
(empty pos_2_1)
(empty pos_1_2)
(empty pos_2_2)
(empty pos_1_3)
(empty pos_2_3)
(box_at box_3_3 pos_3_3)
(empty pos_4_3)
(empty pos_5_3)
(empty pos_6_3)
(box_at box_2_4 pos_2_4)
(box_at box_3_4 pos_3_4)
(isStorage pos_3_4)
(box_on_storage box_3_4)
(empty pos_4_4)
(box_at box_5_4 pos_5_4)
(isStorage pos_5_4)
(box_on_storage box_5_4)
(empty pos_6_4)
(empty pos_1_5)
(empty pos_2_5)
(empty pos_3_5)
(isStorage pos_3_5)
(empty pos_5_5)
(empty pos_1_6)
(isStorage pos_1_6)
(empty pos_2_6)
(empty pos_3_6)
(at pos_4_6)
(empty pos_5_6)
(ligne pos_6_4 pos_5_4)
(colonne pos_6_4 pos_6_3)
(colonne pos_5_5 pos_5_6)
(colonne pos_5_5 pos_5_4)
(ligne pos_4_6 pos_5_6)
(ligne pos_4_6 pos_3_6)
(ligne pos_5_6 pos_4_6)
(colonne pos_5_6 pos_5_5)
(ligne pos_3_3 pos_4_3)
(colonne pos_3_3 pos_3_4)
(ligne pos_3_3 pos_2_3)
(ligne pos_2_4 pos_3_4)
(colonne pos_2_4 pos_2_5)
(colonne pos_2_4 pos_2_3)
(ligne pos_1_5 pos_2_5)
(colonne pos_1_5 pos_1_6)
(ligne pos_4_3 pos_5_3)
(colonne pos_4_3 pos_4_4)
(ligne pos_4_3 pos_3_3)
(ligne pos_3_4 pos_4_4)
(colonne pos_3_4 pos_3_5)
(ligne pos_3_4 pos_2_4)
(colonne pos_3_4 pos_3_3)
(ligne pos_2_5 pos_3_5)
(colonne pos_2_5 pos_2_6)
(ligne pos_2_5 pos_1_5)
(colonne pos_2_5 pos_2_4)
(ligne pos_1_6 pos_2_6)
(colonne pos_1_6 pos_1_5)
(ligne pos_5_3 pos_6_3)
(colonne pos_5_3 pos_5_4)
(ligne pos_5_3 pos_4_3)
(ligne pos_4_4 pos_5_4)
(ligne pos_4_4 pos_3_4)
(colonne pos_4_4 pos_4_3)
(colonne pos_3_5 pos_3_6)
(ligne pos_3_5 pos_2_5)
(colonne pos_3_5 pos_3_4)
(ligne pos_2_6 pos_3_6)
(ligne pos_2_6 pos_1_6)
(colonne pos_2_6 pos_2_5)
(colonne pos_6_3 pos_6_4)
(ligne pos_6_3 pos_5_3)
(ligne pos_5_4 pos_6_4)
(colonne pos_5_4 pos_5_5)
(ligne pos_5_4 pos_4_4)
(colonne pos_5_4 pos_5_3)
(ligne pos_3_6 pos_4_6)
(ligne pos_3_6 pos_2_6)
(colonne pos_3_6 pos_3_5)
(ligne pos_1_1 pos_2_1)
(colonne pos_1_1 pos_1_2)
(colonne pos_2_1 pos_2_2)
(ligne pos_2_1 pos_1_1)
(ligne pos_1_2 pos_2_2)
(colonne pos_1_2 pos_1_3)
(colonne pos_1_2 pos_1_1)
(colonne pos_2_2 pos_2_3)
(ligne pos_2_2 pos_1_2)
(colonne pos_2_2 pos_2_1)
(ligne pos_1_3 pos_2_3)
(colonne pos_1_3 pos_1_2)
(ligne pos_2_3 pos_3_3)
(colonne pos_2_3 pos_2_4)
(ligne pos_2_3 pos_1_3)
(colonne pos_2_3 pos_2_2)
)
(:goal (and
(box_on_storage box_3_3)
(box_on_storage box_2_4)
(box_on_storage box_3_4)
(box_on_storage box_5_4)
)))