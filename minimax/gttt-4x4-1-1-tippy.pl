:- set_prolog_flag(stack_limit, 10000000000).

role(xplayer).
role(oplayer).
init(control(xplayer)).


init(cell(1, 1, blank)). 
init(cell(1, 2, blank)). 
init(cell(1, 3, blank)). 
init(cell(1, 4, blank)).
init(cell(2, 1, blank)). 
init(cell(2, 2, blank)). 
init(cell(2, 3, blank)). 
init(cell(2, 4, blank)).
init(cell(3, 1, blank)). 
init(cell(3, 2, blank)). 
init(cell(3, 3, blank)). 
init(cell(3, 4, blank)).
init(cell(4, 1, blank)). 
init(cell(4, 2, blank)). 
init(cell(4, 3, blank)). 
init(cell(4, 4, blank)).


legal(P, mark(X, Y)) :- true(control(P)), true(cell(X, Y, blank)).
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


open :- true(cell(X, Y, blank)).

goal(xplayer, 100) :- line(x).
goal(xplayer, 50) :- \+ line(x) , \+ line(o).
goal(xplayer, 0) :- line(o).
goal(oplayer, 100) :- line(o).
goal(oplayer, 50) :- \+ line(x) , \+ line(o).
goal(oplayer, 0) :- line(x).

succ(1, 2).
succ(2, 3).
succ(3, 4).

line(P) :- true(cell(X1, Y1, P)), true(cell(X1, Y2, P)), true(cell(X2, Y2, P)), true(cell(X2, Y3, P)), succ(Y1, Y2), succ(X1, X2), succ(Y2, Y3).
line(P) :- true(cell(X1, Y2, P)), true(cell(X1, Y3, P)), true(cell(X2, Y1, P)), true(cell(X2, Y2, P)), succ(Y1, Y2), succ(X1, X2), succ(Y2, Y3).
line(P) :- true(cell(X1, Y1, P)), true(cell(X2, Y1, P)), true(cell(X2, Y2, P)), true(cell(X3, Y2, P)), succ(Y1, Y2), succ(X1, X2), succ(X2, X3).
line(P) :- true(cell(X1, Y2, P)), true(cell(X2, Y1, P)), true(cell(X2, Y2, P)), true(cell(X3, Y1, P)), succ(Y1, Y2), succ(X1, X2), succ(X2, X3).
