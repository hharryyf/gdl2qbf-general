mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X43660, X43661, x)) :- index(X43660), index(X43661), domdomain(2, X43660), domdomain(2, X43661).
base(cell(X43660, X43661, o)) :- index(X43660), index(X43661), domdomain(2, X43660), domdomain(2, X43661).
base(control(X43660)) :- role(X43660), domdomain(4, X43660).
input(X43658, mark(X43661, X43662)) :- index(X43661), index(X43662), role(X43658), domdomain(4, X43658), domdomain(2, X43661), domdomain(2, X43662).
input(X43658, noop) :- role(X43658), domdomain(4, X43658).
true(control(xplayer), 1).
true(cell(X43660, X43661, x), X43672 + 1) :- does(xplayer, mark(X43660, X43661), X43672), mtdom(X43672), domdomain(2, X43660), domdomain(2, X43661).
true(cell(X43660, X43661, o), X43672 + 1) :- does(oplayer, mark(X43660, X43661), X43672), mtdom(X43672), domdomain(2, X43660), domdomain(2, X43661).
true(cell(X43660, X43661, X43662), X43672 + 1) :- true(cell(X43660, X43661, X43662), X43672), mtdom(X43672), domdomain(2, X43660), domdomain(2, X43661), domdomain(3, X43662).
true(control(xplayer), X43668 + 1) :- true(control(oplayer), X43668), mtdom(X43668).
true(control(oplayer), X43668 + 1) :- true(control(xplayer), X43668), mtdom(X43668).
open(X43686) :- not true(cell(X43664, X43665, x), X43686), not true(cell(X43664, X43665, o), X43686), index(X43664), index(X43665), domdomain(2, X43664), domdomain(2, X43665), tdom(X43686).
legal(X43658, mark(X43661, X43662), X43698) :- not true(cell(X43661, X43662, x), X43698), not true(cell(X43661, X43662, o), X43698), true(control(X43658), X43698), index(X43661), index(X43662), tdom(X43698), domdomain(4, X43658), domdomain(2, X43661), domdomain(2, X43662).
legal(xplayer, noop, X43667) :- true(control(oplayer), X43667), tdom(X43667).
legal(oplayer, noop, X43667) :- true(control(xplayer), X43667), tdom(X43667).
goal(xplayer, 100, X43665) :- line(x, X43665), tdom(X43665).
goal(xplayer, 50, X43677) :- not line(x, X43677), not line(o, X43677), not open(X43677), tdom(X43677).
goal(xplayer, 0, X43665) :- line(o, X43665), tdom(X43665).
goal(oplayer, 100, X43665) :- line(o, X43665), tdom(X43665).
goal(oplayer, 50, X43677) :- not line(x, X43677), not line(o, X43677), not open(X43677), tdom(X43677).
goal(oplayer, 0, X43665) :- line(x, X43665), tdom(X43665).
terminal(X43662) :- line(x, X43662), tdom(X43662).
terminal(X43662) :- line(o, X43662), tdom(X43662).
terminal(X43662) :- not open(X43662), tdom(X43662).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X43658, X43707) :- true(cell(X43664, X43665, X43658), X43707), true(cell(X43664, X43673, X43658), X43707), true(cell(X43664, X43681, X43658), X43707), true(cell(X43688, X43665, X43658), X43707), succ(X43665, X43673), succ(X43664, X43688), succ(X43673, X43681), domdomain(8, X43673), domdomain(9, X43681), domdomain(8, X43664), domdomain(9, X43688), domdomain(8, X43665), domdomain(9, X43673), domdomain(2, X43688), domdomain(2, X43681), domdomain(2, X43673), domdomain(2, X43664), domdomain(2, X43665), tdom(X43707), domdomain(3, X43658).
line(X43658, X43707) :- true(cell(X43664, X43665, X43658), X43707), true(cell(X43664, X43673, X43658), X43707), true(cell(X43664, X43681, X43658), X43707), true(cell(X43688, X43665, X43658), X43707), succ(X43665, X43673), succ(X43688, X43664), succ(X43673, X43681), domdomain(8, X43673), domdomain(9, X43681), domdomain(8, X43688), domdomain(9, X43664), domdomain(8, X43665), domdomain(9, X43673), domdomain(2, X43688), domdomain(2, X43681), domdomain(2, X43673), domdomain(2, X43664), domdomain(2, X43665), tdom(X43707), domdomain(3, X43658).
line(X43658, X43707) :- true(cell(X43664, X43665, X43658), X43707), true(cell(X43664, X43673, X43658), X43707), true(cell(X43664, X43681, X43658), X43707), true(cell(X43688, X43681, X43658), X43707), succ(X43665, X43673), succ(X43664, X43688), succ(X43673, X43681), domdomain(8, X43673), domdomain(9, X43681), domdomain(8, X43664), domdomain(9, X43688), domdomain(8, X43665), domdomain(9, X43673), domdomain(2, X43688), domdomain(2, X43681), domdomain(2, X43673), domdomain(2, X43664), domdomain(2, X43665), tdom(X43707), domdomain(3, X43658).
line(X43658, X43707) :- true(cell(X43664, X43665, X43658), X43707), true(cell(X43664, X43673, X43658), X43707), true(cell(X43664, X43681, X43658), X43707), true(cell(X43688, X43681, X43658), X43707), succ(X43665, X43673), succ(X43688, X43664), succ(X43673, X43681), domdomain(8, X43673), domdomain(9, X43681), domdomain(8, X43688), domdomain(9, X43664), domdomain(8, X43665), domdomain(9, X43673), domdomain(2, X43688), domdomain(2, X43681), domdomain(2, X43673), domdomain(2, X43664), domdomain(2, X43665), tdom(X43707), domdomain(3, X43658).
line(X43658, X43707) :- true(cell(X43664, X43665, X43658), X43707), true(cell(X43672, X43665, X43658), X43707), true(cell(X43680, X43665, X43658), X43707), true(cell(X43664, X43689, X43658), X43707), succ(X43665, X43689), succ(X43664, X43672), succ(X43672, X43680), domdomain(8, X43672), domdomain(9, X43680), domdomain(8, X43664), domdomain(9, X43672), domdomain(8, X43665), domdomain(9, X43689), domdomain(2, X43689), domdomain(2, X43680), domdomain(2, X43672), domdomain(2, X43664), domdomain(2, X43665), tdom(X43707), domdomain(3, X43658).
line(X43658, X43707) :- true(cell(X43664, X43665, X43658), X43707), true(cell(X43672, X43665, X43658), X43707), true(cell(X43680, X43665, X43658), X43707), true(cell(X43664, X43689, X43658), X43707), succ(X43689, X43665), succ(X43664, X43672), succ(X43672, X43680), domdomain(8, X43672), domdomain(9, X43680), domdomain(8, X43664), domdomain(9, X43672), domdomain(8, X43689), domdomain(9, X43665), domdomain(2, X43689), domdomain(2, X43680), domdomain(2, X43672), domdomain(2, X43664), domdomain(2, X43665), tdom(X43707), domdomain(3, X43658).
line(X43658, X43707) :- true(cell(X43664, X43665, X43658), X43707), true(cell(X43672, X43665, X43658), X43707), true(cell(X43680, X43665, X43658), X43707), true(cell(X43680, X43689, X43658), X43707), succ(X43665, X43689), succ(X43664, X43672), succ(X43672, X43680), domdomain(8, X43672), domdomain(9, X43680), domdomain(8, X43664), domdomain(9, X43672), domdomain(8, X43665), domdomain(9, X43689), domdomain(2, X43689), domdomain(2, X43680), domdomain(2, X43672), domdomain(2, X43664), domdomain(2, X43665), tdom(X43707), domdomain(3, X43658).
line(X43657, X43706) :- true(cell(X43663, X43664, X43657), X43706), true(cell(X43671, X43664, X43657), X43706), true(cell(X43679, X43664, X43657), X43706), true(cell(X43679, X43688, X43657), X43706), succ(X43688, X43664), succ(X43663, X43671), succ(X43671, X43679), domdomain(8, X43671), domdomain(9, X43679), domdomain(8, X43663), domdomain(9, X43671), domdomain(8, X43688), domdomain(9, X43664), domdomain(2, X43688), domdomain(2, X43679), domdomain(2, X43671), domdomain(2, X43663), domdomain(2, X43664), tdom(X43706), domdomain(3, X43657).
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
