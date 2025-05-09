import npuzzle as np
import os

def main():

    #sizes = [3,5,7,9,11,13,15,17]
    sizes = [9]
    #lengths = [1,3,5,10,15, 20, 28, 35, 40, 45]
    lengths = [10]
    number = 3

    os.makedirs('puzzlez_custom_prout', exist_ok=True)

    for size in sizes:

        goal_state = np.create_goal(size)
        
        # Loop generating puzzles of succesive move lengths
        for length in lengths:
            
            # Loop generating n puzzles of the given length
            for n in range(0, number):
                
                new_state = np.shuffle(goal_state)

                for _ in range(length - 1):
                    new_state = np.shuffle(new_state)
                
                # Save the puzzle to the specified file
                filename = f"puzzlez_custom/npuzzle_{size}x{size}_len{length}_{n}.txt"
                print(f"Saving puzzle to {filename}")
                np.save_puzzle(new_state, filename)


if __name__ == '__main__':
    main()