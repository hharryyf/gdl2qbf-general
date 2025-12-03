
role(xplayer).
role(oplayer).


index(1). index(2). index(3).
base(cell(X,Y,b)) :- index(X), index(Y).
base(cell(X,Y,x)) :- index(X), index(Y).
base(cell(X,Y,o)) :- index(X), index(Y).
base(control(P)) :- role(P).

input(P, mark(X,Y)) :- index(X), index(Y), role(P).
input(P, noop) :- role(P).

init(cell(1,1,b)).
init(cell(1,2,b)).
init(cell(1,3,b)).
init(cell(2,1,b)).
init(cell(2,2,b)).
init(cell(2,3,b)).
init(cell(3,1,b)).
init(cell(3,2,b)).
init(cell(3,3,b)).
init(control(xplayer)).

legal(P, mark(X, Y)) :- true(control(P)), true(cell(X, Y, b)).
legal(P, noop) :- role(P), \+ true(control(P)).
next(control(oplayer)) :- true(control(xplayer)).
next(control(xplayer)) :- true(control(oplayer)).



next(cell(M, N, x)) :- does(xplayer, mark(M, N)).
next(cell(M, N, o)) :- does(oplayer, mark(M, N)).
next(cell(M, N, C)) :- true(cell(M, N, C)), does(P, mark(X, Y)), X \= M.
next(cell(M, N, C)) :- true(cell(M, N, C)), does(P, mark(X, Y)), Y \= N.

terminal :- line(x).
terminal :- line(o).
terminal :- \+ open.


open :- true(cell(X, Y, b)).

goal(xplayer, 100) :- line(x).
goal(xplayer, 50) :- \+ line(x) , \+ line(o).
goal(xplayer, 0) :- line(o).
goal(oplayer, 100) :- line(o).
goal(oplayer, 50) :- \+ line(x) , \+ line(o).
goal(oplayer, 0) :- line(x).

succ(1, 2).
succ(2, 3).
succ(3, 4).

line(P) :- true(cell(X1, Y1, P)), true(cell(X1, Y2, P)), true(cell(X1, Y3, P)), true(cell(X2, Y1, P)), succ(Y1, Y2), succ(X1, X2), succ(Y2, Y3).
line(P) :- true(cell(X1, Y1, P)), true(cell(X1, Y2, P)), true(cell(X1, Y3, P)), true(cell(X2, Y1, P)), succ(Y1, Y2), succ(X2, X1), succ(Y2, Y3).

line(P) :- true(cell(X1, Y1, P)), true(cell(X1, Y2, P)), true(cell(X1, Y3, P)), true(cell(X2, Y3, P)), succ(Y1, Y2), succ(X1, X2), succ(Y2, Y3).
line(P) :- true(cell(X1, Y1, P)), true(cell(X1, Y2, P)), true(cell(X1, Y3, P)), true(cell(X2, Y3, P)), succ(Y1, Y2), succ(X2, X1), succ(Y2, Y3).

line(P) :- true(cell(X1, Y1, P)), true(cell(X2, Y1, P)), true(cell(X3, Y1, P)), true(cell(X1, Y2, P)), succ(Y1, Y2), succ(X1, X2), succ(X2, X3).
line(P) :- true(cell(X1, Y1, P)), true(cell(X2, Y1, P)), true(cell(X3, Y1, P)), true(cell(X1, Y2, P)), succ(Y2, Y1), succ(X1, X2), succ(X2, X3).

line(P) :- true(cell(X1, Y1, P)), true(cell(X2, Y1, P)), true(cell(X3, Y1, P)), true(cell(X3, Y2, P)), succ(Y1, Y2), succ(X1, X2), succ(X2, X3).
line(P) :- true(cell(X1, Y1, P)), true(cell(X2, Y1, P)), true(cell(X3, Y1, P)), true(cell(X3, Y2, P)), succ(Y2, Y1), succ(X1, X2), succ(X2, X3).

