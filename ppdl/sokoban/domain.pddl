(define (domain sokoban)
	(:requirements :strips :typing)
	(:types
        box
		position
	)
	(:predicates
		;;; la case x est à la position p 
		(box_at ?b - box ?p - position)
		;;: la position p est adjacente à p2
		(adjacent ?p - position ?p2 - position)
		;;; la position est vide
		(empty ?p - position)
        ;;; il y a un mur à la position
        (wall ?p - position)
        ;;; le sokoban est à la position p
        (at ?p - position)
		;;; la case est une case de stockage
		(isStorage ?p -position)
		;;; la case n'est pas une case de stockage
		(isNotStorage ?p -position)
		;;; la boite est sur une case de stockage
		(box_on_storage ?b - box)
		;;; la boite n'est pas sur une case de stockage
		(box_not_on_storage ?b -box)

	)

	(:action pousser_caisse_not_on_storage
		:parameters (?b -box ?p - position ?p2 - position ?s - position)
		:precondition (and (empty ?p) (isNotStorage ?p) (adjacent ?s ?p2) (adjacent ?p ?p2) (at ?s) (box_at ?b ?p2) )
		:effect (and
			(not (empty ?p))
			(not (box_at ?b ?p2))
			(box_not_on_storage ?b)
			(not(box_on_storage ?b))
			(empty ?p2)
			(box_at ?b ?p)
			(not(at ?s))
			(at ?p2) 
		)
	)
	
	(:action pousser_caisse_on_storage
		:parameters (?b -box ?p - position ?p2 - position ?s - position)
		:precondition (and (empty ?p) (isStorage ?p) (adjacent ?s ?p2) (adjacent ?p ?p2) (at ?s) (box_at ?b ?p2) )
		:effect (and
			(not (empty ?p))
			(not (box_at ?b ?p2))
			(not(box_not_on_storage ?b))
			(box_on_storage ?b)
			(empty ?p2)
			(box_at ?b ?p)
			(not(at ?s))
			(at ?p2) 
		)
	)
	(:action deplacement
	;;; s = position du sokoban, p = position cible
        :parameters (?s - position ?p - position)
        :precondition (and (at ?s) (empty ?p) (adjacent ?s ?p))
        :effect (and
			(not (at ?s))
			(at ?p)
			(not (empty ?p))
			(empty ?s)
		)
    )
	(:action verifier_etat
		:parameters (?b - box ?p - position)
		:precondition (and (box_at ?b ?p) (isStorage ?p))
		:effect (box_on_storage ?b)
	)
)