(define (problem p0022)
(:domain sokoban)
(:objects
pos_0_0 - position
pos_1_0 - position
pos_3_1 - position
pos_4_1 - position
pos_1_2 - position
pos_2_2 - position
pos_3_2 - position
pos_4_2 - position
pos_1_3 - position
pos_3_3 - position
pos_4_3 - position
pos_5_3 - position
pos_1_4 - position
box_2_4 - box
pos_2_4 - position
pos_3_4 - position
box_5_4 - box
pos_5_4 - position
pos_6_4 - position
pos_2_5 - position
pos_3_5 - position
box_3_5 - box
pos_4_5 - position
box_4_5 - box
pos_5_5 - position
pos_6_5 - position
pos_0_6 - position
pos_2_6 - position
box_3_6 - box
pos_3_6 - position
pos_4_6 - position
pos_5_6 - position
pos_6_6 - position
pos_0_7 - position
pos_2_7 - position
pos_3_7 - position
pos_0_8 - position
)
(:init
(empty pos_0_0)
(empty pos_1_0)
(empty pos_3_1)
(empty pos_4_1)
(empty pos_1_2)
(empty pos_2_2)
(empty pos_3_2)
(is_storage pos_3_2)
(empty pos_4_2)
(empty pos_1_3)
(empty pos_3_3)
(empty pos_4_3)
(at pos_5_3)
(empty pos_1_4)
(box_at box_2_4 pos_2_4)
(empty pos_3_4)
(is_storage pos_3_4)
(box_at box_5_4 pos_5_4)
(empty pos_6_4)
(empty pos_2_5)
(is_storage pos_2_5)
(box_at box_3_5 pos_3_5)
(is_storage pos_3_5)
(box_on_storage box_3_5)
(box_at box_4_5 pos_4_5)
(is_storage pos_4_5)
(box_on_storage box_4_5)
(empty pos_5_5)
(empty pos_6_5)
(empty pos_0_6)
(empty pos_2_6)
(box_at box_3_6 pos_3_6)
(empty pos_4_6)
(empty pos_5_6)
(empty pos_6_6)
(empty pos_0_7)
(empty pos_2_7)
(empty pos_3_7)
(empty pos_0_8)
(ligne pos_0_0 pos_1_0)
(ligne pos_1_0 pos_0_0)
(colonne pos_4_2 pos_4_3)
(ligne pos_4_2 pos_3_2)
(colonne pos_4_2 pos_4_1)
(ligne pos_3_3 pos_4_3)
(colonne pos_3_3 pos_3_4)
(colonne pos_3_3 pos_3_2)
(ligne pos_2_4 pos_3_4)
(colonne pos_2_4 pos_2_5)
(ligne pos_2_4 pos_1_4)
(colonne pos_0_6 pos_0_7)
(ligne pos_4_3 pos_5_3)
(ligne pos_4_3 pos_3_3)
(colonne pos_4_3 pos_4_2)
(colonne pos_3_4 pos_3_5)
(ligne pos_3_4 pos_2_4)
(colonne pos_3_4 pos_3_3)
(ligne pos_2_5 pos_3_5)
(colonne pos_2_5 pos_2_6)
(colonne pos_2_5 pos_2_4)
(colonne pos_0_7 pos_0_8)
(colonne pos_0_7 pos_0_6)
(colonne pos_5_3 pos_5_4)
(ligne pos_5_3 pos_4_3)
(ligne pos_3_5 pos_4_5)
(colonne pos_3_5 pos_3_6)
(ligne pos_3_5 pos_2_5)
(colonne pos_3_5 pos_3_4)
(ligne pos_2_6 pos_3_6)
(colonne pos_2_6 pos_2_7)
(colonne pos_2_6 pos_2_5)
(colonne pos_0_8 pos_0_7)
(ligne pos_5_4 pos_6_4)
(colonne pos_5_4 pos_5_5)
(colonne pos_5_4 pos_5_3)
(ligne pos_4_5 pos_5_5)
(colonne pos_4_5 pos_4_6)
(ligne pos_4_5 pos_3_5)
(ligne pos_3_6 pos_4_6)
(colonne pos_3_6 pos_3_7)
(ligne pos_3_6 pos_2_6)
(colonne pos_3_6 pos_3_5)
(ligne pos_2_7 pos_3_7)
(colonne pos_2_7 pos_2_6)
(ligne pos_1_2 pos_2_2)
(colonne pos_1_2 pos_1_3)
(ligne pos_3_1 pos_4_1)
(colonne pos_3_1 pos_3_2)
(ligne pos_2_2 pos_3_2)
(ligne pos_2_2 pos_1_2)
(colonne pos_1_3 pos_1_4)
(colonne pos_1_3 pos_1_2)
(colonne pos_4_1 pos_4_2)
(ligne pos_4_1 pos_3_1)
(ligne pos_3_2 pos_4_2)
(colonne pos_3_2 pos_3_3)
(ligne pos_3_2 pos_2_2)
(colonne pos_3_2 pos_3_1)
(ligne pos_1_4 pos_2_4)
(colonne pos_1_4 pos_1_3)
(colonne pos_6_4 pos_6_5)
(ligne pos_6_4 pos_5_4)
(ligne pos_5_5 pos_6_5)
(colonne pos_5_5 pos_5_6)
(ligne pos_5_5 pos_4_5)
(colonne pos_5_5 pos_5_4)
(ligne pos_4_6 pos_5_6)
(ligne pos_4_6 pos_3_6)
(colonne pos_4_6 pos_4_5)
(ligne pos_3_7 pos_2_7)
(colonne pos_3_7 pos_3_6)
(colonne pos_6_5 pos_6_6)
(ligne pos_6_5 pos_5_5)
(colonne pos_6_5 pos_6_4)
(ligne pos_5_6 pos_6_6)
(ligne pos_5_6 pos_4_6)
(colonne pos_5_6 pos_5_5)
(ligne pos_6_6 pos_5_6)
(colonne pos_6_6 pos_6_5)
)
(:goal (and
(box_on_storage box_2_4)
(box_on_storage box_5_4)
(box_on_storage box_3_5)
(box_on_storage box_4_5)
(box_on_storage box_3_6)
)))