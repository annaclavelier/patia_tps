
(define (problem taquin-5x5)
    (:domain taquin)
    (:objects
        tile1 tile2 tile3 tile4 tile5 tile6 tile7 tile8 tile9 tile10 tile11 tile12 tile13 tile14 tile15 tile16 tile17 tile18 tile19 tile20 tile21 tile22 tile23 tile24 - tile
        pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 pos10 pos11 pos12 pos13 pos14 pos15 pos16 pos17 pos18 pos19 pos20 pos21 pos22 pos23 pos24 pos25 - position
    )
    (:init
        (empty pos2) (at tile1 pos1) (at tile2 pos3) (at tile3 pos4) (at tile4 pos5) (at tile5 pos6) (at tile6 pos7) (at tile7 pos8) (at tile8 pos9) (at tile9 pos10) (at tile10 pos11) (at tile11 pos12) (at tile12 pos13) (at tile13 pos14) (at tile14 pos15) (at tile15 pos16) (at tile16 pos17) (at tile17 pos18) (at tile18 pos19) (at tile19 pos20) (at tile20 pos21) (at tile21 pos22) (at tile22 pos23) (at tile23 pos24) (at tile24 pos25)
        (adjacent pos1 pos2) (adjacent pos2 pos1) (adjacent pos1 pos6) (adjacent pos6 pos1) (adjacent pos2 pos3) (adjacent pos3 pos2) (adjacent pos2 pos7) (adjacent pos7 pos2) (adjacent pos3 pos4) (adjacent pos4 pos3) (adjacent pos3 pos8) (adjacent pos8 pos3) (adjacent pos4 pos5) (adjacent pos5 pos4) (adjacent pos4 pos9) (adjacent pos9 pos4) (adjacent pos5 pos10) (adjacent pos10 pos5) (adjacent pos6 pos7) (adjacent pos7 pos6) (adjacent pos6 pos11) (adjacent pos11 pos6) (adjacent pos7 pos8) (adjacent pos8 pos7) (adjacent pos7 pos12) (adjacent pos12 pos7) (adjacent pos8 pos9) (adjacent pos9 pos8) (adjacent pos8 pos13) (adjacent pos13 pos8) (adjacent pos9 pos10) (adjacent pos10 pos9) (adjacent pos9 pos14) (adjacent pos14 pos9) (adjacent pos10 pos15) (adjacent pos15 pos10) (adjacent pos11 pos12) (adjacent pos12 pos11) (adjacent pos11 pos16) (adjacent pos16 pos11) (adjacent pos12 pos13) (adjacent pos13 pos12) (adjacent pos12 pos17) (adjacent pos17 pos12) (adjacent pos13 pos14) (adjacent pos14 pos13) (adjacent pos13 pos18) (adjacent pos18 pos13) (adjacent pos14 pos15) (adjacent pos15 pos14) (adjacent pos14 pos19) (adjacent pos19 pos14) (adjacent pos15 pos20) (adjacent pos20 pos15) (adjacent pos16 pos17) (adjacent pos17 pos16) (adjacent pos16 pos21) (adjacent pos21 pos16) (adjacent pos17 pos18) (adjacent pos18 pos17) (adjacent pos17 pos22) (adjacent pos22 pos17) (adjacent pos18 pos19) (adjacent pos19 pos18) (adjacent pos18 pos23) (adjacent pos23 pos18) (adjacent pos19 pos20) (adjacent pos20 pos19) (adjacent pos19 pos24) (adjacent pos24 pos19) (adjacent pos20 pos25) (adjacent pos25 pos20) (adjacent pos21 pos22) (adjacent pos22 pos21) (adjacent pos22 pos23) (adjacent pos23 pos22) (adjacent pos23 pos24) (adjacent pos24 pos23) (adjacent pos24 pos25) (adjacent pos25 pos24)
    )
    (:goal
        (and
            (empty pos1) 
            (at tile1 pos2) (at tile2 pos3) (at tile3 pos4) (at tile4 pos5) (at tile5 pos6) (at tile6 pos7) (at tile7 pos8) (at tile8 pos9) (at tile9 pos10) (at tile10 pos11) (at tile11 pos12) (at tile12 pos13) (at tile13 pos14) (at tile14 pos15) (at tile15 pos16) (at tile16 pos17) (at tile17 pos18) (at tile18 pos19) (at tile19 pos20) (at tile20 pos21) (at tile21 pos22) (at tile22 pos23) (at tile23 pos24) (at tile24 pos25)
        )
    )
)
    