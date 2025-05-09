(define (problem p006)
(:domain sokoban)
(:objects
pos_0_0 - position
pos_0_1 - position
pos_2_1 - position
pos_3_1 - position
pos_4_1 - position
pos_2_2 - position
pos_4_2 - position
pos_5_2 - position
pos_6_2 - position
pos_1_3 - position
box_2_3 - box
pos_2_3 - position
pos_3_3 - position
pos_4_3 - position
pos_5_3 - position
pos_6_3 - position
pos_1_4 - position
box_2_4 - box
pos_2_4 - position
pos_3_4 - position
box_3_4 - box
pos_5_4 - position
pos_2_5 - position
pos_3_5 - position
pos_4_5 - position
pos_5_5 - position
pos_0_6 - position
)
(:init
(empty pos_0_0)
(empty pos_0_1)
(empty pos_2_1)
(empty pos_3_1)
(empty pos_4_1)
(empty pos_2_2)
(empty pos_4_2)
(empty pos_5_2)
(empty pos_6_2)
(at pos_1_3)
(box_at box_2_3 pos_2_3)
(empty pos_3_3)
(is_storage pos_3_3)
(empty pos_4_3)
(empty pos_5_3)
(is_storage pos_5_3)
(empty pos_6_3)
(empty pos_1_4)
(box_at box_2_4 pos_2_4)
(box_at box_3_4 pos_3_4)
(is_storage pos_3_4)
(box_on_storage box_3_4)
(empty pos_5_4)
(empty pos_2_5)
(empty pos_3_5)
(empty pos_4_5)
(empty pos_5_5)
(empty pos_0_6)
(ligne pos_5_5 pos_4_5)
(colonne pos_5_5 pos_5_4)
(colonne pos_0_0 pos_0_1)
(colonne pos_0_1 pos_0_0)
(ligne pos_4_2 pos_5_2)
(colonne pos_4_2 pos_4_3)
(colonne pos_4_2 pos_4_1)
(ligne pos_3_3 pos_4_3)
(colonne pos_3_3 pos_3_4)
(ligne pos_3_3 pos_2_3)
(ligne pos_2_4 pos_3_4)
(colonne pos_2_4 pos_2_5)
(ligne pos_2_4 pos_1_4)
(colonne pos_2_4 pos_2_3)
(ligne pos_5_2 pos_6_2)
(colonne pos_5_2 pos_5_3)
(ligne pos_5_2 pos_4_2)
(ligne pos_4_3 pos_5_3)
(ligne pos_4_3 pos_3_3)
(colonne pos_4_3 pos_4_2)
(colonne pos_3_4 pos_3_5)
(ligne pos_3_4 pos_2_4)
(colonne pos_3_4 pos_3_3)
(ligne pos_2_5 pos_3_5)
(colonne pos_2_5 pos_2_4)
(colonne pos_6_2 pos_6_3)
(ligne pos_6_2 pos_5_2)
(ligne pos_5_3 pos_6_3)
(colonne pos_5_3 pos_5_4)
(ligne pos_5_3 pos_4_3)
(colonne pos_5_3 pos_5_2)
(ligne pos_3_5 pos_4_5)
(ligne pos_3_5 pos_2_5)
(colonne pos_3_5 pos_3_4)
(ligne pos_6_3 pos_5_3)
(colonne pos_6_3 pos_6_2)
(colonne pos_5_4 pos_5_5)
(colonne pos_5_4 pos_5_3)
(ligne pos_4_5 pos_5_5)
(ligne pos_4_5 pos_3_5)
(ligne pos_2_1 pos_3_1)
(colonne pos_2_1 pos_2_2)
(ligne pos_3_1 pos_4_1)
(ligne pos_3_1 pos_2_1)
(colonne pos_2_2 pos_2_3)
(colonne pos_2_2 pos_2_1)
(ligne pos_1_3 pos_2_3)
(colonne pos_1_3 pos_1_4)
(colonne pos_4_1 pos_4_2)
(ligne pos_4_1 pos_3_1)
(ligne pos_2_3 pos_3_3)
(colonne pos_2_3 pos_2_4)
(ligne pos_2_3 pos_1_3)
(colonne pos_2_3 pos_2_2)
(ligne pos_1_4 pos_2_4)
(colonne pos_1_4 pos_1_3)
)
(:goal (and
(box_on_storage box_2_3)
(box_on_storage box_2_4)
(box_on_storage box_3_4)
)))