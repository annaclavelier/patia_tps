;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hanoi towers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain hanoi)
	(:requirements :strips :typing)
	(:types
		disk ;;; anneau/disque
		stack ;;; pile
	)
	(:predicates
		;;;; le disque x est sur le disque y sur la pile z
		(on ?x - disk ?y - disk ?z -stack)
		;;;; le disque x est sur la table (pas sur un autre disque)
		(ontable ?x - disk ?z -stack)
		;;; x n'a pas de disque au dessus
		(clear ?x - disk)
		;;; main -> vide 
		(handempty)
		;;; on tient le disque x
		(holding ?x - disk)
		;;; x est moins gros que y
		(inferior ?x -disk ?y -disk)
		;;; pile est vide
		(emptystack ?z - stack)
		;;; disque x sur la pile z
		(is_on ?x - disk  ?z - stack )
	)

	;;; je prends un disque sur la table
	(:action pick-up
		:parameters (?x - disk ?z - stack)
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
		:parameters (?x - disk ?z - stack)
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
		:parameters (?x - disk ?y - disk ?z - stack)
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
		:parameters (?x - disk ?y - disk ?z - stack)
		:precondition (and (on ?x ?y ?z) (clear ?x) (handempty)(is_on ?x  ?z ))
		:effect (and (holding ?x)
			(clear ?y)
			(not (clear ?x))
			(not (handempty))
			(not (on ?x ?y ?z))
			(not (is_on ?x ?z)))
	)
)