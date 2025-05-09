import npuzzle as np
import os

PUZZLE_DIR='puzzlez'

def main():
    # Different sizes of npuzzle
    sizes = [3,5,7,9,11,13,15,17]
    # Maxlengths
    lengths = [1,3,5,10,15, 20, 28, 35, 40, 45]
    # Number of instances of same configuration (size, maxlength)
    number = 3
    
    # Create directory if not exists
    os.makedirs(PUZZLE_DIR, exist_ok=True)

    for size in sizes:

        # Generate npuzzle of current size
        goal_state = np.create_goal(size)
        
        # Loop generating puzzles of succesive move lengths
        for length in lengths:
            
            # Loop generating n puzzles of the given length
            for n in range(0, number):
                
                new_state = np.shuffle(goal_state)

                for _ in range(length - 1):
                    new_state = np.shuffle(new_state)
                
                # Save the puzzle to the specified file
                filename = f"{PUZZLE_DIR}/npuzzle_{size}x{size}_len{length}_{n}.txt"
                np.save_puzzle(new_state, filename)
        
                print(f"Saving puzzle to {filename}")


if __name__ == '__main__':
    main()