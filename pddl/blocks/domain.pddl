;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain blocks)
	(:requirements :strips :typing)
	(:types
		block
	)
	;;;; on block x est sur le block y
	(:predicates
		(on ?x - block ?y - block)
		;;;; le block x est sur la table (pas sur un autre block)
		(ontable ?x - block)
		;;; x n'a pas de block au dessus
		(clear ?x - block)
		;;; main -> vide 
		(handempty)
		;;; on tient le block x
		(holding ?x - block)
	)

	;;; je prends un cube sur la table
	(:action pick-up
		:parameters (?x - block)
		:precondition (and (clear ?x) (ontable ?x) (handempty))
		:effect (and (not (ontable ?x))
			(not (clear ?x))
			(not (handempty))
			(holding ?x))
	)
	;;; on met sur la table
	(:action put-down
		:parameters (?x - block)
		:precondition (holding ?x)
		:effect (and (not (holding ?x))
			(clear ?x)
			(handempty)
			(ontable ?x))
	)
	;;; empile x sur y
	(:action stack
		:parameters (?x - block ?y - block)
		:precondition (and (holding ?x) (clear ?y))
		:effect (and (not (holding ?x))
			(not (clear ?y))
			(clear ?x)
			(handempty)
			(on ?x ?y))
	)
	;;; dépile x sur y, donc x dans la main
	(:action unstack
		:parameters (?x - block ?y - block)
		:precondition (and (on ?x ?y) (clear ?x) (handempty))
		:effect (and (holding ?x)
			(clear ?y)
			(not (clear ?x))
			(not (handempty))
			(not (on ?x ?y)))
	)
)