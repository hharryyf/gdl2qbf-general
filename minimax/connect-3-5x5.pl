role(red).
role(black).

init(control(red)).

legal(red, noop) :- true(control(black)).
legal(red, drop(X)) :- true(control(red)), columnOpen(X).
legal(black, noop) :- true(control(red)).
legal(black, drop(X)) :- true(control(black)), columnOpen(X).

next(cell(X, 1, Player)) :- does(Player, drop(X)), columnEmpty(X).

next(cell(X, Y2, Player)) :- does(Player, drop(X)), cellOpen(X, Y2), succ(Y1, Y2), not(cellOpen(X, Y1)).

next(cell(X, Y, Player)) :- true(cell(X, Y, Player)).

next(control(red)) :- true(control(black)).

next(control(black)) :- true(control(red)).

terminal :- line(red).

terminal :- line(black).

terminal :- not(boardOpen).

goal(red, 100) :- line(red).

goal(red, 50) :- not(line(red)), not(line(black)), not(boardOpen).

goal(red, 0) :- not(line(red)), not(line(black)), boardOpen.

goal(red, 0) :- line(black).

goal(black, 100) :- black(red).

goal(black, 50) :- not(line(red)), not(line(black)), not(boardOpen).

goal(black, 0) :- not(line(red)), not(line(black)), boardOpen.

goal(black, 0) :- line(red).

cellOpen(X, Y) :- x(X), y(Y), not(true(cell(X, Y, red))), not(true(cell(X, Y, black))). 

columnOpen(X) :- cellOpen(X, 5).

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
succ(4, 5).

x(1).
x(2).
x(3). 
x(4).
x(5).
y(1). 
y(2). 
y(3).
y(4).
y(5).