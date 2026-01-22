mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X48784, X48785, x)) :- index(X48784), index(X48785), domdomain(2, X48784), domdomain(2, X48785).
base(cell(X48784, X48785, o)) :- index(X48784), index(X48785), domdomain(2, X48784), domdomain(2, X48785).
base(control1(X48784)) :- role(X48784), domdomain(4, X48784).
base(control2(X48784)) :- role(X48784), domdomain(4, X48784).
input(X48782, mark(X48785, X48786)) :- index(X48785), index(X48786), role(X48782), domdomain(4, X48782), domdomain(2, X48785), domdomain(2, X48786).
input(X48782, noop) :- role(X48782), domdomain(4, X48782).
true(control1(xplayer), 1).
true(cell(X48784, X48785, x), X48796 + 1) :- does(xplayer, mark(X48784, X48785), X48796), mtdom(X48796), domdomain(2, X48784), domdomain(2, X48785).
true(cell(X48784, X48785, o), X48796 + 1) :- does(oplayer, mark(X48784, X48785), X48796), mtdom(X48796), domdomain(2, X48784), domdomain(2, X48785).
true(cell(X48784, X48785, X48786), X48796 + 1) :- true(cell(X48784, X48785, X48786), X48796), mtdom(X48796), domdomain(2, X48784), domdomain(2, X48785), domdomain(3, X48786).
true(control1(xplayer), X48792 + 1) :- true(control2(oplayer), X48792), mtdom(X48792).
true(control1(oplayer), X48792 + 1) :- true(control2(xplayer), X48792), mtdom(X48792).
true(control2(xplayer), X48792 + 1) :- true(control1(xplayer), X48792), mtdom(X48792).
true(control2(oplayer), X48792 + 1) :- true(control1(oplayer), X48792), mtdom(X48792).
open(X48810) :- not true(cell(X48788, X48789, x), X48810), not true(cell(X48788, X48789, o), X48810), index(X48788), index(X48789), domdomain(2, X48788), domdomain(2, X48789), tdom(X48810).
legal(X48782, mark(X48785, X48786), X48822) :- not true(cell(X48785, X48786, x), X48822), not true(cell(X48785, X48786, o), X48822), true(control1(X48782), X48822), index(X48785), index(X48786), tdom(X48822), domdomain(4, X48782), domdomain(2, X48785), domdomain(2, X48786).
legal(xplayer, noop, X48791) :- true(control1(oplayer), X48791), tdom(X48791).
legal(oplayer, noop, X48791) :- true(control1(xplayer), X48791), tdom(X48791).
legal(X48782, mark(X48785, X48786), X48822) :- not true(cell(X48785, X48786, x), X48822), not true(cell(X48785, X48786, o), X48822), true(control2(X48782), X48822), index(X48785), index(X48786), tdom(X48822), domdomain(4, X48782), domdomain(2, X48785), domdomain(2, X48786).
legal(xplayer, noop, X48791) :- true(control2(oplayer), X48791), tdom(X48791).
legal(oplayer, noop, X48791) :- true(control2(xplayer), X48791), tdom(X48791).
goal(xplayer, 100, X48789) :- line(x, X48789), tdom(X48789).
goal(xplayer, 50, X48801) :- not line(x, X48801), not line(o, X48801), not open(X48801), tdom(X48801).
goal(xplayer, 0, X48789) :- line(o, X48789), tdom(X48789).
goal(oplayer, 100, X48789) :- line(o, X48789), tdom(X48789).
goal(oplayer, 50, X48801) :- not line(x, X48801), not line(o, X48801), not open(X48801), tdom(X48801).
goal(oplayer, 0, X48789) :- line(x, X48789), tdom(X48789).
terminal(X48786) :- line(x, X48786), tdom(X48786).
terminal(X48786) :- line(o, X48786), tdom(X48786).
terminal(X48786) :- not open(X48786), tdom(X48786).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X48782, X48831) :- true(cell(X48788, X48789, X48782), X48831), true(cell(X48788, X48797, X48782), X48831), true(cell(X48788, X48805, X48782), X48831), true(cell(X48812, X48789, X48782), X48831), succ(X48789, X48797), succ(X48788, X48812), succ(X48797, X48805), domdomain(8, X48797), domdomain(9, X48805), domdomain(8, X48788), domdomain(9, X48812), domdomain(8, X48789), domdomain(9, X48797), domdomain(2, X48812), domdomain(2, X48805), domdomain(2, X48797), domdomain(2, X48788), domdomain(2, X48789), tdom(X48831), domdomain(3, X48782).
line(X48782, X48831) :- true(cell(X48788, X48789, X48782), X48831), true(cell(X48788, X48797, X48782), X48831), true(cell(X48788, X48805, X48782), X48831), true(cell(X48812, X48789, X48782), X48831), succ(X48789, X48797), succ(X48812, X48788), succ(X48797, X48805), domdomain(8, X48797), domdomain(9, X48805), domdomain(8, X48812), domdomain(9, X48788), domdomain(8, X48789), domdomain(9, X48797), domdomain(2, X48812), domdomain(2, X48805), domdomain(2, X48797), domdomain(2, X48788), domdomain(2, X48789), tdom(X48831), domdomain(3, X48782).
line(X48782, X48831) :- true(cell(X48788, X48789, X48782), X48831), true(cell(X48788, X48797, X48782), X48831), true(cell(X48788, X48805, X48782), X48831), true(cell(X48812, X48805, X48782), X48831), succ(X48789, X48797), succ(X48788, X48812), succ(X48797, X48805), domdomain(8, X48797), domdomain(9, X48805), domdomain(8, X48788), domdomain(9, X48812), domdomain(8, X48789), domdomain(9, X48797), domdomain(2, X48812), domdomain(2, X48805), domdomain(2, X48797), domdomain(2, X48788), domdomain(2, X48789), tdom(X48831), domdomain(3, X48782).
line(X48782, X48831) :- true(cell(X48788, X48789, X48782), X48831), true(cell(X48788, X48797, X48782), X48831), true(cell(X48788, X48805, X48782), X48831), true(cell(X48812, X48805, X48782), X48831), succ(X48789, X48797), succ(X48812, X48788), succ(X48797, X48805), domdomain(8, X48797), domdomain(9, X48805), domdomain(8, X48812), domdomain(9, X48788), domdomain(8, X48789), domdomain(9, X48797), domdomain(2, X48812), domdomain(2, X48805), domdomain(2, X48797), domdomain(2, X48788), domdomain(2, X48789), tdom(X48831), domdomain(3, X48782).
line(X48782, X48831) :- true(cell(X48788, X48789, X48782), X48831), true(cell(X48796, X48789, X48782), X48831), true(cell(X48804, X48789, X48782), X48831), true(cell(X48788, X48813, X48782), X48831), succ(X48789, X48813), succ(X48788, X48796), succ(X48796, X48804), domdomain(8, X48796), domdomain(9, X48804), domdomain(8, X48788), domdomain(9, X48796), domdomain(8, X48789), domdomain(9, X48813), domdomain(2, X48813), domdomain(2, X48804), domdomain(2, X48796), domdomain(2, X48788), domdomain(2, X48789), tdom(X48831), domdomain(3, X48782).
line(X48782, X48831) :- true(cell(X48788, X48789, X48782), X48831), true(cell(X48796, X48789, X48782), X48831), true(cell(X48804, X48789, X48782), X48831), true(cell(X48788, X48813, X48782), X48831), succ(X48813, X48789), succ(X48788, X48796), succ(X48796, X48804), domdomain(8, X48796), domdomain(9, X48804), domdomain(8, X48788), domdomain(9, X48796), domdomain(8, X48813), domdomain(9, X48789), domdomain(2, X48813), domdomain(2, X48804), domdomain(2, X48796), domdomain(2, X48788), domdomain(2, X48789), tdom(X48831), domdomain(3, X48782).
line(X48782, X48831) :- true(cell(X48788, X48789, X48782), X48831), true(cell(X48796, X48789, X48782), X48831), true(cell(X48804, X48789, X48782), X48831), true(cell(X48804, X48813, X48782), X48831), succ(X48789, X48813), succ(X48788, X48796), succ(X48796, X48804), domdomain(8, X48796), domdomain(9, X48804), domdomain(8, X48788), domdomain(9, X48796), domdomain(8, X48789), domdomain(9, X48813), domdomain(2, X48813), domdomain(2, X48804), domdomain(2, X48796), domdomain(2, X48788), domdomain(2, X48789), tdom(X48831), domdomain(3, X48782).
line(X48781, X48830) :- true(cell(X48787, X48788, X48781), X48830), true(cell(X48795, X48788, X48781), X48830), true(cell(X48803, X48788, X48781), X48830), true(cell(X48803, X48812, X48781), X48830), succ(X48812, X48788), succ(X48787, X48795), succ(X48795, X48803), domdomain(8, X48795), domdomain(9, X48803), domdomain(8, X48787), domdomain(9, X48795), domdomain(8, X48812), domdomain(9, X48788), domdomain(2, X48812), domdomain(2, X48803), domdomain(2, X48795), domdomain(2, X48787), domdomain(2, X48788), tdom(X48830), domdomain(3, X48781).
domdomain(1, cell).
domdomain(1, control1).
domdomain(1, control2).
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
domdomain(6, control1).
domdomain(7, mark).
domdomain(7, noop).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
