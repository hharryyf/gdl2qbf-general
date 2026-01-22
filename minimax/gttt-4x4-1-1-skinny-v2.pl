role(xplayer).
role(oplayer).
init(control(xplayer)).

legal(P, mark(X, Y)) :- index(X), index(Y), true(control(P)), \+ true(cell(X, Y, x)), \+ true(cell(X, Y, o)).
legal(P, noop) :- role(P), \+ true(control(P)).
next(control(oplayer)) :- true(control(xplayer)).
next(control(xplayer)) :- true(control(oplayer)).



next(cell(M, N, x)) :- does(xplayer, mark(M, N)).
next(cell(M, N, o)) :- does(oplayer, mark(M, N)).
next(cell(M, N, C)) :- true(cell(M, N, C)).

terminal :- line(x).
terminal :- line(o).
terminal :- \+ open.


open :- index(X), index(Y), \+ true(cell(X, Y, x)), \+ true(cell(X, Y, o)).

goal(xplayer, 100) :- line(x).
goal(xplayer, 50) :- \+ line(x) , \+ line(o).
goal(xplayer, 0) :- line(o).
goal(oplayer, 100) :- line(o).
goal(oplayer, 50) :- \+ line(x) , \+ line(o).
goal(oplayer, 0) :- line(x).

succ(1, 2).
succ(2, 3).
succ(3, 4).
index(1).
index(2).
index(3).
index(4).

line(P) :- true(cell(X, Y1, P)), true(cell(X, Y2, P)), true(cell(X, Y3, P)), true(cell(X, Y4, P)), succ(Y1, Y2), succ(Y2, Y3), succ(Y3, Y4).
line(P) :- true(cell(X1, Y, P)), true(cell(X2, Y, P)), true(cell(X3, Y, P)), true(cell(X4, Y, P)), succ(X1, X2), succ(X2, X3), succ(X3, X4).
