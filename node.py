from typing import List
from npuzzle import State, Move

class Node():
    def __init__(self, state : State, move : Move, cost = 0, heuristic = 0, parent = None) -> None:
        self.state = state # liste entier
        self.move = move # mouvement
        self.cost = cost # cout (si fils +1)
        self.heuristic = heuristic
        self.parent = parent # peut avoir un autre node
        
    def __eq__(self, n) -> bool:
        return self.state == n.state
    
    def get_state(self) -> State:
        return self.state
    
    def get_path(self) -> List[Move]:
        if self.parent is None:
            return []
        else:
            return self.parent.get_path() + [self.move]

    def __lt__(self, other):
        return self.heuristic < other.heuristic