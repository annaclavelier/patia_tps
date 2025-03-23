(define (problem p001)
(:domain sokoban)
(:objects
pos_0_0 - position
pos_0_1 - position
pos_0_2 - position
pos_1_0 - position
pos_1_1 - position
pos_1_2 - position
pos_2_0 - position
pos_2_1 - position
pos_2_2 - position
pos_3_0 - position
pos_3_1 - position
pos_3_2 - position
pos_4_0 - position
pos_4_1 - position
pos_4_2 - position
box_2_1 - box
)
(:init
(wall pos_0_0)
(not (empty pos_0_0))
(isNotStorage pos_0_0)
(wall pos_1_0)
(not (empty pos_1_0))
(isNotStorage pos_1_0)
(wall pos_2_0)
(not (empty pos_2_0))
(isNotStorage pos_2_0)
(wall pos_3_0)
(not (empty pos_3_0))
(isNotStorage pos_3_0)
(wall pos_4_0)
(not (empty pos_4_0))
(isNotStorage pos_4_0)
(wall pos_0_1)
(not (empty pos_0_1))
(isNotStorage pos_0_1)
(at pos_1_1)
(isNotStorage pos_1_1)
(box_at box_2_1 pos_2_1)
(not (empty pos_2_1))
(isNotStorage pos_2_1)
(box_not_on_storage box_2_1)
(isStorage pos_3_1)
(wall pos_4_1)
(not (empty pos_4_1))
(isNotStorage pos_4_1)
(wall pos_0_2)
(not (empty pos_0_2))
(isNotStorage pos_0_2)
(wall pos_1_2)
(not (empty pos_1_2))
(isNotStorage pos_1_2)
(wall pos_2_2)
(not (empty pos_2_2))
(isNotStorage pos_2_2)
(wall pos_3_2)
(not (empty pos_3_2))
(isNotStorage pos_3_2)
(wall pos_4_2)
(not (empty pos_4_2))
(isNotStorage pos_4_2)
)
(:goal (and
(box_on_storage box_2_1)
)))