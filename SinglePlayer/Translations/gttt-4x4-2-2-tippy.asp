mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X46180, X46181, b)) :- index(X46180), index(X46181), domdomain(2, X46180), domdomain(2, X46181).
base(cell(X46180, X46181, x)) :- index(X46180), index(X46181), domdomain(2, X46180), domdomain(2, X46181).
base(cell(X46180, X46181, o)) :- index(X46180), index(X46181), domdomain(2, X46180), domdomain(2, X46181).
base(control1(X46180)) :- role(X46180), domdomain(4, X46180).
base(control2(X46180)) :- role(X46180), domdomain(4, X46180).
input(X46178, mark(X46181, X46182)) :- index(X46181), index(X46182), role(X46178), domdomain(4, X46178), domdomain(2, X46181), domdomain(2, X46182).
input(X46178, noop) :- role(X46178), domdomain(4, X46178).
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
true(cell(X46180, X46181, x), X46200 + 1) :- does(xplayer, mark(X46180, X46181), X46200), true(cell(X46180, X46181, b), X46200), mtdom(X46200), domdomain(2, X46180), domdomain(2, X46181).
true(cell(X46180, X46181, o), X46200 + 1) :- does(oplayer, mark(X46180, X46181), X46200), true(cell(X46180, X46181, b), X46200), mtdom(X46200), domdomain(2, X46180), domdomain(2, X46181).
true(cell(X46180, X46181, X46182), X46197 + 1) :- true(cell(X46180, X46181, X46182), X46197), X46182 != b, mtdom(X46197), domdomain(2, X46180), domdomain(2, X46181), domdomain(3, X46182).
true(cell(X46180, X46181, b), X46205 + 1) :- does(X46186, mark(X46189, X46190), X46205), true(cell(X46180, X46181, b), X46205), X46180 != X46189, domdomain(4, X46186), domdomain(2, X46189), domdomain(2, X46190), mtdom(X46205), domdomain(2, X46180), domdomain(2, X46181).
true(cell(X46180, X46181, b), X46205 + 1) :- does(X46186, mark(X46189, X46190), X46205), true(cell(X46180, X46181, b), X46205), X46181 != X46190, domdomain(4, X46186), domdomain(2, X46189), domdomain(2, X46190), mtdom(X46205), domdomain(2, X46180), domdomain(2, X46181).
true(control1(xplayer), X46188 + 1) :- true(control2(oplayer), X46188), mtdom(X46188).
true(control1(oplayer), X46188 + 1) :- true(control2(xplayer), X46188), mtdom(X46188).
true(control2(xplayer), X46188 + 1) :- true(control1(xplayer), X46188), mtdom(X46188).
true(control2(oplayer), X46188 + 1) :- true(control1(oplayer), X46188), mtdom(X46188).
open(X46186) :- true(cell(X46182, X46183, b), X46186), domdomain(2, X46182), domdomain(2, X46183), tdom(X46186).
legal(X46178, mark(X46181, X46182), X46198) :- true(cell(X46181, X46182, b), X46198), true(control1(X46178), X46198), tdom(X46198), domdomain(4, X46178), domdomain(2, X46181), domdomain(2, X46182).
legal(xplayer, noop, X46187) :- true(control1(oplayer), X46187), tdom(X46187).
legal(oplayer, noop, X46187) :- true(control1(xplayer), X46187), tdom(X46187).
legal(X46178, mark(X46181, X46182), X46198) :- true(cell(X46181, X46182, b), X46198), true(control2(X46178), X46198), tdom(X46198), domdomain(4, X46178), domdomain(2, X46181), domdomain(2, X46182).
legal(xplayer, noop, X46187) :- true(control2(oplayer), X46187), tdom(X46187).
legal(oplayer, noop, X46187) :- true(control2(xplayer), X46187), tdom(X46187).
goal(xplayer, 100, X46185) :- line(x, X46185), tdom(X46185).
goal(xplayer, 50, X46197) :- not line(x, X46197), not line(o, X46197), not open(X46197), tdom(X46197).
goal(xplayer, 0, X46185) :- line(o, X46185), tdom(X46185).
goal(oplayer, 100, X46185) :- line(o, X46185), tdom(X46185).
goal(oplayer, 50, X46197) :- not line(x, X46197), not line(o, X46197), not open(X46197), tdom(X46197).
goal(oplayer, 0, X46185) :- line(x, X46185), tdom(X46185).
terminal(X46182) :- line(x, X46182), tdom(X46182).
terminal(X46182) :- line(o, X46182), tdom(X46182).
terminal(X46182) :- not open(X46182), tdom(X46182).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X46178, X46227) :- true(cell(X46184, X46185, X46178), X46227), true(cell(X46184, X46193, X46178), X46227), true(cell(X46200, X46193, X46178), X46227), true(cell(X46200, X46209, X46178), X46227), succ(X46185, X46193), succ(X46184, X46200), succ(X46193, X46209), domdomain(8, X46193), domdomain(9, X46209), domdomain(8, X46184), domdomain(9, X46200), domdomain(8, X46185), domdomain(9, X46193), domdomain(2, X46209), domdomain(2, X46200), domdomain(2, X46193), domdomain(2, X46184), domdomain(2, X46185), tdom(X46227), domdomain(3, X46178).
line(X46178, X46227) :- true(cell(X46184, X46185, X46178), X46227), true(cell(X46184, X46193, X46178), X46227), true(cell(X46200, X46201, X46178), X46227), true(cell(X46200, X46185, X46178), X46227), succ(X46201, X46185), succ(X46184, X46200), succ(X46185, X46193), domdomain(8, X46185), domdomain(9, X46193), domdomain(8, X46184), domdomain(9, X46200), domdomain(8, X46201), domdomain(9, X46185), domdomain(2, X46200), domdomain(2, X46201), domdomain(2, X46193), domdomain(2, X46184), domdomain(2, X46185), tdom(X46227), domdomain(3, X46178).
line(X46178, X46227) :- true(cell(X46184, X46185, X46178), X46227), true(cell(X46192, X46185, X46178), X46227), true(cell(X46192, X46201, X46178), X46227), true(cell(X46208, X46201, X46178), X46227), succ(X46185, X46201), succ(X46184, X46192), succ(X46192, X46208), domdomain(8, X46192), domdomain(9, X46208), domdomain(8, X46184), domdomain(9, X46192), domdomain(8, X46185), domdomain(9, X46201), domdomain(2, X46208), domdomain(2, X46201), domdomain(2, X46192), domdomain(2, X46184), domdomain(2, X46185), tdom(X46227), domdomain(3, X46178).
line(X46177, X46226) :- true(cell(X46183, X46184, X46177), X46226), true(cell(X46191, X46192, X46177), X46226), true(cell(X46191, X46184, X46177), X46226), true(cell(X46207, X46192, X46177), X46226), succ(X46192, X46184), succ(X46183, X46191), succ(X46191, X46207), domdomain(8, X46191), domdomain(9, X46207), domdomain(8, X46183), domdomain(9, X46191), domdomain(8, X46192), domdomain(9, X46184), domdomain(2, X46207), domdomain(2, X46191), domdomain(2, X46192), domdomain(2, X46183), domdomain(2, X46184), tdom(X46226), domdomain(3, X46177).
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
