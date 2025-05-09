(define (problem p0025)
(:domain sokoban)
(:objects
pos_1_1 - position
pos_2_1 - position
pos_3_1 - position
pos_4_1 - position
pos_5_1 - position
pos_6_1 - position
pos_7_1 - position
pos_1_2 - position
pos_7_2 - position
pos_1_3 - position
pos_3_3 - position
pos_4_3 - position
pos_5_3 - position
pos_7_3 - position
pos_1_4 - position
pos_3_4 - position
pos_5_4 - position
pos_7_4 - position
pos_8_4 - position
pos_1_5 - position
pos_3_5 - position
pos_4_5 - position
pos_5_5 - position
box_5_5 - box
pos_6_5 - position
pos_7_5 - position
pos_8_5 - position
pos_1_6 - position
pos_2_6 - position
box_2_6 - box
pos_3_6 - position
pos_4_6 - position
box_5_6 - box
pos_5_6 - position
pos_6_6 - position
pos_7_6 - position
pos_8_6 - position
box_4_7 - box
pos_4_7 - position
pos_5_7 - position
box_5_7 - box
pos_6_7 - position
pos_0_8 - position
pos_1_8 - position
pos_2_8 - position
pos_4_8 - position
pos_5_8 - position
pos_0_9 - position
pos_1_9 - position
pos_2_9 - position
)
(:init
(empty pos_1_1)
(empty pos_2_1)
(empty pos_3_1)
(empty pos_4_1)
(empty pos_5_1)
(empty pos_6_1)
(empty pos_7_1)
(empty pos_1_2)
(empty pos_7_2)
(empty pos_1_3)
(empty pos_3_3)
(empty pos_4_3)
(empty pos_5_3)
(empty pos_7_3)
(empty pos_1_4)
(empty pos_3_4)
(empty pos_5_4)
(empty pos_7_4)
(empty pos_8_4)
(empty pos_1_5)
(empty pos_3_5)
(isStorage pos_3_5)
(empty pos_4_5)
(box_at box_5_5 pos_5_5)
(isStorage pos_5_5)
(box_on_storage box_5_5)
(empty pos_6_5)
(isStorage pos_6_5)
(empty pos_7_5)
(empty pos_8_5)
(empty pos_1_6)
(box_at box_2_6 pos_2_6)
(isStorage pos_2_6)
(box_on_storage box_2_6)
(empty pos_3_6)
(empty pos_4_6)
(box_at box_5_6 pos_5_6)
(empty pos_6_6)
(empty pos_7_6)
(empty pos_8_6)
(box_at box_4_7 pos_4_7)
(box_at box_5_7 pos_5_7)
(isStorage pos_5_7)
(box_on_storage box_5_7)
(empty pos_6_7)
(empty pos_0_8)
(empty pos_1_8)
(empty pos_2_8)
(at pos_4_8)
(empty pos_5_8)
(empty pos_0_9)
(empty pos_1_9)
(empty pos_2_9)
(ligne pos_5_1 pos_6_1)
(ligne pos_5_1 pos_4_1)
(ligne pos_3_3 pos_4_3)
(colonne pos_3_3 pos_3_4)
(colonne pos_1_5 pos_1_6)
(colonne pos_1_5 pos_1_4)
(ligne pos_6_1 pos_7_1)
(ligne pos_6_1 pos_5_1)
(ligne pos_4_3 pos_5_3)
(ligne pos_4_3 pos_3_3)
(colonne pos_3_4 pos_3_5)
(colonne pos_3_4 pos_3_3)
(ligne pos_1_6 pos_2_6)
(colonne pos_1_6 pos_1_5)
(colonne pos_7_1 pos_7_2)
(ligne pos_7_1 pos_6_1)
(colonne pos_5_3 pos_5_4)
(ligne pos_5_3 pos_4_3)
(ligne pos_3_5 pos_4_5)
(colonne pos_3_5 pos_3_6)
(colonne pos_3_5 pos_3_4)
(ligne pos_2_6 pos_3_6)
(ligne pos_2_6 pos_1_6)
(ligne pos_0_8 pos_1_8)
(colonne pos_0_8 pos_0_9)
(colonne pos_7_2 pos_7_3)
(colonne pos_7_2 pos_7_1)
(colonne pos_5_4 pos_5_5)
(colonne pos_5_4 pos_5_3)
(ligne pos_4_5 pos_5_5)
(colonne pos_4_5 pos_4_6)
(ligne pos_4_5 pos_3_5)
(ligne pos_3_6 pos_4_6)
(ligne pos_3_6 pos_2_6)
(colonne pos_3_6 pos_3_5)
(ligne pos_1_8 pos_2_8)
(colonne pos_1_8 pos_1_9)
(ligne pos_1_8 pos_0_8)
(ligne pos_0_9 pos_1_9)
(colonne pos_0_9 pos_0_8)
(ligne pos_1_1 pos_2_1)
(colonne pos_1_1 pos_1_2)
(ligne pos_2_1 pos_3_1)
(ligne pos_2_1 pos_1_1)
(colonne pos_1_2 pos_1_3)
(colonne pos_1_2 pos_1_1)
(ligne pos_3_1 pos_4_1)
(ligne pos_3_1 pos_2_1)
(colonne pos_1_3 pos_1_4)
(colonne pos_1_3 pos_1_2)
(ligne pos_4_1 pos_5_1)
(ligne pos_4_1 pos_3_1)
(colonne pos_1_4 pos_1_5)
(colonne pos_1_4 pos_1_3)
(ligne pos_8_6 pos_7_6)
(colonne pos_8_6 pos_8_5)
(colonne pos_7_3 pos_7_4)
(colonne pos_7_3 pos_7_2)
(ligne pos_5_5 pos_6_5)
(colonne pos_5_5 pos_5_6)
(ligne pos_5_5 pos_4_5)
(colonne pos_5_5 pos_5_4)
(ligne pos_4_6 pos_5_6)
(colonne pos_4_6 pos_4_7)
(ligne pos_4_6 pos_3_6)
(colonne pos_4_6 pos_4_5)
(colonne pos_2_8 pos_2_9)
(ligne pos_2_8 pos_1_8)
(ligne pos_1_9 pos_2_9)
(ligne pos_1_9 pos_0_9)
(colonne pos_1_9 pos_1_8)
(ligne pos_7_4 pos_8_4)
(colonne pos_7_4 pos_7_5)
(colonne pos_7_4 pos_7_3)
(ligne pos_6_5 pos_7_5)
(colonne pos_6_5 pos_6_6)
(ligne pos_6_5 pos_5_5)
(ligne pos_5_6 pos_6_6)
(colonne pos_5_6 pos_5_7)
(ligne pos_5_6 pos_4_6)
(colonne pos_5_6 pos_5_5)
(ligne pos_4_7 pos_5_7)
(colonne pos_4_7 pos_4_8)
(colonne pos_4_7 pos_4_6)
(ligne pos_2_9 pos_1_9)
(colonne pos_2_9 pos_2_8)
(colonne pos_8_4 pos_8_5)
(ligne pos_8_4 pos_7_4)
(ligne pos_7_5 pos_8_5)
(colonne pos_7_5 pos_7_6)
(ligne pos_7_5 pos_6_5)
(colonne pos_7_5 pos_7_4)
(ligne pos_6_6 pos_7_6)
(colonne pos_6_6 pos_6_7)
(ligne pos_6_6 pos_5_6)
(colonne pos_6_6 pos_6_5)
(ligne pos_5_7 pos_6_7)
(colonne pos_5_7 pos_5_8)
(ligne pos_5_7 pos_4_7)
(colonne pos_5_7 pos_5_6)
(ligne pos_4_8 pos_5_8)
(colonne pos_4_8 pos_4_7)
(colonne pos_8_5 pos_8_6)
(ligne pos_8_5 pos_7_5)
(colonne pos_8_5 pos_8_4)
(ligne pos_7_6 pos_8_6)
(ligne pos_7_6 pos_6_6)
(colonne pos_7_6 pos_7_5)
(ligne pos_6_7 pos_5_7)
(colonne pos_6_7 pos_6_6)
(ligne pos_5_8 pos_4_8)
(colonne pos_5_8 pos_5_7)
)
(:goal (and
(box_on_storage box_5_5)
(box_on_storage box_2_6)
(box_on_storage box_5_6)
(box_on_storage box_4_7)
(box_on_storage box_5_7)
)))