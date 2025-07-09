role(xplayer).
role(oplayer).

init(cell(1, 1, xplayer)).
init(cell(2, 1, xplayer)).
init(cell(3, 1, xplayer)).
init(cell(1, 2, xplayer)).
init(cell(2, 2, xplayer)).
init(cell(3, 2, xplayer)).



init(cell(1, 4, oplayer)).
init(cell(2, 4, oplayer)).
init(cell(3, 4, oplayer)).
init(cell(1, 3, oplayer)).
init(cell(2, 3, oplayer)).
init(cell(3, 3, oplayer)).


init(control(xplayer)).

    

legal(xplayer, moves(X, Y1, X, Y2)) :- true(control(xplayer)), true(cell(X, Y1, xplayer)), 
                                          yplusplus(Y1, Y2), cellEmpty(X, Y2).


legal(xplayer, moves(X1, Y1, X2, Y2)) :- true(control(xplayer)), true(cell(X1, Y1, xplayer)), 
                                          yplusplus(Y1, Y2), xplusplus(X1, X2), not(true(cell(X2, Y2, xplayer))).


legal(xplayer, moves(X1, Y1, X2, Y2)) :- true(control(xplayer)), true(cell(X1, Y1, xplayer)),
                                            yplusplus(Y1, Y2), xplusplus(X2, X1), not(true(cell(X2, Y2, xplayer))).



legal(oplayer, moves(X, Y1, X, Y2)) :- true(control(oplayer)), true(cell(X, Y1, oplayer)),
                                          yplusplus(Y2, Y1), cellEmpty(X, Y2).


legal(oplayer, moves(X1, Y1, X2, Y2)) :- true(control(oplayer)), true(cell(X1, Y1, oplayer)),
                                            yplusplus(Y2, Y1), xplusplus(X1, X2), not(true(cell(X2, Y2, oplayer))).



legal(oplayer, moves(X1, Y1, X2, Y2)) :- true(control(oplayer)), true(cell(X1, Y1, oplayer)),
                                            yplusplus(Y2, Y1), xplusplus(X2, X1), not(true(cell(X2, Y2, oplayer))).


legal(xplayer, noop) :- true(control(oplayer)).

legal(oplayer, noop) :- true(control(xplayer)).


next(cell(X2, Y2, P)) :- role(P), does(P, moves(X1, Y1, X2, Y2)).


next(cell(X3, Y3, S)) :- true(cell(X3, Y3, S)), role(P), does(P, moves(X1, Y1, X2, Y2)),
                                distinctCell(X1, Y1, X3, Y3), distinctCell(X2, Y2, X3, Y3).

next(control(xplayer)) :- true(control(oplayer)).
next(control(oplayer)) :- true(control(xplayer)).



terminal :- whiteWin.
terminal :- blackWin.

goal(xplayer, 100) :- whiteWin.
goal(xplayer, 0) :- not(whiteWin).
goal(oplayer, 100) :- blackWin.
goal(oplayer, 0) :- not(blackWin).



cell(X, Y) :- xindex(X), yindex(Y).

cellEmpty(X, Y) :- cell(X, Y), not(true(cell(X, Y, xplayer))), not(true(cell(X, Y, oplayer))).

distinctCell(X1, Y1, X2, Y2) :- cell(X1, Y1), cell(X2, Y2), X1 \= X2.

distinctCell(X1, Y1, X2, Y2) :- cell(X1, Y1), cell(X2, Y2), Y1 \= Y2.

whiteWin :- xindex(X), true(cell(X, 4, xplayer)).

blackWin :- xindex(X), true(cell(X, 1, oplayer)).

whiteWin :- not(blackCell).

blackWin :- not(whiteCell).

whiteCell :- cell(X, Y), true(cell(X, Y, xplayer)).

blackCell :- cell(X, Y), true(cell(X, Y, oplayer)).


xindex(1).
xindex(2).
xindex(3).

yindex(1).
yindex(2).
yindex(3).
yindex(4).
xplusplus(1, 2).
xplusplus(2, 3).

yplusplus(1, 2).
yplusplus(2, 3).
yplusplus(3, 4).