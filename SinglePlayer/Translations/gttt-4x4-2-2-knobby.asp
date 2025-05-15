mtdom(1..6).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X46178, X46179, b)) :- index(X46178), index(X46179), domdomain(2, X46178), domdomain(2, X46179).
base(cell(X46178, X46179, x)) :- index(X46178), index(X46179), domdomain(2, X46178), domdomain(2, X46179).
base(cell(X46178, X46179, o)) :- index(X46178), index(X46179), domdomain(2, X46178), domdomain(2, X46179).
base(control1(X46178)) :- role(X46178), domdomain(4, X46178).
base(control2(X46178)) :- role(X46178), domdomain(4, X46178).
input(X46176, mark(X46179, X46180)) :- index(X46179), index(X46180), role(X46176), domdomain(4, X46176), domdomain(2, X46179), domdomain(2, X46180).
input(X46176, noop) :- role(X46176), domdomain(4, X46176).
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
true(cell(X46178, X46179, x), X46198 + 1) :- does(xplayer, mark(X46178, X46179), X46198), true(cell(X46178, X46179, b), X46198), mtdom(X46198), domdomain(2, X46178), domdomain(2, X46179).
true(cell(X46178, X46179, o), X46198 + 1) :- does(oplayer, mark(X46178, X46179), X46198), true(cell(X46178, X46179, b), X46198), mtdom(X46198), domdomain(2, X46178), domdomain(2, X46179).
true(cell(X46178, X46179, X46180), X46195 + 1) :- true(cell(X46178, X46179, X46180), X46195), X46180 != b, mtdom(X46195), domdomain(2, X46178), domdomain(2, X46179), domdomain(3, X46180).
true(cell(X46178, X46179, b), X46203 + 1) :- does(X46184, mark(X46187, X46188), X46203), true(cell(X46178, X46179, b), X46203), X46178 != X46187, domdomain(4, X46184), domdomain(2, X46187), domdomain(2, X46188), mtdom(X46203), domdomain(2, X46178), domdomain(2, X46179).
true(cell(X46178, X46179, b), X46203 + 1) :- does(X46184, mark(X46187, X46188), X46203), true(cell(X46178, X46179, b), X46203), X46179 != X46188, domdomain(4, X46184), domdomain(2, X46187), domdomain(2, X46188), mtdom(X46203), domdomain(2, X46178), domdomain(2, X46179).
true(control1(xplayer), X46186 + 1) :- true(control2(oplayer), X46186), mtdom(X46186).
true(control1(oplayer), X46186 + 1) :- true(control2(xplayer), X46186), mtdom(X46186).
true(control2(xplayer), X46186 + 1) :- true(control1(xplayer), X46186), mtdom(X46186).
true(control2(oplayer), X46186 + 1) :- true(control1(oplayer), X46186), mtdom(X46186).
open(X46184) :- true(cell(X46180, X46181, b), X46184), domdomain(2, X46180), domdomain(2, X46181), tdom(X46184).
legal(X46176, mark(X46179, X46180), X46196) :- true(cell(X46179, X46180, b), X46196), true(control1(X46176), X46196), tdom(X46196), domdomain(4, X46176), domdomain(2, X46179), domdomain(2, X46180).
legal(xplayer, noop, X46185) :- true(control1(oplayer), X46185), tdom(X46185).
legal(oplayer, noop, X46185) :- true(control1(xplayer), X46185), tdom(X46185).
legal(X46176, mark(X46179, X46180), X46196) :- true(cell(X46179, X46180, b), X46196), true(control2(X46176), X46196), tdom(X46196), domdomain(4, X46176), domdomain(2, X46179), domdomain(2, X46180).
legal(xplayer, noop, X46185) :- true(control2(oplayer), X46185), tdom(X46185).
legal(oplayer, noop, X46185) :- true(control2(xplayer), X46185), tdom(X46185).
goal(xplayer, 100, X46183) :- line(x, X46183), tdom(X46183).
goal(xplayer, 50, X46195) :- not line(x, X46195), not line(o, X46195), not open(X46195), tdom(X46195).
goal(xplayer, 0, X46183) :- line(o, X46183), tdom(X46183).
goal(oplayer, 100, X46183) :- line(o, X46183), tdom(X46183).
goal(oplayer, 50, X46195) :- not line(x, X46195), not line(o, X46195), not open(X46195), tdom(X46195).
goal(oplayer, 0, X46183) :- line(x, X46183), tdom(X46183).
terminal(X46180) :- line(x, X46180), tdom(X46180).
terminal(X46180) :- line(o, X46180), tdom(X46180).
terminal(X46180) :- not open(X46180), tdom(X46180).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X46176, X46225) :- true(cell(X46182, X46183, X46176), X46225), true(cell(X46182, X46191, X46176), X46225), true(cell(X46182, X46199, X46176), X46225), true(cell(X46206, X46191, X46176), X46225), succ(X46183, X46191), succ(X46182, X46206), succ(X46191, X46199), domdomain(8, X46191), domdomain(9, X46199), domdomain(8, X46182), domdomain(9, X46206), domdomain(8, X46183), domdomain(9, X46191), domdomain(2, X46206), domdomain(2, X46199), domdomain(2, X46191), domdomain(2, X46182), domdomain(2, X46183), tdom(X46225), domdomain(3, X46176).
line(X46176, X46225) :- true(cell(X46182, X46183, X46176), X46225), true(cell(X46182, X46191, X46176), X46225), true(cell(X46182, X46199, X46176), X46225), true(cell(X46206, X46191, X46176), X46225), succ(X46183, X46191), succ(X46206, X46182), succ(X46191, X46199), domdomain(8, X46191), domdomain(9, X46199), domdomain(8, X46206), domdomain(9, X46182), domdomain(8, X46183), domdomain(9, X46191), domdomain(2, X46206), domdomain(2, X46199), domdomain(2, X46191), domdomain(2, X46182), domdomain(2, X46183), tdom(X46225), domdomain(3, X46176).
line(X46176, X46225) :- true(cell(X46182, X46183, X46176), X46225), true(cell(X46190, X46183, X46176), X46225), true(cell(X46198, X46183, X46176), X46225), true(cell(X46190, X46207, X46176), X46225), succ(X46182, X46190), succ(X46190, X46198), succ(X46183, X46207), domdomain(8, X46183), domdomain(9, X46207), domdomain(8, X46190), domdomain(9, X46198), domdomain(8, X46182), domdomain(9, X46190), domdomain(2, X46207), domdomain(2, X46198), domdomain(2, X46190), domdomain(2, X46182), domdomain(2, X46183), tdom(X46225), domdomain(3, X46176).
line(X46175, X46224) :- true(cell(X46181, X46182, X46175), X46224), true(cell(X46189, X46182, X46175), X46224), true(cell(X46197, X46182, X46175), X46224), true(cell(X46189, X46206, X46175), X46224), succ(X46181, X46189), succ(X46189, X46197), succ(X46206, X46182), domdomain(8, X46206), domdomain(9, X46182), domdomain(8, X46189), domdomain(9, X46197), domdomain(8, X46181), domdomain(9, X46189), domdomain(2, X46206), domdomain(2, X46197), domdomain(2, X46189), domdomain(2, X46181), domdomain(2, X46182), tdom(X46224), domdomain(3, X46175).
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
