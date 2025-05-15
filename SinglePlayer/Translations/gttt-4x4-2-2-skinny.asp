mtdom(1..14).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X41725, X41726, b)) :- index(X41725), index(X41726), domdomain(2, X41725), domdomain(2, X41726).
base(cell(X41725, X41726, x)) :- index(X41725), index(X41726), domdomain(2, X41725), domdomain(2, X41726).
base(cell(X41725, X41726, o)) :- index(X41725), index(X41726), domdomain(2, X41725), domdomain(2, X41726).
base(control1(X41725)) :- role(X41725), domdomain(4, X41725).
base(control2(X41725)) :- role(X41725), domdomain(4, X41725).
input(X41723, mark(X41726, X41727)) :- index(X41726), index(X41727), role(X41723), domdomain(4, X41723), domdomain(2, X41726), domdomain(2, X41727).
input(X41723, noop) :- role(X41723), domdomain(4, X41723).
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
true(cell(X41725, X41726, x), X41745 + 1) :- does(xplayer, mark(X41725, X41726), X41745), true(cell(X41725, X41726, b), X41745), mtdom(X41745), domdomain(2, X41725), domdomain(2, X41726).
true(cell(X41725, X41726, o), X41745 + 1) :- does(oplayer, mark(X41725, X41726), X41745), true(cell(X41725, X41726, b), X41745), mtdom(X41745), domdomain(2, X41725), domdomain(2, X41726).
true(cell(X41725, X41726, X41727), X41742 + 1) :- true(cell(X41725, X41726, X41727), X41742), X41727 != b, mtdom(X41742), domdomain(2, X41725), domdomain(2, X41726), domdomain(3, X41727).
true(cell(X41725, X41726, b), X41750 + 1) :- does(X41731, mark(X41734, X41735), X41750), true(cell(X41725, X41726, b), X41750), X41725 != X41734, domdomain(4, X41731), domdomain(2, X41734), domdomain(2, X41735), mtdom(X41750), domdomain(2, X41725), domdomain(2, X41726).
true(cell(X41725, X41726, b), X41750 + 1) :- does(X41731, mark(X41734, X41735), X41750), true(cell(X41725, X41726, b), X41750), X41726 != X41735, domdomain(4, X41731), domdomain(2, X41734), domdomain(2, X41735), mtdom(X41750), domdomain(2, X41725), domdomain(2, X41726).
true(control1(xplayer), X41733 + 1) :- true(control2(oplayer), X41733), mtdom(X41733).
true(control1(oplayer), X41733 + 1) :- true(control2(xplayer), X41733), mtdom(X41733).
true(control2(xplayer), X41733 + 1) :- true(control1(xplayer), X41733), mtdom(X41733).
true(control2(oplayer), X41733 + 1) :- true(control1(oplayer), X41733), mtdom(X41733).
open(X41731) :- true(cell(X41727, X41728, b), X41731), domdomain(2, X41727), domdomain(2, X41728), tdom(X41731).
legal(X41723, mark(X41726, X41727), X41743) :- true(cell(X41726, X41727, b), X41743), true(control1(X41723), X41743), tdom(X41743), domdomain(4, X41723), domdomain(2, X41726), domdomain(2, X41727).
legal(xplayer, noop, X41732) :- true(control1(oplayer), X41732), tdom(X41732).
legal(oplayer, noop, X41732) :- true(control1(xplayer), X41732), tdom(X41732).
legal(X41723, mark(X41726, X41727), X41743) :- true(cell(X41726, X41727, b), X41743), true(control2(X41723), X41743), tdom(X41743), domdomain(4, X41723), domdomain(2, X41726), domdomain(2, X41727).
legal(xplayer, noop, X41732) :- true(control2(oplayer), X41732), tdom(X41732).
legal(oplayer, noop, X41732) :- true(control2(xplayer), X41732), tdom(X41732).
goal(xplayer, 100, X41730) :- line(x, X41730), tdom(X41730).
goal(xplayer, 50, X41742) :- not line(x, X41742), not line(o, X41742), not open(X41742), tdom(X41742).
goal(xplayer, 0, X41730) :- line(o, X41730), tdom(X41730).
goal(oplayer, 100, X41730) :- line(o, X41730), tdom(X41730).
goal(oplayer, 50, X41742) :- not line(x, X41742), not line(o, X41742), not open(X41742), tdom(X41742).
goal(oplayer, 0, X41730) :- line(x, X41730), tdom(X41730).
terminal(X41727) :- line(x, X41727), tdom(X41727).
terminal(X41727) :- line(o, X41727), tdom(X41727).
terminal(X41727) :- not open(X41727), tdom(X41727).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X41723, X41772) :- true(cell(X41729, X41730, X41723), X41772), true(cell(X41729, X41738, X41723), X41772), true(cell(X41729, X41746, X41723), X41772), true(cell(X41729, X41754, X41723), X41772), succ(X41730, X41738), succ(X41738, X41746), succ(X41746, X41754), domdomain(8, X41746), domdomain(9, X41754), domdomain(8, X41738), domdomain(9, X41746), domdomain(8, X41730), domdomain(9, X41738), domdomain(2, X41754), domdomain(2, X41746), domdomain(2, X41738), domdomain(2, X41729), domdomain(2, X41730), tdom(X41772), domdomain(3, X41723).
line(X41722, X41771) :- true(cell(X41728, X41729, X41722), X41771), true(cell(X41736, X41729, X41722), X41771), true(cell(X41744, X41729, X41722), X41771), true(cell(X41752, X41729, X41722), X41771), succ(X41728, X41736), succ(X41736, X41744), succ(X41744, X41752), domdomain(8, X41744), domdomain(9, X41752), domdomain(8, X41736), domdomain(9, X41744), domdomain(8, X41728), domdomain(9, X41736), domdomain(2, X41752), domdomain(2, X41744), domdomain(2, X41736), domdomain(2, X41728), domdomain(2, X41729), tdom(X41771), domdomain(3, X41722).
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
