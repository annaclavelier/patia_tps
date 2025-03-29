;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain blocks)
	(:requirements :strips :typing)
	(:types
		tile
		position
	)
	(:predicates
		;;; y est à droite de x
		(right ?x - tile ?y - tile)
		;;; x est inférieur à y
		(inferior ?x - tile ?y - tile)
		;;; la case p a la position p
		(is_on ?x - tile ?p - position)
	)

	;;; on veut bouger à x
	(:action move_right
		:parameters (?x - block)
		:precondition (right ?x)
		:effect (and (not (ontable ?x))
			(not (clear ?x))
			(not (handempty))
			(holding ?x))
	)

)