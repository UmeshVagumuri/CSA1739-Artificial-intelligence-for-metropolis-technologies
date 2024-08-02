% Define facts about birds and their ability to fly
can_fly('Sparrow').
can_fly('Eagle').
can_fly('Falcon').
can_fly('Hawk').

% Birds that cannot fly
cannot_fly('Penguin').
cannot_fly('Ostrich').
cannot_fly('Kiwi').
cannot_fly('Cassowary').

% Define a rule to check if a bird can fly
can_this_bird_fly(Bird) :-
    can_fly(Bird),
    write(Bird), write(' can fly.'), nl.

can_this_bird_fly(Bird) :-
    cannot_fly(Bird),
    write(Bird), write(' cannot fly.'), nl.

% Example queries
% Check if a specific bird can fly
check_bird(Bird) :-
    can_this_bird_fly(Bird).
