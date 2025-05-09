(define (problem p0027)
(:domain sokoban)
(:objects
pos_0_0 - position
pos_1_0 - position
pos_0_1 - position
pos_1_1 - position
pos_3_1 - position
pos_4_1 - position
pos_0_2 - position
pos_1_2 - position
box_3_2 - box
pos_3_2 - position
pos_4_2 - position
pos_0_3 - position
pos_1_3 - position
pos_3_3 - position
box_4_3 - box
pos_4_3 - position
pos_7_3 - position
pos_8_3 - position
pos_9_3 - position
pos_0_4 - position
pos_1_4 - position
pos_3_4 - position
box_4_4 - box
pos_4_4 - position
pos_5_4 - position
pos_6_4 - position
pos_7_4 - position
box_8_4 - box
pos_8_4 - position
pos_9_4 - position
pos_3_5 - position
pos_4_5 - position
pos_5_5 - position
pos_6_5 - position
pos_8_5 - position
pos_1_6 - position
pos_2_6 - position
pos_3_6 - position
box_5_6 - box
pos_5_6 - position
pos_8_6 - position
pos_1_7 - position
pos_3_7 - position
pos_4_7 - position
pos_5_7 - position
pos_7_7 - position
pos_8_7 - position
pos_1_8 - position
pos_7_8 - position
pos_1_9 - position
pos_2_9 - position
pos_3_9 - position
pos_4_9 - position
pos_5_9 - position
pos_6_9 - position
pos_7_9 - position
)
(:init
(empty pos_0_0)
(empty pos_1_0)
(empty pos_0_1)
(empty pos_1_1)
(at pos_3_1)
(empty pos_4_1)
(empty pos_0_2)
(empty pos_1_2)
(box_at box_3_2 pos_3_2)
(empty pos_4_2)
(isStorage pos_4_2)
(empty pos_0_3)
(empty pos_1_3)
(empty pos_3_3)
(isStorage pos_3_3)
(box_at box_4_3 pos_4_3)
(empty pos_7_3)
(empty pos_8_3)
(empty pos_9_3)
(empty pos_0_4)
(empty pos_1_4)
(empty pos_3_4)
(box_at box_4_4 pos_4_4)
(empty pos_5_4)
(empty pos_6_4)
(empty pos_7_4)
(box_at box_8_4 pos_8_4)
(empty pos_9_4)
(empty pos_3_5)
(isStorage pos_3_5)
(empty pos_4_5)
(empty pos_5_5)
(empty pos_6_5)
(isStorage pos_6_5)
(empty pos_8_5)
(empty pos_1_6)
(empty pos_2_6)
(empty pos_3_6)
(isStorage pos_3_6)
(box_at box_5_6 pos_5_6)
(empty pos_8_6)
(empty pos_1_7)
(empty pos_3_7)
(empty pos_4_7)
(empty pos_5_7)
(empty pos_7_7)
(empty pos_8_7)
(empty pos_1_8)
(empty pos_7_8)
(empty pos_1_9)
(empty pos_2_9)
(empty pos_3_9)
(empty pos_4_9)
(empty pos_5_9)
(empty pos_6_9)
(empty pos_7_9)
(colonne pos_1_0 pos_1_1)
(ligne pos_1_0 pos_0_0)
(ligne pos_3_3 pos_4_3)
(colonne pos_3_3 pos_3_4)
(colonne pos_3_3 pos_3_2)
(ligne pos_3_4 pos_4_4)
(colonne pos_3_4 pos_3_5)
(colonne pos_3_4 pos_3_3)
(ligne pos_1_6 pos_2_6)
(colonne pos_1_6 pos_1_7)
(ligne pos_3_5 pos_4_5)
(colonne pos_3_5 pos_3_6)
(colonne pos_3_5 pos_3_4)
(colonne pos_1_7 pos_1_8)
(colonne pos_1_7 pos_1_6)
(ligne pos_5_4 pos_6_4)
(colonne pos_5_4 pos_5_5)
(ligne pos_5_4 pos_4_4)
(colonne pos_3_6 pos_3_7)
(ligne pos_3_6 pos_2_6)
(colonne pos_3_6 pos_3_5)
(colonne pos_1_8 pos_1_9)
(colonne pos_1_8 pos_1_7)
(colonne pos_1_1 pos_1_2)
(ligne pos_1_1 pos_0_1)
(colonne pos_1_1 pos_1_0)
(colonne pos_1_2 pos_1_3)
(ligne pos_1_2 pos_0_2)
(colonne pos_1_2 pos_1_1)
(ligne pos_3_1 pos_4_1)
(colonne pos_3_1 pos_3_2)
(colonne pos_1_3 pos_1_4)
(ligne pos_1_3 pos_0_3)
(colonne pos_1_3 pos_1_2)
(ligne pos_3_2 pos_4_2)
(colonne pos_3_2 pos_3_3)
(colonne pos_3_2 pos_3_1)
(ligne pos_1_4 pos_0_4)
(colonne pos_1_4 pos_1_3)
(colonne pos_8_6 pos_8_7)
(colonne pos_8_6 pos_8_5)
(ligne pos_8_7 pos_7_7)
(colonne pos_8_7 pos_8_6)
(ligne pos_6_9 pos_7_9)
(ligne pos_6_9 pos_5_9)
(ligne pos_6_4 pos_7_4)
(colonne pos_6_4 pos_6_5)
(ligne pos_6_4 pos_5_4)
(ligne pos_8_3 pos_9_3)
(colonne pos_8_3 pos_8_4)
(ligne pos_8_3 pos_7_3)
(ligne pos_6_5 pos_5_5)
(colonne pos_6_5 pos_6_4)
(ligne pos_4_7 pos_5_7)
(ligne pos_4_7 pos_3_7)
(ligne pos_2_9 pos_3_9)
(ligne pos_2_9 pos_1_9)
(ligne pos_8_4 pos_9_4)
(colonne pos_8_4 pos_8_5)
(ligne pos_8_4 pos_7_4)
(colonne pos_8_4 pos_8_3)
(colonne pos_8_5 pos_8_6)
(colonne pos_8_5 pos_8_4)
(ligne pos_4_9 pos_5_9)
(ligne pos_4_9 pos_3_9)
(ligne pos_0_0 pos_1_0)
(colonne pos_0_0 pos_0_1)
(ligne pos_0_1 pos_1_1)
(colonne pos_0_1 pos_0_2)
(colonne pos_0_1 pos_0_0)
(colonne pos_4_2 pos_4_3)
(ligne pos_4_2 pos_3_2)
(colonne pos_4_2 pos_4_1)
(colonne pos_4_3 pos_4_4)
(ligne pos_4_3 pos_3_3)
(colonne pos_4_3 pos_4_2)
(ligne pos_4_4 pos_5_4)
(colonne pos_4_4 pos_4_5)
(ligne pos_4_4 pos_3_4)
(colonne pos_4_4 pos_4_3)
(ligne pos_2_6 pos_3_6)
(ligne pos_2_6 pos_1_6)
(ligne pos_4_5 pos_5_5)
(ligne pos_4_5 pos_3_5)
(colonne pos_4_5 pos_4_4)
(ligne pos_0_2 pos_1_2)
(colonne pos_0_2 pos_0_3)
(colonne pos_0_2 pos_0_1)
(ligne pos_0_3 pos_1_3)
(colonne pos_0_3 pos_0_4)
(colonne pos_0_3 pos_0_2)
(ligne pos_0_4 pos_1_4)
(colonne pos_0_4 pos_0_3)
(colonne pos_4_1 pos_4_2)
(ligne pos_4_1 pos_3_1)
(ligne pos_7_7 pos_8_7)
(colonne pos_7_7 pos_7_8)
(ligne pos_5_9 pos_6_9)
(ligne pos_5_9 pos_4_9)
(colonne pos_7_8 pos_7_9)
(colonne pos_7_8 pos_7_7)
(ligne pos_7_9 pos_6_9)
(colonne pos_7_9 pos_7_8)
(ligne pos_7_3 pos_8_3)
(colonne pos_7_3 pos_7_4)
(ligne pos_5_5 pos_6_5)
(colonne pos_5_5 pos_5_6)
(ligne pos_5_5 pos_4_5)
(colonne pos_5_5 pos_5_4)
(ligne pos_3_7 pos_4_7)
(colonne pos_3_7 pos_3_6)
(ligne pos_1_9 pos_2_9)
(colonne pos_1_9 pos_1_8)
(ligne pos_7_4 pos_8_4)
(ligne pos_7_4 pos_6_4)
(colonne pos_7_4 pos_7_3)
(colonne pos_5_6 pos_5_7)
(colonne pos_5_6 pos_5_5)
(colonne pos_9_3 pos_9_4)
(ligne pos_9_3 pos_8_3)
(ligne pos_5_7 pos_4_7)
(colonne pos_5_7 pos_5_6)
(ligne pos_3_9 pos_4_9)
(ligne pos_3_9 pos_2_9)
(ligne pos_9_4 pos_8_4)
(colonne pos_9_4 pos_9_3)
)
(:goal (and
(box_on_storage box_3_2)
(box_on_storage box_4_3)
(box_on_storage box_4_4)
(box_on_storage box_8_4)
(box_on_storage box_5_6)
)))