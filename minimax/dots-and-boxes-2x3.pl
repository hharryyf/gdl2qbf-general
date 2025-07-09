role(xplayer).
role(oplayer).

xindex(1).
xindex(2).
xindex(3).
xindex(4).
yindex(1).
yindex(2).
yindex(3).

next_index_x(1, 2).
next_index_x(2, 3).
next_index_x(3, 4).
next_index_y(1, 2).
next_index_y(2, 3).

init(box_count(xplayer, 0)).
init(box_count(oplayer, 0)).
init(control(xplayer)).




undrawn(X, Y1, X, Y2) :- xindex(X), next_index_y(Y1, Y2), \+ true(line(X, Y1, X, Y2)).

undrawn(X1, Y, X2, Y) :- next_index_x(X1, X2), yindex(Y), \+ true(line(X1, Y, X2, Y)).


any_undrawn :- undrawn(X1, Y1, X2, Y2).


legal(P, draw(X1, Y1, X2, Y2)) :- true(control(P)), undrawn(X1, Y1, X2, Y2).

next(line(X1, Y1, X2, Y2)) :- does(P, draw(X1, Y1, X2, Y2)).
next(line(X1, Y1, X2, Y2)) :- true(line(X1, Y1, X2, Y2)). 

legal(P, noop) :- role(P), \+ true(control(P)).

v_drawn(X, Y1, X, Y2) :- does(P, draw(X, Y1, X, Y2)).
h_drawn(X1, Y, X2, Y) :- does(P, draw(X1, Y, X2, Y)).    

box_formed(X1, Y1) :- v_drawn(X1, Y1, X1, Y2), true(line(X1, Y2, X2, Y2)), true(line(X1, Y1, X2, Y1)), true(line(X2, Y1, X2, Y2)).

box_formed(X1, Y1) :- v_drawn(X2, Y1, X2, Y2), true(line(X1, Y1, X2, Y1)), true(line(X1, Y1, X1, Y2)), true(line(X1, Y2, X2, Y2)).

box_formed(X1, Y1) :- h_drawn(X1, Y1, X2, Y1), true(line(X2, Y1, X2, Y2)), true(line(X1, Y1, X1, Y2)), true(line(X1, Y2, X2, Y2)).

box_formed(X1, Y1) :- h_drawn(X1, Y2, X2, Y2), true(line(X1, Y1, X1, Y2)), true(line(X1, Y1, X2, Y1)), true(line(X2, Y1, X2, Y2)).

any_box_formed :- box_formed(X, Y).
two_boxes_formed :- box_formed(X1, Y1), box_formed(X2, Y2), X1 \= X2.
two_boxes_formed :- box_formed(X1, Y1), box_formed(X2, Y2), Y1 \= Y2.

next(box_count(P, N)) :- true(box_count(P, N)), \+ true(control(P)).
next(box_count(P, N)) :- true(box_count(P, N)), true(control(P)), \+ any_box_formed.    
next(box_count(P, NP1)) :- true(box_count(P, N)), true(control(P)), any_box_formed, \+ two_boxes_formed, succ(N, NP1).
next(box_count(P, NP2)) :- true(box_count(P, N)), true(control(P)), two_boxes_formed, succ(N, NP1), succ(NP1, NP2).


next(control(P)) :- true(control(P)), any_box_formed.
next(control(xplayer)) :- true(control(oplayer)), \+ any_box_formed.
next(control(oplayer)) :- true(control(xplayer)), \+ any_box_formed.


next(box(X, Y, x)) :- box_formed(X, Y), true(control(xplayer)).
next(box(X, Y, o)) :- box_formed(X, Y), true(control(oplayer)).
next(box(X, Y, M)) :- true(box(X, Y, M)).


terminal :- \+ any_undrawn.

x_wins :- true(box_count(xplayer, X)), true(box_count(oplayer, O)), gt(X, O).

o_wins :- true(box_count(xplayer, X)), true(box_count(oplayer, O)), gt(O, X).

o_wins :- true(box_count(xplayerIED)), true(box_count(oplayerIED)).

goal(xplayer, 100) :- x_wins.

goal(xplayer, 0) :- \+ x_wins.

goal(oplayer, 100) :- o_wins.

goal(oplayer, 0) :- \+ o_wins.

gt(H, L) :- succ(L, H).
gt(H, L) :- succ(M, H), gt(M, L), succ(L, LP1).

succ(0, 1).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
succ(5, 6).



