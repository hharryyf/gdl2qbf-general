role(xplayer).
role(oplayer).
role(zplayer).

succ(1,2).
succ(2,3).
succ(3,4).

sign(xplayer, x).
sign(oplayer, o).
sign(zplayer, z).

index(X) :- succ(X,Y).
index(Y) :- succ(X,Y).

base(cell(X,Y,b)) :- index(X), index(Y).
base(cell(X,Y,S)) :- index(X), index(Y), sign(P,S).
base(control(P)) :- role(P).

input(P,mark(X, Y)) :- role(P), index(X), index(Y).
input(P,noop) :- role(P).

init(cell(X, Y, b)) :- index(X), index(Y).
init(control(xplayer)).

next(cell(X, Y, S)) :- does(P, mark(X, Y)), sign(P, S).

next(cell(X, Y, W)) :- true(cell(X, Y, W)), W \= b.

next(cell(M, N, b)) :- true(cell(M, N, b)), does(W, mark(J, K)), N \= K.
next(cell(M, N, b)) :- true(cell(M, N, b)), does(W, mark(J, K)), M \= J.

next(control(zplayer)) :- true(control(oplayer)).

next(control(oplayer)) :- true(control(xplayer)).

next(control(xplayer)) :- true(control(zplayer)).

row3(M, X) :- true(cell(M, A, X)), true(cell(M, B, X)), true(cell(M, C, X)), succ(A, B), succ(B, C).
column3(N, X) :- true(cell(A, N, X)), true(cell(B, N, X)), true(cell(C, N, X)), succ(A, B), succ(B, C).
diagonal3(X) :- true(cell(A, K, X)), true(cell(B, L, X)), true(cell(C, M, X)), succ(A, B), succ(K, L), succ(B, C), succ(L, M).
diagonal3(X) :- true(cell(A, K, X)), true(cell(B, L, X)), true(cell(C, M, X)), succ(B, A), succ(K, L), succ(C, B), succ(L, M).

line3(X) :- row3(M, X).
line3(X) :- column3(M, X).
line3(X) :- diagonal3(X).

open :- true(cell(M, N, b)).

terminal :- sign(P, S), line3(S).
terminal :- \+ open.

legal(W, mark(X, Y)) :- true(cell(X, Y, b)), true(control(W)).
legal(P, noop) :- role(P), \+ true(control(P)).

goal(P, 100) :- role(P), sign(P, S), line3(S).
goal(xplayer, 100) :- \+ line3(x), \+ line3(o), \+ line3(z), \+ open.
goal(oplayer, 0) :- \+ line3(x), \+ line3(o), \+ line3(z), \+ open.
goal(zplayer, 0) :- \+ line3(x), \+ line3(o), \+ line3(z), \+ open.

goal(P, 0) :- role(P), line3(S2), sign(P, S), sign(P1, S2), P1 \= P.

