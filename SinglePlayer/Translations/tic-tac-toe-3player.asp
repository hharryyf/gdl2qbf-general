mtdom(1..10).
role(xplayer).
role(oplayer).
role(zplayer).
true(cell(1, 1, b), 1).
true(cell(1, 2, b), 1).
true(cell(1, 3, b), 1).
true(cell(1, 4, b), 1).
true(cell(1, 5, b), 1).
true(cell(2, 1, b), 1).
true(cell(2, 2, b), 1).
true(cell(2, 3, b), 1).
true(cell(2, 4, b), 1).
true(cell(2, 5, b), 1).
true(cell(3, 1, b), 1).
true(cell(3, 2, b), 1).
true(cell(3, 3, b), 1).
true(cell(3, 4, b), 1).
true(cell(3, 5, b), 1).
true(cell(4, 1, b), 1).
true(cell(4, 2, b), 1).
true(cell(4, 3, b), 1).
true(cell(4, 4, b), 1).
true(cell(4, 5, b), 1).
true(cell(5, 1, b), 1).
true(cell(5, 2, b), 1).
true(cell(5, 3, b), 1).
true(cell(5, 4, b), 1).
true(cell(5, 5, b), 1).
true(control(xplayer), 1).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
true(cell(X45669, X45670, X45671), X45686 + 1) :- does(X45675, mark(X45669, X45670), X45686), sign(X45675, X45671), domdomain(7, X45671), domdomain(4, X45675), mtdom(X45686), domdomain(2, X45669), domdomain(2, X45670), domdomain(3, X45671).
true(cell(X45669, X45670, X45671), X45686 + 1) :- true(cell(X45669, X45670, X45671), X45686), X45671 != b, mtdom(X45686), domdomain(2, X45669), domdomain(2, X45670), domdomain(3, X45671).
true(cell(X45669, X45670, b), X45694 + 1) :- does(X45675, mark(X45678, X45679), X45694), true(cell(X45669, X45670, b), X45694), X45670 != X45679, domdomain(4, X45675), domdomain(2, X45678), domdomain(2, X45679), mtdom(X45694), domdomain(2, X45669), domdomain(2, X45670).
true(cell(X45669, X45670, b), X45694 + 1) :- does(X45675, mark(X45678, X45679), X45694), true(cell(X45669, X45670, b), X45694), X45669 != X45678, domdomain(4, X45675), domdomain(2, X45678), domdomain(2, X45679), mtdom(X45694), domdomain(2, X45669), domdomain(2, X45670).
true(control(zplayer), X45677 + 1) :- true(control(oplayer), X45677), mtdom(X45677).
true(control(oplayer), X45677 + 1) :- true(control(xplayer), X45677), mtdom(X45677).
true(control(xplayer), X45677 + 1) :- true(control(zplayer), X45677), mtdom(X45677).
row3(X45667, X45668, X45704) :- true(cell(X45667, X45675, X45668), X45704), succ(X45675, X45681), true(cell(X45667, X45681, X45668), X45704), succ(X45681, X45694), true(cell(X45667, X45694, X45668), X45704), domdomain(2, X45694), domdomain(8, X45681), domdomain(9, X45694), domdomain(2, X45681), domdomain(8, X45675), domdomain(9, X45681), domdomain(2, X45675), tdom(X45704), domdomain(2, X45667), domdomain(3, X45668).
column3(X45667, X45668, X45704) :- true(cell(X45674, X45667, X45668), X45704), succ(X45674, X45681), true(cell(X45681, X45667, X45668), X45704), succ(X45681, X45694), true(cell(X45694, X45667, X45668), X45704), domdomain(2, X45694), domdomain(8, X45681), domdomain(9, X45694), domdomain(2, X45681), domdomain(8, X45674), domdomain(9, X45681), domdomain(2, X45674), tdom(X45704), domdomain(2, X45667), domdomain(3, X45668).
diagonal3(X45667, X45713) :- true(cell(X45673, X45674, X45667), X45713), succ(X45673, X45680), succ(X45674, X45685), true(cell(X45680, X45685, X45667), X45713), succ(X45680, X45698), succ(X45685, X45703), true(cell(X45698, X45703, X45667), X45713), domdomain(2, X45698), domdomain(2, X45703), domdomain(8, X45685), domdomain(9, X45703), domdomain(8, X45680), domdomain(9, X45698), domdomain(2, X45680), domdomain(2, X45685), domdomain(8, X45674), domdomain(9, X45685), domdomain(8, X45673), domdomain(9, X45680), domdomain(2, X45673), domdomain(2, X45674), tdom(X45713), domdomain(3, X45667).
diagonal3(X45667, X45713) :- true(cell(X45673, X45674, X45667), X45713), succ(X45679, X45673), succ(X45674, X45685), true(cell(X45679, X45685, X45667), X45713), succ(X45697, X45679), succ(X45685, X45703), true(cell(X45697, X45703, X45667), X45713), domdomain(2, X45697), domdomain(2, X45703), domdomain(8, X45685), domdomain(9, X45703), domdomain(8, X45697), domdomain(9, X45679), domdomain(2, X45679), domdomain(2, X45685), domdomain(8, X45674), domdomain(9, X45685), domdomain(8, X45679), domdomain(9, X45673), domdomain(2, X45673), domdomain(2, X45674), tdom(X45713), domdomain(3, X45667).
line3(X45667, X45674) :- row3(X45671, X45667, X45674), domdomain(2, X45671), tdom(X45674), domdomain(3, X45667).
line3(X45667, X45674) :- column3(X45671, X45667, X45674), domdomain(2, X45671), tdom(X45674), domdomain(3, X45667).
line3(X45667, X45673) :- diagonal3(X45667, X45673), tdom(X45673), domdomain(3, X45667).
open(X45675) :- true(cell(X45671, X45672, b), X45675), domdomain(2, X45671), domdomain(2, X45672), tdom(X45675).
legal(X45667, mark(X45670, X45671), X45687) :- true(cell(X45670, X45671, b), X45687), true(control(X45667), X45687), tdom(X45687), domdomain(4, X45667), domdomain(2, X45670), domdomain(2, X45671).
legal(X45667, noop, X45682) :- role(X45667), not true(control(X45667), X45682), tdom(X45682), domdomain(4, X45667).
goal(X45667, 100, X45683) :- role(X45667), sign(X45667, X45677), line3(X45677, X45683), domdomain(3, X45677), domdomain(7, X45677), tdom(X45683), domdomain(4, X45667).
goal(X45667, 33, X45697) :- role(X45667), sign(X45667, X45677), not line3(x, X45697), not line3(o, X45697), not line3(z, X45697), domdomain(7, X45677), tdom(X45697), domdomain(4, X45667).
goal(X45667, 0, X45693) :- role(X45667), sign(X45667, X45677), sign(X45681, X45682), X45681 != X45667, line3(X45682, X45693), domdomain(3, X45682), domdomain(4, X45681), domdomain(7, X45682), domdomain(7, X45677), tdom(X45693), domdomain(4, X45667).
terminal(X45676) :- sign(X45669, X45670), line3(X45670, X45676), domdomain(3, X45670), domdomain(4, X45669), domdomain(7, X45670), tdom(X45676).
terminal(X45671) :- not open(X45671), tdom(X45671).
sign(xplayer, x).
sign(oplayer, o).
sign(zplayer, z).
index(X45667) :- succ(X45667, X45672), domdomain(8, X45667), domdomain(9, X45672), domdomain(2, X45667).
index(X45667) :- succ(X45671, X45667), domdomain(8, X45671), domdomain(9, X45667), domdomain(2, X45667).
base(cell(X45669, X45670, b)) :- index(X45669), index(X45670), domdomain(2, X45669), domdomain(2, X45670).
base(cell(X45669, X45670, X45671)) :- index(X45669), index(X45670), sign(X45683, X45671), domdomain(4, X45683), domdomain(7, X45671), domdomain(2, X45669), domdomain(2, X45670), domdomain(3, X45671).
base(control(X45669)) :- role(X45669), domdomain(4, X45669).
input(X45667, mark(X45670, X45671)) :- role(X45667), index(X45670), index(X45671), domdomain(4, X45667), domdomain(2, X45670), domdomain(2, X45671).
input(X45666, noop) :- role(X45666), domdomain(4, X45666).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(2, 5).
domdomain(3, b).
domdomain(3, o).
domdomain(3, x).
domdomain(3, z).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(4, zplayer).
domdomain(5, 0).
domdomain(5, 33).
domdomain(5, 100).
domdomain(6, mark).
domdomain(6, noop).
domdomain(7, o).
domdomain(7, x).
domdomain(7, z).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
domdomain(9, 5).
