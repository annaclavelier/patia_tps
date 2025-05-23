(define (domain gripper-strips)
    (:requirements :strips :typing)
	(:types
		ball 
		room
        gripper
	)
   (:predicates 
		(at-robby ?r - room)
		(at ?b -ball ?r - room)
		(free ?g - gripper)
		(carry ?o - ball ?g - gripper))

   (:action move
       :parameters  (?from - room ?to - room)
       :precondition (and  (at-robby ?from))
       :effect (and  (at-robby ?to)
		     (not (at-robby ?from))))



   (:action pick
       :parameters (?obj - ball ?room - room ?gripper - gripper)
       :precondition  (and 
			    (at ?obj ?room) (at-robby ?room) (free ?gripper))
       :effect (and (carry ?obj ?gripper)
		    (not (at ?obj ?room)) ;; a vérifier car tp
		    (not (free ?gripper)))) 


   (:action drop
       :parameters  (?obj - ball ?room - room ?gripper - gripper)
       :precondition  (and     (carry ?obj ?gripper) (at-robby ?room))
       :effect (and (at ?obj ?room)
		    (free ?gripper)
		    (not (carry ?obj ?gripper)))))

