role(xplayer).
role(oplayer).
init(control_1(xplayer)).


legal(P, mark(X, Y)) :- index(X), index(Y), true(control_1(P)), \+ true(cell(X, Y, x)), \+ true(cell(X, Y, o)).
legal(P, mark(X, Y)) :- index(X), index(Y), true(control_2(P)), \+ true(cell(X, Y, x)), \+ true(cell(X, Y, o)).

legal(oplayer, noop) :- true(control_1(xplayer)).
legal(oplayer, noop) :- true(control_2(xplayer)).
legal(xplayer, noop) :- true(control_1(oplayer)).
legal(xplayer, noop) :- true(control_2(oplayer)).

next(control_2(xplayer)) :- true(control_1(xplayer)).
next(control_2(oplayer)) :- true(control_1(oplayer)).
next(control_1(oplayer)) :- true(control_2(xplayer)).
next(control_1(xplayer)) :- true(control_2(oplayer)).


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

line(P) :- true(cell(X1, Y1, P)), true(cell(X1, Y2, P)), true(cell(X2, Y1, P)), true(cell(X2, Y2, P)), succ(Y1, Y2), succ(X1, X2).
