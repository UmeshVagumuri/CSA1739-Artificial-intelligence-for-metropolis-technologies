% Define facts about family relationships
% parent(Parent, Child)
parent('John', 'Alice').
parent('John', 'Bob').
parent('Mary', 'Alice').
parent('Mary', 'Bob').

parent('Bob', 'Charlie').
parent('Linda', 'Charlie').

parent('Alice', 'Daniel').
parent('Steve', 'Daniel').

% Define rules to infer relationships

% Define a rule to find a parent of a person
is_parent(Parent, Child) :-
    parent(Parent, Child).

% Define a rule to find a child of a person
is_child(Child, Parent) :-
    parent(Parent, Child).

% Define a rule to find siblings
are_siblings(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.

% Define a rule to find grandparents
is_grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

% Define a rule to find grandchildren
is_grandchild(Grandchild, Grandparent) :-
    is_grandparent(Grandparent, Grandchild).

% Define a rule to find aunts and uncles
is_aunt_or_uncle(AuntOrUncle, NieceOrNephew) :-
    parent(Parent, NieceOrNephew),
    are_siblings(Parent, AuntOrUncle).

% Define a rule to find cousins
are_cousins(Cousin1, Cousin2) :-
    parent(Parent1, Cousin1),
    parent(Parent2, Cousin2),
    are_siblings(Parent1, Parent2).

% Example Queries
% Find out if John is a parent of Alice
% ?- is_parent('John', 'Alice').
% true.

% Find out if Alice and Bob are siblings
% ?- are_siblings('Alice', 'Bob').
% true.

% Find out who are John's children
% ?- is_child(Child, 'John').
% Child = 'Alice';
% Child = 'Bob'.

% Find out who are Alice's grandparents
% ?- is_grandparent(Grandparent, 'Alice').
% Grandparent = 'John';
% Grandparent = 'Mary'.

% Find out if Charlie and Daniel are cousins
% ?- are_cousins('Charlie', 'Daniel').
% false.

% Find out who are Daniel's aunts and uncles
% ?- is_aunt_or_uncle(AuntOrUncle, 'Daniel').
% AuntOrUncle = 'Bob';
% AuntOrUncle = 'Linda'.
