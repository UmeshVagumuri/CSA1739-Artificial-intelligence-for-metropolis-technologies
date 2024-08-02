% Define the goal state
goal_state(goal).

% Define the heuristic function
% The heuristic function should estimate the cost from the current state to the goal state
% Here we define some example heuristic values for demonstration
heuristic(a, 5).
heuristic(b, 3).
heuristic(c, 2).
heuristic(goal, 0).

% Define the graph structure
% Each edge is defined as edge(From, To, Cost)
edge(a, b, 1).
edge(a, c, 2).
edge(b, goal, 4).
edge(c, goal, 1).

% Best First Search implementation
% bfs(Start, Path, Cost) finds a path from Start to the goal state with the given Cost
bfs(Start, Path, Cost) :-
    heuristic(Start, HCost),
    bfs_helper([node(Start, [], 0, HCost)], Path, Cost).

% bfs_helper(Queue, Path, Cost)
% Queue is a priority queue of nodes to explore
% Path is the path from the start state to the goal state
% Cost is the total cost of the path
bfs_helper([node(State, Path, GCost, _)|_], [State|Path], GCost) :-
    goal_state(State).

bfs_helper([node(State, Path, GCost, _)|RestQueue], FinalPath, FinalCost) :-
    findall(node(NextState, [State|Path], NewGCost, HCost),
            (edge(State, NextState, StepCost),
             NewGCost is GCost + StepCost,
             heuristic(NextState, HCost)),
            NextNodes),
    append(RestQueue, NextNodes, NewQueue),
    sort_queue(NewQueue, SortedQueue),
    bfs_helper(SortedQueue, FinalPath, FinalCost).

% sort_queue(Queue, SortedQueue)
% Sorts the queue based on the heuristic cost
sort_queue(Queue, SortedQueue) :-
    sort(3, @=<, Queue, SortedQueue).

% Define node structure
% node(State, Path, GCost, HCost)
% State is the current state
% Path is the path from the start state to the current state
% GCost is the cost from the start state to the current state
% HCost is the heuristic cost from the current state to the goal state
