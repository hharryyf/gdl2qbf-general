role(red).
role(black).
role(yellow).

init(control(red)).

legal(P, drop(X)) :- true(control(P)), columnOpen(X).
legal(Q, noop) :- true(control(P)), role(Q), P \= Q.

next(cell(X, 1, Player)) :- does(Player, drop(X)), columnEmpty(X).

next(cell(X, Y2, Player)) :- does(Player, drop(X)), cellOpen(X, Y2), succ(Y1, Y2), \+ cellOpen(X, Y1).

next(cell(X, Y, Player)) :- true(cell(X, Y, Player)).

next(control(red)) :- true(control(yellow)).

next(control(yellow)) :- true(control(black)).

next(control(black)) :- true(control(red)).

terminal :- line(red).

terminal :- line(black).

terminal :- line(yellow).

terminal :- \+ boardOpen.

goal(P, 100) :- line(P).

goal(red, 100) :- \+ line(red), \+ line(black), \+ line(yellow), \+ boardOpen.

goal(black, 0) :- \+ line(red), \+ line(black), \+ line(yellow), \+ boardOpen.

goal(yellow, 0) :- \+ line(red), \+ line(black), \+ line(yellow), \+ boardOpen.


goal(yellow, 0) :- line(red).

goal(black, 0) :- line(red).

goal(yellow, 0) :- line(black).

goal(red, 0) :- line(black).

goal(red, 0) :- line(yellow).

goal(black, 0) :- line(yellow).


cellOpen(X, Y) :- x(X), y(Y), \+ true(cell(X, Y, red)), \+ true(cell(X, Y, black)), \+ true(cell(X, Y, yellow)). 

columnOpen(X) :- cellOpen(X, 6).

columnEmpty(X) :- cellOpen(X, 1).

boardOpen :- x(X), columnOpen(X).

line(Player) :- true(cell(X1, Y, Player)), succ(X1, X2), succ(X2, X3),
                true(cell(X2, Y, Player)), true(cell(X3, Y, Player)).

line(Player) :- true(cell(X, Y1, Player)), succ(Y1, Y2), succ(Y2, Y3),
                true(cell(X, Y2, Player)), true(cell(X, Y3, Player)).

line(Player) :- true(cell(X1, Y1, Player)), succ(X1, X2), succ(X2, X3),
                true(cell(X2, Y2, Player)), true(cell(X3, Y3, Player)),
                succ(Y1, Y2), succ(Y2, Y3).


line(Player) :- true(cell(X1, Y3, Player)), succ(X1, X2), succ(X2, X3),
                true(cell(X2, Y2, Player)), true(cell(X3, Y1, Player)),
                succ(Y1, Y2), succ(Y2, Y3).

succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(3, 4).
succ(4, 5).
succ(5, 6).

x(1).
x(2).
x(3). 
x(4).
x(5).
x(6).
y(1). 
y(2). 
y(3).
y(4).
y(5).
y(6).
