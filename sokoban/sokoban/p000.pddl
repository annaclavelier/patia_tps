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
(box_at box_2_1 pos_2_1)
(empty pos_3_1)
(is_storage pos_3_1)
(ligne pos_1_1 pos_2_1)
(ligne pos_2_1 pos_3_1)
(ligne pos_2_1 pos_1_1)
(ligne pos_3_1 pos_2_1)
)
(:goal (and
(box_on_storage box_2_1)
)))