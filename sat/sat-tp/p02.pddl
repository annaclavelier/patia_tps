(define (problem strips-gripper-x-1)
   (:domain gripper-strips)
   (:objects 
   rooma - room
   roomb - room
   ball1 - ball
   ball2 - ball
   left - gripper
   )
   (:init (room rooma)
          (room roomb)
          (ball ball1)
          (ball ball2)
          (gripper left)
          (at-robby rooma)
          (carry ball1 left)
          (at ball2 rooma)
          )
   (:goal (and
               (at ball2 roomb) (at ball1 roomb))))