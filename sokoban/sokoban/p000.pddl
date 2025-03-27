(define (problem p000)
(:domain sokoban)
(:objects
pos_1_1 - position
box_2_1 - box
pos_2_1 - position
pos_3_1 - position
)
(:init
(at pos_1_1)
(isNotStorage pos_1_1)
(box_at box_2_1 pos_2_1)
(isNotStorage pos_2_1)
(box_not_on_storage box_2_1)
(empty pos_3_1)
(isStorage pos_3_1)
(adjacent pos_1_1 pos_2_1)
(adjacent pos_2_1 pos_3_1)
(adjacent pos_2_1 pos_1_1)
(adjacent pos_3_1 pos_2_1)
)
(:goal (and
(box_on_storage box_2_1)
)))