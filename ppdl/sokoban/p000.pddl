(define (problem p000)
(:domain sokoban)
(:objects
pos_0_0 - position
pos_1_0 - position
pos_2_0 - position
box_2_0 - box
)
(:init
(at pos_0_0)
(isNotStorage pos_0_0)
(isStorage pos_2_0)
(box_not_on_storage box_2_0)
(box_at box_2_0 pos_1_0)
(empty pos_2_0)
(isNotStorage pos_1_0)
(adjacent pos_0_0 pos_1_0)
(adjacent pos_1_0 pos_0_0)
(adjacent pos_1_0 pos_2_0)
(adjacent pos_2_0 pos_1_0)
)
(:goal (and
(box_on_storage box_2_0)
)))