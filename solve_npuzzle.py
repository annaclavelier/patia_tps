
from npuzzle import (Solution,
                     State,
                     Move,
                     UP, 
                     DOWN, 
                     LEFT, 
                     RIGHT,
                     get_children,
                     is_goal,
                     is_solution,
                     load_puzzle,
                     to_string)
from node import Node
from typing import Literal, List
import argparse
import math
import time
import heapq

BFS = 'bfs'
DFS = 'dfs'
ASTAR = 'astar'

Algorithm = Literal['bfs', 'dfs', 'astar']

def solve_bfs(open : List[Node]) -> Solution:
    '''Solve the puzzle using the BFS algorithm (breadth-first-search)'''
    dimension = int(math.sqrt(len(open[0].get_state())))
    moves = [UP, DOWN, LEFT, RIGHT]
    while open:
        node = open.pop(0)
        if is_goal(node.get_state()):
            return node.get_path()
        puzzle = node.get_state()
        k = node.cost
        #print('k = ', k)
        children = get_children(puzzle, moves, dimension)
        for child in children:
            n = Node(state = child[0], move = child[1], parent = node, cost = k + 1)
            open.append(n)
    return []

def solve_dfs(open : List[Node]) -> Solution:
    '''Solve the puzzle using the DFS algorithm'''
    '''
    dimension = int(math.sqrt(len(open[0].get_state())))
    moves = [UP, DOWN, LEFT, RIGHT]
    while open:
        node = open.pop(0)
        if is_goal(node.get_state()):
            return node.get_path()
        puzzle = node.get_state()
        k = node.cost
        print('k = ', k)
        children = get_children(puzzle, moves, dimension)
        print("len children", len(children))
        list_ = []
        for child in children:
            n = Node(state = child[0], move = child[1], parent = node, cost = k + 1)
            # Ajouter à la tête de la liste
            list_.append(n)
        # print("list_", list_)
        
        open = list_ + open
        
            
    return []
    '''
    dimension = int(math.sqrt(len(open[0].get_state())))
    moves = [UP, DOWN, LEFT, RIGHT]
    while open:
        node = open.pop()
        if is_goal(node.get_state()):
            return node.get_path()
        puzzle = node.get_state()
        k = node.cost
        # print('k = ', k)

        children = get_children(puzzle, moves, dimension)
        for child in children:
            n = Node(state = child[0], move = child[1], parent = node, cost = k + 1)
            # Ajouter à la tête de la liste
            open.insert(0,n)
            
    return []

def solve_astar(open : List[Node], close : List[Node]) -> Solution:
    '''Solve the puzzle using the A* algorithm'''
    # tq open pas vide
    # premier noeud celui qui minimise la fonction heuristique
    # get_path -> chemin vers la racine
    dimension = int(math.sqrt(len(open[0].get_state())))
    moves = [UP, DOWN, LEFT, RIGHT]
    while open:
        node = open.pop(0)
        close.append(node)

        if is_goal(node.get_state()):
            return node.get_path()

        k = node.cost
        print('k = ', k)

        puzzle = node.get_state()
       
        children = get_children(puzzle, moves, dimension)

        for child in children:
            n = Node(state = child[0], move = child[1], parent = node, cost = k+1)
            n.heuristic = heuristic(node)
            # vérifier que n n'est pas dans close ou open
            if n not in close or n not in open:
                open.append(n)
                
            # trier liste
            open.sort(key =lambda x: x.cost + x.heuristic )
        
        
    return []

def heuristic(node : Node) -> int:
    '''Calculate the heuristic vaœlue of the puzzle'''
    distance = 0
    state = node.get_state()
    for i,e in enumerate(state):
        (i_x, i_y) = divmod(i, math.sqrt(len(state)))
        (e_x, e_y) = divmod(e,math.sqrt(len(state)))
        dist = abs(e_x-i_x) + abs(e_y - i_y)
        distance += dist
    
    # distance manhattan
    return distance

def main():
    parser = argparse.ArgumentParser(description='Load an n-puzzle and solve it.')
    parser.add_argument('filename', type=str, help='File name of the puzzle')
    parser.add_argument('-a', '--algo', type=str, choices=['bfs', 'dfs', 'astar'], required=True, help='Algorithm to solve the puzzle')
    parser.add_argument('-v', '--verbose', action='store_true', help='Increase output verbosity')
    
    args = parser.parse_args()
    
    puzzle = load_puzzle(args.filename)
    
    if args.verbose:
        print('Puzzle:\n')
        print(to_string(puzzle))
    
    if not is_goal(puzzle):   
         
        root = Node(state = puzzle, move = None)
        close = []
        open = [root]
        
        if args.algo == BFS:
            print('BFS\n')
            start_time = time.time()
            solution = solve_bfs(open)
            duration = time.time() - start_time
            if solution:
                print('Solution:', solution)
                print('Valid solution:', is_solution(puzzle, solution))
                print('Duration:', duration)
            else:
                print('No solution')
        elif args.algo == DFS:
            print('DFS')
            start_time = time.time()
            solution = solve_dfs(open)
            duration = time.time() - start_time
            if solution:
                print('Solution:', solution)
                print('Valid solution:', is_solution(puzzle, solution))
                print('Duration:', duration)
            else:
                print('No solution')
        elif args.algo == ASTAR:
            print('A*')
            start_time = time.time()
            solution = solve_astar(open, close)
            duration = time.time() - start_time
            if solution:
                print('Solution:', solution)
                print('Valid solution:', is_solution(puzzle, solution))
                print('Duration:', duration)
            else:
                print('No solution')
    else:
        print('Puzzle is already solved')
    
if __name__ == '__main__':
    main()