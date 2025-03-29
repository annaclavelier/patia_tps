(define (problem p002)
(:domain sokoban)
(:objects
pos_0_0 - position
pos_1_0 - position
pos_0_1 - position
pos_1_1 - position
pos_3_1 - position
pos_4_1 - position
pos_3_2 - position
pos_4_2 - position
pos_1_3 - position
pos_2_3 - position
pos_3_3 - position
box_3_3 - box
pos_4_3 - position
pos_1_4 - position
pos_3_4 - position
pos_4_4 - position
pos_1_5 - position
box_2_5 - box
pos_2_5 - position
pos_3_5 - position
box_3_5 - box
pos_4_5 - position
pos_2_6 - position
pos_3_6 - position
pos_4_6 - position
pos_0_7 - position
)
(:init
(empty pos_0_0)
(isNotStorage pos_0_0)
(empty pos_1_0)
(isNotStorage pos_1_0)
(empty pos_0_1)
(isNotStorage pos_0_1)
(empty pos_1_1)
(isNotStorage pos_1_1)
(empty pos_3_1)
(isNotStorage pos_3_1)
(empty pos_4_1)
(isNotStorage pos_4_1)
(empty pos_3_2)
(isNotStorage pos_3_2)
(empty pos_4_2)
(isStorage pos_4_2)
(empty pos_1_3)
(isNotStorage pos_1_3)
(empty pos_2_3)
(isNotStorage pos_2_3)
(box_at box_3_3 pos_3_3)
(isStorage pos_3_3)
(box_on_storage box_3_3)
(empty pos_4_3)
(isNotStorage pos_4_3)
(empty pos_1_4)
(isNotStorage pos_1_4)
(at pos_3_4)
(isNotStorage pos_3_4)
(empty pos_4_4)
(isNotStorage pos_4_4)
(empty pos_1_5)
(isNotStorage pos_1_5)
(box_at box_2_5 pos_2_5)
(isNotStorage pos_2_5)
(box_not_on_storage box_2_5)
(box_at box_3_5 pos_3_5)
(isStorage pos_3_5)
(box_on_storage box_3_5)
(empty pos_4_5)
(isNotStorage pos_4_5)
(empty pos_2_6)
(isNotStorage pos_2_6)
(empty pos_3_6)
(isNotStorage pos_3_6)
(empty pos_4_6)
(isNotStorage pos_4_6)
(empty pos_0_7)
(isNotStorage pos_0_7)
(adjacent pos_4_6 pos_3_6)
(adjacent pos_4_6 pos_4_5)
(adjacent pos_0_0 pos_1_0)
(adjacent pos_0_0 pos_0_1)
(adjacent pos_1_0 pos_1_1)
(adjacent pos_1_0 pos_0_0)
(adjacent pos_0_1 pos_1_1)
(adjacent pos_0_1 pos_0_0)
(adjacent pos_4_2 pos_4_3)
(adjacent pos_4_2 pos_3_2)
(adjacent pos_4_2 pos_4_1)
(adjacent pos_3_3 pos_4_3)
(adjacent pos_3_3 pos_3_4)
(adjacent pos_3_3 pos_2_3)
(adjacent pos_3_3 pos_3_2)
(adjacent pos_1_5 pos_2_5)
(adjacent pos_1_5 pos_1_4)
(adjacent pos_4_3 pos_4_4)
(adjacent pos_4_3 pos_3_3)
(adjacent pos_4_3 pos_4_2)
(adjacent pos_3_4 pos_4_4)
(adjacent pos_3_4 pos_3_5)
(adjacent pos_3_4 pos_3_3)
(adjacent pos_2_5 pos_3_5)
(adjacent pos_2_5 pos_2_6)
(adjacent pos_2_5 pos_1_5)
(adjacent pos_4_4 pos_4_5)
(adjacent pos_4_4 pos_3_4)
(adjacent pos_4_4 pos_4_3)
(adjacent pos_3_5 pos_4_5)
(adjacent pos_3_5 pos_3_6)
(adjacent pos_3_5 pos_2_5)
(adjacent pos_3_5 pos_3_4)
(adjacent pos_2_6 pos_3_6)
(adjacent pos_2_6 pos_2_5)
(adjacent pos_4_5 pos_4_6)
(adjacent pos_4_5 pos_3_5)
(adjacent pos_4_5 pos_4_4)
(adjacent pos_3_6 pos_4_6)
(adjacent pos_3_6 pos_2_6)
(adjacent pos_3_6 pos_3_5)
(adjacent pos_1_1 pos_0_1)
(adjacent pos_1_1 pos_1_0)
(adjacent pos_3_1 pos_4_1)
(adjacent pos_3_1 pos_3_2)
(adjacent pos_1_3 pos_2_3)
(adjacent pos_1_3 pos_1_4)
(adjacent pos_4_1 pos_4_2)
(adjacent pos_4_1 pos_3_1)
(adjacent pos_3_2 pos_4_2)
(adjacent pos_3_2 pos_3_3)
(adjacent pos_3_2 pos_3_1)
(adjacent pos_2_3 pos_3_3)
(adjacent pos_2_3 pos_1_3)
(adjacent pos_1_4 pos_1_5)
(adjacent pos_1_4 pos_1_3)
)
(:goal (and
(box_on_storage box_3_3)
(box_on_storage box_2_5)
(box_on_storage box_3_5)
)))