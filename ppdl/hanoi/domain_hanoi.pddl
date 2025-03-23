;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world on hanoi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain blocks)
	(:requirements :strips :typing)
	(:types
		block
		stack
	)
	;;;; on block x est sur le block y
	(:predicates
		(on ?x - block ?y - block ?z -stack)
		;;;; le block x est sur la table (pas sur un autre block)
		(ontable ?x - block ?z -stack)
		;;; x n'a pas de block au dessus
		(clear ?x - block)
		;;; main -> vide 
		(handempty)
		;;; on tient le block x
		(holding ?x - block)
		;;; x est moins gros que y
		(inferior ?x -block ?y -block)
		;;; pile est vide
		(emptystack ?z - stack)
		;;; appartient à
		(is_on ?x - block  ?z - stack )
	)

	;;; je prends un cube sur la table
	(:action pick-up
		:parameters (?x - block ?z - stack)
		:precondition (and (clear ?x) (ontable ?x ?z) (handempty))
		:effect (and (not (ontable ?x ?z))
			(not (clear ?x))
			(not (handempty))
			(emptystack ?z)
			(holding ?x)
			(not (is_on ?x  ?z )))
	)
	;;; on met sur la table
	(:action put-down
		:parameters (?x - block ?z - stack)
		:precondition (and (holding ?x) (emptystack ?z))
		:effect (and (not (holding ?x))
			(clear ?x)
			(handempty)
			(ontable ?x ?z)
			(not (emptystack ?z))
			(is_on ?x  ?z ))
	)
	;;; empile x sur y
	(:action stack
		:parameters (?x - block ?y - block ?z - stack)
		:precondition (and (holding ?x) (clear ?y) (inferior ?x ?y)(is_on ?y  ?z ))
		:effect (and (not (holding ?x))
			(not (clear ?y))
			(clear ?x)
			(handempty)
			(on ?x ?y ?z)
			(is_on ?x  ?z ))
	)
	;;; dépile x sur y, donc x dans la main
	(:action unstack
		:parameters (?x - block ?y - block ?z - stack)
		:precondition (and (on ?x ?y ?z) (clear ?x) (handempty)(is_on ?x  ?z ))
		:effect (and (holding ?x)
			(clear ?y)
			(not (clear ?x))
			(not (handempty))
			(not (on ?x ?y ?z))
			(not (is_on ?x ?z)))
	)
)