(define (problem p005)
(:domain sokoban)
(:objects
pos_1_1 - position
pos_2_1 - position
pos_3_1 - position
pos_4_1 - position
pos_5_1 - position
pos_1_2 - position
box_3_2 - box
pos_3_2 - position
pos_4_2 - position
pos_5_2 - position
pos_1_3 - position
box_2_3 - box
pos_2_3 - position
pos_3_3 - position
pos_5_3 - position
pos_2_4 - position
box_3_4 - box
pos_3_4 - position
pos_4_4 - position
pos_5_4 - position
pos_0_5 - position
pos_2_5 - position
pos_3_5 - position
pos_0_6 - position
pos_2_6 - position
pos_3_6 - position
pos_0_7 - position
)
(:init
(empty pos_1_1)
(empty pos_2_1)
(is_storage pos_2_1)
(empty pos_3_1)
(empty pos_4_1)
(empty pos_5_1)
(empty pos_1_2)
(box_at box_3_2 pos_3_2)
(empty pos_4_2)
(empty pos_5_2)
(empty pos_1_3)
(box_at box_2_3 pos_2_3)
(empty pos_3_3)
(is_storage pos_3_3)
(empty pos_5_3)
(empty pos_2_4)
(is_storage pos_2_4)
(box_at box_3_4 pos_3_4)
(at pos_4_4)
(empty pos_5_4)
(empty pos_0_5)
(empty pos_2_5)
(empty pos_3_5)
(empty pos_0_6)
(empty pos_2_6)
(empty pos_3_6)
(empty pos_0_7)
(colonne pos_5_1 pos_5_2)
(ligne pos_5_1 pos_4_1)
(ligne pos_4_2 pos_5_2)
(ligne pos_4_2 pos_3_2)
(colonne pos_4_2 pos_4_1)
(colonne pos_3_3 pos_3_4)
(ligne pos_3_3 pos_2_3)
(colonne pos_3_3 pos_3_2)
(ligne pos_2_4 pos_3_4)
(colonne pos_2_4 pos_2_5)
(colonne pos_2_4 pos_2_3)
(colonne pos_0_6 pos_0_7)
(colonne pos_0_6 pos_0_5)
(colonne pos_5_2 pos_5_3)
(ligne pos_5_2 pos_4_2)
(colonne pos_5_2 pos_5_1)
(ligne pos_3_4 pos_4_4)
(colonne pos_3_4 pos_3_5)
(ligne pos_3_4 pos_2_4)
(colonne pos_3_4 pos_3_3)
(ligne pos_2_5 pos_3_5)
(colonne pos_2_5 pos_2_6)
(colonne pos_2_5 pos_2_4)
(colonne pos_0_7 pos_0_6)
(colonne pos_5_3 pos_5_4)
(colonne pos_5_3 pos_5_2)
(ligne pos_4_4 pos_5_4)
(ligne pos_4_4 pos_3_4)
(colonne pos_3_5 pos_3_6)
(ligne pos_3_5 pos_2_5)
(colonne pos_3_5 pos_3_4)
(ligne pos_2_6 pos_3_6)
(colonne pos_2_6 pos_2_5)
(ligne pos_5_4 pos_4_4)
(colonne pos_5_4 pos_5_3)
(ligne pos_3_6 pos_2_6)
(colonne pos_3_6 pos_3_5)
(ligne pos_1_1 pos_2_1)
(colonne pos_1_1 pos_1_2)
(ligne pos_2_1 pos_3_1)
(ligne pos_2_1 pos_1_1)
(colonne pos_1_2 pos_1_3)
(colonne pos_1_2 pos_1_1)
(ligne pos_3_1 pos_4_1)
(colonne pos_3_1 pos_3_2)
(ligne pos_3_1 pos_2_1)
(ligne pos_1_3 pos_2_3)
(colonne pos_1_3 pos_1_2)
(ligne pos_4_1 pos_5_1)
(colonne pos_4_1 pos_4_2)
(ligne pos_4_1 pos_3_1)
(ligne pos_3_2 pos_4_2)
(colonne pos_3_2 pos_3_3)
(colonne pos_3_2 pos_3_1)
(ligne pos_2_3 pos_3_3)
(colonne pos_2_3 pos_2_4)
(ligne pos_2_3 pos_1_3)
(colonne pos_0_5 pos_0_6)
)
(:goal (and
(box_on_storage box_3_2)
(box_on_storage box_2_3)
(box_on_storage box_3_4)
)))