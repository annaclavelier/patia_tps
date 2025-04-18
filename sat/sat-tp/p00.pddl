(define (problem strips-gripper-x-0)
       (:domain gripper-strips)
       (:objects
              rooma - room
              ball1 - ball
              left - gripper
       )
       (:init
              (at-robby rooma)
              (carry ball1 left)
       )
       (:goal
              (and
                     (at ball1 rooma) (free left))
       )
)