terminated(1) :- terminal(1).
terminated(2) :- terminal(2).

role(x).
role(o).
legal(x, left, 1).
legal(x, right, 2).
legal(o, left, 1).
1 {does(P,left,1);does(P,right,1)} 1 :- not terminated(1), role(P).
terminated(2) :- terminated(1).

{moveL(o,0, 1)}.

does(o, right, 1) :- moveL(o, 0, 1), legal(o, right, 1), not terminated(1).
does(o, left, 1) :- not moveL(o, 0, 1), legal(o, left, 1), not terminated(1).

true(win, 2) :- does(x, left, 1).
terminal(2) :- true(win, 2).
terminal(1) :- true(win, 1).

:- not terminated(2).