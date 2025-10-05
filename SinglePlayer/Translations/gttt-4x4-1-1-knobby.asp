mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X41687, X41688, b)) :- index(X41687), index(X41688), domdomain(2, X41687), domdomain(2, X41688).
base(cell(X41687, X41688, x)) :- index(X41687), index(X41688), domdomain(2, X41687), domdomain(2, X41688).
base(cell(X41687, X41688, o)) :- index(X41687), index(X41688), domdomain(2, X41687), domdomain(2, X41688).
base(control(X41687)) :- role(X41687), domdomain(4, X41687).
input(X41685, mark(X41688, X41689)) :- index(X41688), index(X41689), role(X41685), domdomain(4, X41685), domdomain(2, X41688), domdomain(2, X41689).
input(X41685, noop) :- role(X41685), domdomain(4, X41685).
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
true(control(xplayer), 1).
true(cell(X41687, X41688, x), X41707 + 1) :- does(xplayer, mark(X41687, X41688), X41707), true(cell(X41687, X41688, b), X41707), mtdom(X41707), domdomain(2, X41687), domdomain(2, X41688).
true(cell(X41687, X41688, o), X41707 + 1) :- does(oplayer, mark(X41687, X41688), X41707), true(cell(X41687, X41688, b), X41707), mtdom(X41707), domdomain(2, X41687), domdomain(2, X41688).
true(cell(X41687, X41688, X41689), X41704 + 1) :- true(cell(X41687, X41688, X41689), X41704), X41689 != b, mtdom(X41704), domdomain(2, X41687), domdomain(2, X41688), domdomain(3, X41689).
true(cell(X41687, X41688, b), X41712 + 1) :- does(X41693, mark(X41696, X41697), X41712), true(cell(X41687, X41688, b), X41712), X41687 != X41696, domdomain(4, X41693), domdomain(2, X41696), domdomain(2, X41697), mtdom(X41712), domdomain(2, X41687), domdomain(2, X41688).
true(cell(X41687, X41688, b), X41712 + 1) :- does(X41693, mark(X41696, X41697), X41712), true(cell(X41687, X41688, b), X41712), X41688 != X41697, domdomain(4, X41693), domdomain(2, X41696), domdomain(2, X41697), mtdom(X41712), domdomain(2, X41687), domdomain(2, X41688).
true(control(xplayer), X41695 + 1) :- true(control(oplayer), X41695), mtdom(X41695).
true(control(oplayer), X41695 + 1) :- true(control(xplayer), X41695), mtdom(X41695).
open(X41693) :- true(cell(X41689, X41690, b), X41693), domdomain(2, X41689), domdomain(2, X41690), tdom(X41693).
legal(X41685, mark(X41688, X41689), X41705) :- true(cell(X41688, X41689, b), X41705), true(control(X41685), X41705), tdom(X41705), domdomain(4, X41685), domdomain(2, X41688), domdomain(2, X41689).
legal(xplayer, noop, X41694) :- true(control(oplayer), X41694), tdom(X41694).
legal(oplayer, noop, X41694) :- true(control(xplayer), X41694), tdom(X41694).
goal(xplayer, 100, X41692) :- line(x, X41692), tdom(X41692).
goal(xplayer, 50, X41704) :- not line(x, X41704), not line(o, X41704), not open(X41704), tdom(X41704).
goal(xplayer, 0, X41692) :- line(o, X41692), tdom(X41692).
goal(oplayer, 100, X41692) :- line(o, X41692), tdom(X41692).
goal(oplayer, 50, X41704) :- not line(x, X41704), not line(o, X41704), not open(X41704), tdom(X41704).
goal(oplayer, 0, X41692) :- line(x, X41692), tdom(X41692).
terminal(X41689) :- line(x, X41689), tdom(X41689).
terminal(X41689) :- line(o, X41689), tdom(X41689).
terminal(X41689) :- not open(X41689), tdom(X41689).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X41685, X41734) :- true(cell(X41691, X41692, X41685), X41734), true(cell(X41691, X41700, X41685), X41734), true(cell(X41691, X41708, X41685), X41734), true(cell(X41715, X41700, X41685), X41734), succ(X41692, X41700), succ(X41691, X41715), succ(X41700, X41708), domdomain(7, X41700), domdomain(8, X41708), domdomain(7, X41691), domdomain(8, X41715), domdomain(7, X41692), domdomain(8, X41700), domdomain(2, X41715), domdomain(2, X41708), domdomain(2, X41700), domdomain(2, X41691), domdomain(2, X41692), tdom(X41734), domdomain(3, X41685).
line(X41685, X41734) :- true(cell(X41691, X41692, X41685), X41734), true(cell(X41691, X41700, X41685), X41734), true(cell(X41691, X41708, X41685), X41734), true(cell(X41715, X41700, X41685), X41734), succ(X41692, X41700), succ(X41715, X41691), succ(X41700, X41708), domdomain(7, X41700), domdomain(8, X41708), domdomain(7, X41715), domdomain(8, X41691), domdomain(7, X41692), domdomain(8, X41700), domdomain(2, X41715), domdomain(2, X41708), domdomain(2, X41700), domdomain(2, X41691), domdomain(2, X41692), tdom(X41734), domdomain(3, X41685).
line(X41685, X41734) :- true(cell(X41691, X41692, X41685), X41734), true(cell(X41699, X41692, X41685), X41734), true(cell(X41707, X41692, X41685), X41734), true(cell(X41699, X41716, X41685), X41734), succ(X41691, X41699), succ(X41699, X41707), succ(X41692, X41716), domdomain(7, X41692), domdomain(8, X41716), domdomain(7, X41699), domdomain(8, X41707), domdomain(7, X41691), domdomain(8, X41699), domdomain(2, X41716), domdomain(2, X41707), domdomain(2, X41699), domdomain(2, X41691), domdomain(2, X41692), tdom(X41734), domdomain(3, X41685).
line(X41684, X41733) :- true(cell(X41690, X41691, X41684), X41733), true(cell(X41698, X41691, X41684), X41733), true(cell(X41706, X41691, X41684), X41733), true(cell(X41698, X41715, X41684), X41733), succ(X41690, X41698), succ(X41698, X41706), succ(X41715, X41691), domdomain(7, X41715), domdomain(8, X41691), domdomain(7, X41698), domdomain(8, X41706), domdomain(7, X41690), domdomain(8, X41698), domdomain(2, X41715), domdomain(2, X41706), domdomain(2, X41698), domdomain(2, X41690), domdomain(2, X41691), tdom(X41733), domdomain(3, X41684).
domdomain(1, cell).
domdomain(1, control).
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
domdomain(6, mark).
domdomain(6, noop).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
