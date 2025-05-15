mtdom(1..14).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X39414, X39415, b)) :- index(X39414), index(X39415), domdomain(2, X39414), domdomain(2, X39415).
base(cell(X39414, X39415, x)) :- index(X39414), index(X39415), domdomain(2, X39414), domdomain(2, X39415).
base(cell(X39414, X39415, o)) :- index(X39414), index(X39415), domdomain(2, X39414), domdomain(2, X39415).
base(control1(X39414)) :- role(X39414), domdomain(4, X39414).
base(control2(X39414)) :- role(X39414), domdomain(4, X39414).
input(X39412, mark(X39415, X39416)) :- index(X39415), index(X39416), role(X39412), domdomain(4, X39412), domdomain(2, X39415), domdomain(2, X39416).
input(X39412, noop) :- role(X39412), domdomain(4, X39412).
true(cell(1, 1, b), 1).
true(cell(1, 2, b), 1).
true(cell(1, 3, b), 1).
true(cell(1, 4, b), 1).
true(cell(2, 1, b), 1).
true(cell(2, 2, b), 1).
true(cell(2, 3, b), 1).
true(cell(2, 4, b), 1).
true(cell(3, 1, b), 1).
true(cell(3, 2, b), 1).
true(cell(3, 3, b), 1).
true(cell(3, 4, b), 1).
true(cell(4, 1, b), 1).
true(cell(4, 2, b), 1).
true(cell(4, 3, b), 1).
true(cell(4, 4, b), 1).
true(control1(xplayer), 1).
true(cell(X39414, X39415, x), X39434 + 1) :- does(xplayer, mark(X39414, X39415), X39434), true(cell(X39414, X39415, b), X39434), mtdom(X39434), domdomain(2, X39414), domdomain(2, X39415).
true(cell(X39414, X39415, o), X39434 + 1) :- does(oplayer, mark(X39414, X39415), X39434), true(cell(X39414, X39415, b), X39434), mtdom(X39434), domdomain(2, X39414), domdomain(2, X39415).
true(cell(X39414, X39415, X39416), X39431 + 1) :- true(cell(X39414, X39415, X39416), X39431), X39416 != b, mtdom(X39431), domdomain(2, X39414), domdomain(2, X39415), domdomain(3, X39416).
true(cell(X39414, X39415, b), X39439 + 1) :- does(X39420, mark(X39423, X39424), X39439), true(cell(X39414, X39415, b), X39439), X39414 != X39423, domdomain(4, X39420), domdomain(2, X39423), domdomain(2, X39424), mtdom(X39439), domdomain(2, X39414), domdomain(2, X39415).
true(cell(X39414, X39415, b), X39439 + 1) :- does(X39420, mark(X39423, X39424), X39439), true(cell(X39414, X39415, b), X39439), X39415 != X39424, domdomain(4, X39420), domdomain(2, X39423), domdomain(2, X39424), mtdom(X39439), domdomain(2, X39414), domdomain(2, X39415).
true(control1(xplayer), X39422 + 1) :- true(control2(oplayer), X39422), mtdom(X39422).
true(control1(oplayer), X39422 + 1) :- true(control2(xplayer), X39422), mtdom(X39422).
true(control2(xplayer), X39422 + 1) :- true(control1(xplayer), X39422), mtdom(X39422).
true(control2(oplayer), X39422 + 1) :- true(control1(oplayer), X39422), mtdom(X39422).
open(X39420) :- true(cell(X39416, X39417, b), X39420), domdomain(2, X39416), domdomain(2, X39417), tdom(X39420).
legal(X39412, mark(X39415, X39416), X39432) :- true(cell(X39415, X39416, b), X39432), true(control1(X39412), X39432), tdom(X39432), domdomain(4, X39412), domdomain(2, X39415), domdomain(2, X39416).
legal(xplayer, noop, X39421) :- true(control1(oplayer), X39421), tdom(X39421).
legal(oplayer, noop, X39421) :- true(control1(xplayer), X39421), tdom(X39421).
legal(X39412, mark(X39415, X39416), X39432) :- true(cell(X39415, X39416, b), X39432), true(control2(X39412), X39432), tdom(X39432), domdomain(4, X39412), domdomain(2, X39415), domdomain(2, X39416).
legal(xplayer, noop, X39421) :- true(control2(oplayer), X39421), tdom(X39421).
legal(oplayer, noop, X39421) :- true(control2(xplayer), X39421), tdom(X39421).
goal(xplayer, 100, X39419) :- line(x, X39419), tdom(X39419).
goal(xplayer, 50, X39431) :- not line(x, X39431), not line(o, X39431), not open(X39431), tdom(X39431).
goal(xplayer, 0, X39419) :- line(o, X39419), tdom(X39419).
goal(oplayer, 100, X39419) :- line(o, X39419), tdom(X39419).
goal(oplayer, 50, X39431) :- not line(x, X39431), not line(o, X39431), not open(X39431), tdom(X39431).
goal(oplayer, 0, X39419) :- line(x, X39419), tdom(X39419).
terminal(X39416) :- line(x, X39416), tdom(X39416).
terminal(X39416) :- line(o, X39416), tdom(X39416).
terminal(X39416) :- not open(X39416), tdom(X39416).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X39411, X39455) :- true(cell(X39417, X39418, X39411), X39455), true(cell(X39417, X39426, X39411), X39455), true(cell(X39433, X39418, X39411), X39455), true(cell(X39433, X39426, X39411), X39455), succ(X39417, X39433), succ(X39418, X39426), domdomain(8, X39418), domdomain(9, X39426), domdomain(8, X39417), domdomain(9, X39433), domdomain(2, X39433), domdomain(2, X39426), domdomain(2, X39417), domdomain(2, X39418), tdom(X39455), domdomain(3, X39411).
domdomain(1, cell).
domdomain(1, control1).
domdomain(1, control2).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, b).
domdomain(3, o).
domdomain(3, x).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 50).
domdomain(5, 100).
domdomain(6, cell).
domdomain(6, control1).
domdomain(7, mark).
domdomain(7, noop).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
