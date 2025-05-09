import argparse
import re

def main():
    parser = argparse.ArgumentParser(description="Convertir un puzzle N-puzzle en fichier PDDL.")
    
    parser.add_argument("-i", "--input", type=str, required=True, help="Le fichier contenant la configuration du taquin.")
    parser.add_argument("-o", "--output", type=str, required=True, help="Le fichier PDDL de sortie.")
    
    args = parser.parse_args()
    
    filename = args.input
    # Extraire la taille du puzzle à partir du nom du fichier
    match = re.search(r'npuzzle_(\d+)x(\d+)', filename)
    if match:
        # Taille du puzzle (par exemple 17 pour un 17x17)
        size = int(match.group(1))  
    else:
        raise ValueError(f"Le nom de fichier {filename} ne contient pas de taille valide.")
    
    # Lire la configuration depuis le fichier d'entrée
    with open(filename, 'r') as file:
        content = file.read().strip()
        config = list(map(int, content.split()))
    
    # Nombre de tuiles (sans la case vide)
    num_tiles = size * size - 1 
    
    # Listes pour les objets
    tiles = [f"tile{i+1}" for i in range(num_tiles)]
    positions = [f"pos{i+1}" for i in range(size * size)]

    # Créer les adjacences
    adjacencies = []
    for i in range(size):
        for j in range(size):
            pos = i * size + j
            if j < size - 1:  # Adjacent à droite
                adjacencies.append((positions[pos], positions[pos + 1]))
            if i < size - 1:  # Adjacent en bas
                adjacencies.append((positions[pos], positions[pos + size]))

    # Initialisation des attributions de positions (au début, chaque tuile est dans sa place)
    init_state = []
    
    # Placer la case vide (0) dans le bon endroit
    empty_pos = config.index(0)
    init_state.append(f"(empty {positions[empty_pos]})")
    
    # Placer les autres tuiles
    for i, tile in enumerate(config):
        if tile != 0:  # Ne pas attribuer la position à la case vide
            init_state.append(f"(at {tiles[tile - 1]} {positions[i]})")

    # Création le contenu du fichier PDDL
    pddl_content = f"""
(define (problem taquin-{size}x{size})
    (:domain taquin)
    (:objects
        {" ".join(tiles)} - tile
        {" ".join(positions)} - position
    )
    (:init
        {" ".join(init_state)}
        {" ".join([f"(adjacent {p1} {p2}) (adjacent {p2} {p1})" for p1, p2 in adjacencies])}
    )
    (:goal
        (and
            (empty pos1)
            {" ".join([f"(at {tiles[i]} {positions[i+1]})" for i in range(num_tiles)])}
        )
    )
)
    """
    
    # Sauvegarder le fichier PDDL généré
    with open(args.output, 'w') as file:
        file.write(pddl_content)
    
    print(f"Le fichier PDDL a été généré sous '{args.output}'.")


if __name__ == "__main__":
    main()
