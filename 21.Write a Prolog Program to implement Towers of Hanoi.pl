% Define the main predicate to solve Towers of Hanoi
% hanoi(NumberOfDisks, SourcePeg, TargetPeg, AuxiliaryPeg)
hanoi(0, _, _, _) :-
    % Base case: no disks to move
    true.

hanoi(N, Source, Target, Auxiliary) :-
    N > 0,
    % Move N-1 disks from Source to Auxiliary using Target as auxiliary
    M is N - 1,
    hanoi(M, Source, Auxiliary, Target),
    
    % Move the Nth disk from Source to Target
    write('Move disk '), write(N), write(' from '), write(Source),
    write(' to '), write(Target), nl,
    
    % Move the N-1 disks from Auxiliary to Target using Source as auxiliary
    hanoi(M, Auxiliary, Target, Source).

% Example of solving Towers of Hanoi with 3 disks
solve_towers_of_hanoi :-
    hanoi(3, 'A', 'C', 'B').
