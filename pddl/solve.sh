#!/bin/bash

solveHSP(){
    read -p "Enter domain file [path to the file]: " domainFile
    read -p "Enter problem file [path to the file]: " problemFile
    read -p "Timeout [int]: " timeOut

    show_heuristic

    read -p "Choose heuristic [0 - 8]: " h

    case $h in
        0) heuristic='AJUSTED_SUM' ;;
        1) heuristic='AJUSTED_SUM2' ;;
        2) heuristic='AJUSTED_SUM2M' ;;
        3) heuristic='COMBO' ;;
        4) heuristic='MAX' ;;
        5) heuristic='FAST_FORWARD' ;;
        6) heuristic='SET_LEVEL' ;;
        7) heuristic='SUM' ;;
        8) heuristic='SUM_MUTEX' ;;
        *) echo "Error: Invalid heuristic choice" && sleep 1 && return ;;
    esac

    # Exécuter le solveur et capturer la sortie
    output=$(java -cp ./pddl4j-4.0.0.jar -server -Xms2048m -Xmx2048m fr.uga.pddl4j.planners.statespace.HSP "$domainFile" "$problemFile" -t "$timeOut")

    # Vérifier si le plan a été trouvé
    if echo "$output" | grep -q "found plan as follows:"; then
        echo "Plan found!"
        echo "------------------------"

        # Extraire le plan
        plan=$(echo "$output" | sed -n '/found plan as follows:/,/time spent:/p' | sed '1d;$d')

        # Afficher et sauvegarder le plan
        echo "$plan"
        echo "$plan" > plan.txt
        echo "Plan saved in plan.txt"
    else
        echo "No plan found or an error occurred."
    fi
}

solveFF(){
    read -p "Enter domain file [path to the file]: " domainFile
    read -p "Enter problem file [path to the file]: " problemFile
    read -p "Timeout [int]: " timeOut

    # Exécuter FF et capturer la sortie
    output=$(java -cp ./pddl4j-4.0.0.jar -server -Xms2048m -Xmx2048m fr.uga.pddl4j.planners.statespace.FF "$domainFile" "$problemFile" -t "$timeOut")

    # Vérifier si le plan a été trouvé
    if echo "$output" | grep -q "found plan as follows:"; then
        echo "Plan found!"
        echo "------------------------"

        # Extraire le plan
        plan=$(echo "$output" | sed -n '/found plan as follows:/,/time spent:/p' | sed '1d;$d')

        # Afficher et sauvegarder le plan
        echo "$plan"
        echo "$plan" > plan.txt
        echo "Plan saved in plan.txt"
    else
        echo "No plan found or an error occurred."
    fi
}

show_menus() {
    echo "| 1. Solve with HSP"
    echo "| 2. Solve with FF"
    echo "| 3. Exit"
    echo " ----------"
}

show_heuristic() {
    echo "0. AJUSTED_SUM"
    echo "1. AJUSTED_SUM2"
    echo "2. AJUSTED_SUM2M"
    echo "3. COMBO"
    echo "4. MAX"
    echo "5. FAST_FORWARD"
    echo "6. SET_LEVEL"
    echo "7. SUM"
    echo "8. SUM_MUTEX"
}

read_options(){
    local choice
    read -p "Enter choice [1 - 3] : " choice
    case $choice in
        1) solveHSP ;;
        2) solveFF ;;
        3) exit 0;;
        *) echo "Error: Invalid choice" && sleep 1 && return ;;
    esac
}

# ----------------------------------------------
# Trap CTRL+C, CTRL+Z and quit signals
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP

# -----------------------------------
# Main logic - infinite loop
# ------------------------------------
echo "****************************************"
echo "PDDL4J - Plan Solver"
echo "****************************************"
echo "Please see full documentation at: http://pddl4j.imag.fr"
echo ""
echo "Choose an option:"
echo ""
while true
do
    show_menus
    read_options
done
