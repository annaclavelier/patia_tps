(define (problem p001)
(:domain sokoban)
(:objects
pos_1_1 - position
box_1_2 - box
pos_1_2 - position
pos_1_3 - position
)
(:init
(at pos_1_1)
(isNotStorage pos_1_1)
(box_at box_1_2 pos_1_2)
(isNotStorage pos_1_2)
(box_not_on_storage box_1_2)
(empty pos_1_3)
(isStorage pos_1_3)
(adjacent pos_1_1 pos_1_2)
(adjacent pos_1_2 pos_1_3)
(adjacent pos_1_2 pos_1_1)
(adjacent pos_1_3 pos_1_2)
)
(:goal (and
(box_on_storage box_1_2)
)))