(define (problem p001)
(:domain sokoban)
(:objects
pos_0_0 - position
pos_0_1 - position
pos_0_2 - position

box_0_2 - box
)
(:init
(at pos_0_0)
(isNotStorage pos_0_0)
(isStorage pos_0_2)
(box_not_on_storage box_0_2)
(box_at box_0_2 pos_0_1)
(empty pos_0_2)
(isNotStorage pos_0_1)
(adjacent pos_0_0 pos_0_1)
(adjacent pos_0_1 pos_0_0)
(adjacent pos_0_1 pos_0_2)
(adjacent pos_0_2 pos_0_1)
)
(:goal (and
(box_on_storage box_0_2)
)))