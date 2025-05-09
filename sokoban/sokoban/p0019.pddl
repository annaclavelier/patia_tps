(define (problem p0019)
(:domain sokoban)
(:objects
pos_1_1 - position
pos_2_1 - position
pos_3_1 - position
pos_4_1 - position
pos_6_1 - position
pos_7_1 - position
pos_8_1 - position
pos_1_2 - position
pos_3_2 - position
pos_4_2 - position
pos_5_2 - position
box_5_2 - box
pos_6_2 - position
pos_7_2 - position
pos_8_2 - position
pos_1_3 - position
pos_2_3 - position
box_3_3 - box
pos_3_3 - position
pos_4_3 - position
pos_5_3 - position
box_5_3 - box
pos_6_3 - position
pos_7_3 - position
pos_8_3 - position
box_3_4 - box
pos_3_4 - position
pos_4_4 - position
pos_0_5 - position
pos_1_5 - position
pos_3_5 - position
pos_4_5 - position
pos_0_6 - position
pos_1_6 - position
)
(:init
(empty pos_1_1)
(empty pos_2_1)
(empty pos_3_1)
(empty pos_4_1)
(empty pos_6_1)
(empty pos_7_1)
(empty pos_8_1)
(empty pos_1_2)
(empty pos_3_2)
(empty pos_4_2)
(isStorage pos_4_2)
(box_at box_5_2 pos_5_2)
(isStorage pos_5_2)
(box_on_storage box_5_2)
(empty pos_6_2)
(empty pos_7_2)
(empty pos_8_2)
(empty pos_1_3)
(empty pos_2_3)
(box_at box_3_3 pos_3_3)
(empty pos_4_3)
(isStorage pos_4_3)
(box_at box_5_3 pos_5_3)
(isStorage pos_5_3)
(box_on_storage box_5_3)
(at pos_6_3)
(empty pos_7_3)
(empty pos_8_3)
(box_at box_3_4 pos_3_4)
(empty pos_4_4)
(empty pos_0_5)
(empty pos_1_5)
(empty pos_3_5)
(empty pos_4_5)
(empty pos_0_6)
(empty pos_1_6)
(ligne pos_4_2 pos_5_2)
(colonne pos_4_2 pos_4_3)
(ligne pos_4_2 pos_3_2)
(colonne pos_4_2 pos_4_1)
(ligne pos_3_3 pos_4_3)
(colonne pos_3_3 pos_3_4)
(ligne pos_3_3 pos_2_3)
(colonne pos_3_3 pos_3_2)
(colonne pos_1_5 pos_1_6)
(ligne pos_1_5 pos_0_5)
(ligne pos_0_6 pos_1_6)
(colonne pos_0_6 pos_0_5)
(ligne pos_6_1 pos_7_1)
(colonne pos_6_1 pos_6_2)
(ligne pos_5_2 pos_6_2)
(colonne pos_5_2 pos_5_3)
(ligne pos_5_2 pos_4_2)
(ligne pos_4_3 pos_5_3)
(colonne pos_4_3 pos_4_4)
(ligne pos_4_3 pos_3_3)
(colonne pos_4_3 pos_4_2)
(ligne pos_3_4 pos_4_4)
(colonne pos_3_4 pos_3_5)
(colonne pos_3_4 pos_3_3)
(ligne pos_1_6 pos_0_6)
(colonne pos_1_6 pos_1_5)
(ligne pos_7_1 pos_8_1)
(colonne pos_7_1 pos_7_2)
(ligne pos_7_1 pos_6_1)
(ligne pos_6_2 pos_7_2)
(colonne pos_6_2 pos_6_3)
(ligne pos_6_2 pos_5_2)
(colonne pos_6_2 pos_6_1)
(ligne pos_5_3 pos_6_3)
(ligne pos_5_3 pos_4_3)
(colonne pos_5_3 pos_5_2)
(colonne pos_4_4 pos_4_5)
(ligne pos_4_4 pos_3_4)
(colonne pos_4_4 pos_4_3)
(ligne pos_3_5 pos_4_5)
(colonne pos_3_5 pos_3_4)
(colonne pos_8_1 pos_8_2)
(ligne pos_8_1 pos_7_1)
(ligne pos_7_2 pos_8_2)
(colonne pos_7_2 pos_7_3)
(ligne pos_7_2 pos_6_2)
(colonne pos_7_2 pos_7_1)
(ligne pos_6_3 pos_7_3)
(ligne pos_6_3 pos_5_3)
(colonne pos_6_3 pos_6_2)
(ligne pos_4_5 pos_3_5)
(colonne pos_4_5 pos_4_4)
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
(colonne pos_4_1 pos_4_2)
(ligne pos_4_1 pos_3_1)
(ligne pos_3_2 pos_4_2)
(colonne pos_3_2 pos_3_3)
(colonne pos_3_2 pos_3_1)
(ligne pos_2_3 pos_3_3)
(ligne pos_2_3 pos_1_3)
(ligne pos_0_5 pos_1_5)
(colonne pos_0_5 pos_0_6)
(colonne pos_8_2 pos_8_3)
(ligne pos_8_2 pos_7_2)
(colonne pos_8_2 pos_8_1)
(ligne pos_7_3 pos_8_3)
(ligne pos_7_3 pos_6_3)
(colonne pos_7_3 pos_7_2)
(ligne pos_8_3 pos_7_3)
(colonne pos_8_3 pos_8_2)
)
(:goal (and
(box_on_storage box_5_2)
(box_on_storage box_3_3)
(box_on_storage box_5_3)
(box_on_storage box_3_4)
)))