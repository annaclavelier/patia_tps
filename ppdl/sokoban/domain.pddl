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
		:parameters (?b -box ?position_arrivee - position ?position_depart - position ?s - position)
		:precondition (and (empty ?position_arrivee) (isNotStorage ?position_arrivee) (adjacent ?s ?position_depart) (adjacent ?position_arrivee ?position_depart) (at ?s) (box_at ?b ?position_depart))
		:effect (and
			(not (empty ?position_arrivee))
			(not (box_at ?b ?position_depart))
			(box_not_on_storage ?b)
			(not(box_on_storage ?b))
			(empty ?s)
			(box_at ?b ?position_arrivee)
			(not(at ?s))
			(at ?position_depart)
		)
	)

	(:action pousser_caisse_on_storage
		:parameters (?b -box ?position_arrivee - position ?position_depart - position ?s - position)
		:precondition (and (empty ?position_arrivee) (isStorage ?position_arrivee) (adjacent ?s ?position_depart) (adjacent ?position_depart ?position_arrivee) (at ?s) (box_at ?b ?position_depart))
		:effect (and
			(not (empty ?position_arrivee))
			(not (box_at ?b ?position_depart))
			(not(box_not_on_storage ?b))
			(box_on_storage ?b)
			(empty ?s)
			(box_at ?b ?position_arrivee)
			(not(at ?s))
			(at ?position_depart)
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
		:effect (and(box_on_storage ?b))
	)
)