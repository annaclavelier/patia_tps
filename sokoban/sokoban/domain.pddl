(define (domain sokoban)
	(:requirements :strips :typing)
	(:types
		box 
		position
	)
	(:predicates
		;;; la case x est à la position p 
		(box_at ?b - box ?p - position)
		;;; la position est vide
		(empty ?p - position)
		;;; le sokoban est à la position p
		(at ?p - position)
		;;; la case est une case de stockage
		(isStorage ?p -position)
		;;; la boite est sur une case de stockage
		(box_on_storage ?b - box)
		;; les positions p et p2 sont adjacentes en ligne
		(ligne ?p - position ?p2 - position)
		;; les positions p et p2 sont adjacentes en colonne
		(colonne ?p - position ?p2 - position)

	)

	;; TODO : vérifier que s et arrivee sont différentes
	(:action pousser_caisse_ligne
		:parameters (?b -box ?position_arrivee - position ?position_depart - position ?s - position)
		:precondition (and (empty ?position_arrivee) (ligne ?s ?position_depart) (ligne ?position_arrivee ?position_depart) (at ?s) (box_at ?b ?position_depart))
		:effect (and
			(not (empty ?position_arrivee))
			(not (box_at ?b ?position_depart))
			(not (box_on_storage ?b))
			(empty ?s)
			(box_at ?b ?position_arrivee)
			(not(at ?s))
			(at ?position_depart)
		)
	)

	;; TODO : vérifier que s et arrivee sont différentes

	(:action pousser_caisse_colonne
		:parameters (?b -box ?position_arrivee - position ?position_depart - position ?s - position)
		:precondition (and (empty ?position_arrivee) (colonne ?s ?position_depart) (colonne ?position_arrivee ?position_depart) (at ?s) (box_at ?b ?position_depart))
		:effect (and
			(not (empty ?position_arrivee))
			(not (box_at ?b ?position_depart))
			(not (box_on_storage ?b))
			(empty ?s)
			(box_at ?b ?position_arrivee)
			(not(at ?s))
			(at ?position_depart)
		)
	)



	(:action deplacement_ligne
		;;; s = position du sokoban, p = position cible
		:parameters (?s - position ?p - position)
		:precondition (and (at ?s) (empty ?p) (ligne ?s ?p))
		:effect (and
			(not (at ?s))
			(at ?p)
			(not (empty ?p))
			(empty ?s)
		)
	)
	(:action deplacement_colonne
		;;; s = position du sokoban, p = position cible
		:parameters (?s - position ?p - position)
		:precondition (and (at ?s) (empty ?p) (colonne ?s ?p))
		:effect (and
			(not (at ?s))
			(at ?p)
			(not (empty ?p))
			(empty ?s)
		)
	)

	(:action verifier_etat
		:parameters (?p - position ?b - box)
		:precondition (and (box_at ?b ?p)(isStorage ?p))
		:effect (and (box_on_storage ?b) )
	)
	
)