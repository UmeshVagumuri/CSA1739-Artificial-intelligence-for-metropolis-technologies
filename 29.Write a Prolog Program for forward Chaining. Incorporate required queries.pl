% Facts
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

male(tom).
male(bob).
male(jim).

female(liz).
female(ann).
female(pat).

% Rules
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Queries
% Who are the grandparents?
% ?- grandparent(GP, GC).

% Who are the siblings?
% ?- sibling(S1, S2).

% Who are the ancestors?
% ?- ancestor(Anc, Desc).
