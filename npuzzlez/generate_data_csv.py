import os
import time
import csv
import re
import signal
from node import Node
from solve_npuzzle import solve_astar, solve_bfs, solve_dfs
from npuzzle import is_goal, load_puzzle, is_solution

'''Class for managing timeout'''
class TimeoutException(Exception):
    pass

def handler(signum, frame):
    raise TimeoutException()

ALGORITHMS = ['bfs', 'dfs', 'astar']
PUZZLE_DIR = 'puzzlez/'
CSV_FILE = 'benchmark_results.csv'
TIMEOUT = 120 # timeout in seconds

# Liste des puzzles à traiter
puzzle_files = sorted([f for f in os.listdir(PUZZLE_DIR) if f.endswith('.txt')])

# Open csv in append mode if already existing, else write the header
write_header = not os.path.exists(CSV_FILE)
with open(CSV_FILE, mode='a', newline='') as file:
    writer = csv.writer(file)
    if write_header:
        writer.writerow(['Puzzle', 'Size', 'Length', 'Algorithm', 'Time', 'Success'])

    for puzzle_file in puzzle_files:
        match = re.search(r'npuzzle_(\d+)x\1_len(\d+)_\d+\.txt', puzzle_file)
        if not match:
            continue

        size = int(match.group(1))
        length = int(match.group(2))
        puzzle_path = os.path.join(PUZZLE_DIR, puzzle_file)

        for algo in ALGORITHMS:
          
            try:
                puzzle = load_puzzle(puzzle_path)
            except Exception as e:
                print(f"Error while charging puzzle file {puzzle_file}: {e}")
                continue

            if not is_goal(puzzle):   
                root = Node(state=puzzle, move=None)
                close = []
                open = [root]
                # setting timeout
                signal.signal(signal.SIGALRM, handler)
                signal.alarm(TIMEOUT)
                try:
                    start_time = time.time()
                    if algo == 'bfs':
                        solution = solve_bfs(open)
                    elif algo == 'dfs':
                        solution = solve_dfs(open)
                    else:
                        solution = solve_astar(open, close)
                    duration = time.time() - start_time
                    success = is_solution(puzzle, solution)
                except TimeoutException:
                    duration = 120
                    success = False
                finally:
                    signal.alarm(0)

                writer.writerow([puzzle_file, size, length, algo, duration, success])
                file.flush()
                print(f"Puzzle {puzzle_file} - {algo}: {duration:.2f}s - Success: {success}")
            else:
                print(f"Puzzle {puzzle_file} is already goal, aborting")
