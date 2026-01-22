mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X30444, X30445, x)) :- index(X30444), index(X30445), domdomain(2, X30444), domdomain(2, X30445).
base(cell(X30444, X30445, o)) :- index(X30444), index(X30445), domdomain(2, X30444), domdomain(2, X30445).
base(control(X30444)) :- role(X30444), domdomain(4, X30444).
input(X30442, mark(X30445, X30446)) :- index(X30445), index(X30446), role(X30442), domdomain(4, X30442), domdomain(2, X30445), domdomain(2, X30446).
input(X30442, noop) :- role(X30442), domdomain(4, X30442).
true(control(xplayer), 1).
true(cell(X30444, X30445, x), X30456 + 1) :- does(xplayer, mark(X30444, X30445), X30456), mtdom(X30456), domdomain(2, X30444), domdomain(2, X30445).
true(cell(X30444, X30445, o), X30456 + 1) :- does(oplayer, mark(X30444, X30445), X30456), mtdom(X30456), domdomain(2, X30444), domdomain(2, X30445).
true(cell(X30444, X30445, X30446), X30456 + 1) :- true(cell(X30444, X30445, X30446), X30456), mtdom(X30456), domdomain(2, X30444), domdomain(2, X30445), domdomain(3, X30446).
true(control(xplayer), X30452 + 1) :- true(control(oplayer), X30452), mtdom(X30452).
true(control(oplayer), X30452 + 1) :- true(control(xplayer), X30452), mtdom(X30452).
open(X30470) :- not true(cell(X30448, X30449, x), X30470), not true(cell(X30448, X30449, o), X30470), index(X30448), index(X30449), domdomain(2, X30448), domdomain(2, X30449), tdom(X30470).
legal(X30442, mark(X30445, X30446), X30482) :- not true(cell(X30445, X30446, x), X30482), not true(cell(X30445, X30446, o), X30482), true(control(X30442), X30482), index(X30445), index(X30446), tdom(X30482), domdomain(4, X30442), domdomain(2, X30445), domdomain(2, X30446).
legal(xplayer, noop, X30451) :- true(control(oplayer), X30451), tdom(X30451).
legal(oplayer, noop, X30451) :- true(control(xplayer), X30451), tdom(X30451).
goal(xplayer, 100, X30449) :- line(x, X30449), tdom(X30449).
goal(xplayer, 50, X30461) :- not line(x, X30461), not line(o, X30461), not open(X30461), tdom(X30461).
goal(xplayer, 0, X30449) :- line(o, X30449), tdom(X30449).
goal(oplayer, 100, X30449) :- line(o, X30449), tdom(X30449).
goal(oplayer, 50, X30461) :- not line(x, X30461), not line(o, X30461), not open(X30461), tdom(X30461).
goal(oplayer, 0, X30449) :- line(x, X30449), tdom(X30449).
terminal(X30446) :- line(x, X30446), tdom(X30446).
terminal(X30446) :- line(o, X30446), tdom(X30446).
terminal(X30446) :- not open(X30446), tdom(X30446).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X30442, X30491) :- true(cell(X30448, X30449, X30442), X30491), true(cell(X30448, X30457, X30442), X30491), true(cell(X30448, X30465, X30442), X30491), true(cell(X30448, X30473, X30442), X30491), succ(X30449, X30457), succ(X30457, X30465), succ(X30465, X30473), domdomain(8, X30465), domdomain(9, X30473), domdomain(8, X30457), domdomain(9, X30465), domdomain(8, X30449), domdomain(9, X30457), domdomain(2, X30473), domdomain(2, X30465), domdomain(2, X30457), domdomain(2, X30448), domdomain(2, X30449), tdom(X30491), domdomain(3, X30442).
line(X30441, X30490) :- true(cell(X30447, X30448, X30441), X30490), true(cell(X30455, X30448, X30441), X30490), true(cell(X30463, X30448, X30441), X30490), true(cell(X30471, X30448, X30441), X30490), succ(X30447, X30455), succ(X30455, X30463), succ(X30463, X30471), domdomain(8, X30463), domdomain(9, X30471), domdomain(8, X30455), domdomain(9, X30463), domdomain(8, X30447), domdomain(9, X30455), domdomain(2, X30471), domdomain(2, X30463), domdomain(2, X30455), domdomain(2, X30447), domdomain(2, X30448), tdom(X30490), domdomain(3, X30441).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, o).
domdomain(3, x).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 50).
domdomain(5, 100).
domdomain(6, control).
domdomain(7, mark).
domdomain(7, noop).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
