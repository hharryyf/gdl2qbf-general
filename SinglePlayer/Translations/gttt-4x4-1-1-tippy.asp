mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X41703, X41704, b)) :- index(X41703), index(X41704), domdomain(2, X41703), domdomain(2, X41704).
base(cell(X41703, X41704, x)) :- index(X41703), index(X41704), domdomain(2, X41703), domdomain(2, X41704).
base(cell(X41703, X41704, o)) :- index(X41703), index(X41704), domdomain(2, X41703), domdomain(2, X41704).
base(control(X41703)) :- role(X41703), domdomain(4, X41703).
input(X41701, mark(X41704, X41705)) :- index(X41704), index(X41705), role(X41701), domdomain(4, X41701), domdomain(2, X41704), domdomain(2, X41705).
input(X41701, noop) :- role(X41701), domdomain(4, X41701).
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
true(cell(X41703, X41704, x), X41723 + 1) :- does(xplayer, mark(X41703, X41704), X41723), true(cell(X41703, X41704, b), X41723), mtdom(X41723), domdomain(2, X41703), domdomain(2, X41704).
true(cell(X41703, X41704, o), X41723 + 1) :- does(oplayer, mark(X41703, X41704), X41723), true(cell(X41703, X41704, b), X41723), mtdom(X41723), domdomain(2, X41703), domdomain(2, X41704).
true(cell(X41703, X41704, X41705), X41720 + 1) :- true(cell(X41703, X41704, X41705), X41720), X41705 != b, mtdom(X41720), domdomain(2, X41703), domdomain(2, X41704), domdomain(3, X41705).
true(cell(X41703, X41704, b), X41728 + 1) :- does(X41709, mark(X41712, X41713), X41728), true(cell(X41703, X41704, b), X41728), X41703 != X41712, domdomain(4, X41709), domdomain(2, X41712), domdomain(2, X41713), mtdom(X41728), domdomain(2, X41703), domdomain(2, X41704).
true(cell(X41703, X41704, b), X41728 + 1) :- does(X41709, mark(X41712, X41713), X41728), true(cell(X41703, X41704, b), X41728), X41704 != X41713, domdomain(4, X41709), domdomain(2, X41712), domdomain(2, X41713), mtdom(X41728), domdomain(2, X41703), domdomain(2, X41704).
true(control(xplayer), X41711 + 1) :- true(control(oplayer), X41711), mtdom(X41711).
true(control(oplayer), X41711 + 1) :- true(control(xplayer), X41711), mtdom(X41711).
open(X41709) :- true(cell(X41705, X41706, b), X41709), domdomain(2, X41705), domdomain(2, X41706), tdom(X41709).
legal(X41701, mark(X41704, X41705), X41721) :- true(cell(X41704, X41705, b), X41721), true(control(X41701), X41721), tdom(X41721), domdomain(4, X41701), domdomain(2, X41704), domdomain(2, X41705).
legal(xplayer, noop, X41710) :- true(control(oplayer), X41710), tdom(X41710).
legal(oplayer, noop, X41710) :- true(control(xplayer), X41710), tdom(X41710).
goal(xplayer, 100, X41708) :- line(x, X41708), tdom(X41708).
goal(xplayer, 50, X41720) :- not line(x, X41720), not line(o, X41720), not open(X41720), tdom(X41720).
goal(xplayer, 0, X41708) :- line(o, X41708), tdom(X41708).
goal(oplayer, 100, X41708) :- line(o, X41708), tdom(X41708).
goal(oplayer, 50, X41720) :- not line(x, X41720), not line(o, X41720), not open(X41720), tdom(X41720).
goal(oplayer, 0, X41708) :- line(x, X41708), tdom(X41708).
terminal(X41705) :- line(x, X41705), tdom(X41705).
terminal(X41705) :- line(o, X41705), tdom(X41705).
terminal(X41705) :- not open(X41705), tdom(X41705).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X41701, X41750) :- true(cell(X41707, X41708, X41701), X41750), true(cell(X41707, X41716, X41701), X41750), true(cell(X41723, X41716, X41701), X41750), true(cell(X41723, X41732, X41701), X41750), succ(X41708, X41716), succ(X41707, X41723), succ(X41716, X41732), domdomain(7, X41716), domdomain(8, X41732), domdomain(7, X41707), domdomain(8, X41723), domdomain(7, X41708), domdomain(8, X41716), domdomain(2, X41732), domdomain(2, X41723), domdomain(2, X41716), domdomain(2, X41707), domdomain(2, X41708), tdom(X41750), domdomain(3, X41701).
line(X41701, X41750) :- true(cell(X41707, X41708, X41701), X41750), true(cell(X41707, X41716, X41701), X41750), true(cell(X41723, X41724, X41701), X41750), true(cell(X41723, X41708, X41701), X41750), succ(X41724, X41708), succ(X41707, X41723), succ(X41708, X41716), domdomain(7, X41708), domdomain(8, X41716), domdomain(7, X41707), domdomain(8, X41723), domdomain(7, X41724), domdomain(8, X41708), domdomain(2, X41723), domdomain(2, X41724), domdomain(2, X41716), domdomain(2, X41707), domdomain(2, X41708), tdom(X41750), domdomain(3, X41701).
line(X41701, X41750) :- true(cell(X41707, X41708, X41701), X41750), true(cell(X41715, X41708, X41701), X41750), true(cell(X41715, X41724, X41701), X41750), true(cell(X41731, X41724, X41701), X41750), succ(X41708, X41724), succ(X41707, X41715), succ(X41715, X41731), domdomain(7, X41715), domdomain(8, X41731), domdomain(7, X41707), domdomain(8, X41715), domdomain(7, X41708), domdomain(8, X41724), domdomain(2, X41731), domdomain(2, X41724), domdomain(2, X41715), domdomain(2, X41707), domdomain(2, X41708), tdom(X41750), domdomain(3, X41701).
line(X41700, X41749) :- true(cell(X41706, X41707, X41700), X41749), true(cell(X41714, X41715, X41700), X41749), true(cell(X41714, X41707, X41700), X41749), true(cell(X41730, X41715, X41700), X41749), succ(X41715, X41707), succ(X41706, X41714), succ(X41714, X41730), domdomain(7, X41714), domdomain(8, X41730), domdomain(7, X41706), domdomain(8, X41714), domdomain(7, X41715), domdomain(8, X41707), domdomain(2, X41730), domdomain(2, X41714), domdomain(2, X41715), domdomain(2, X41706), domdomain(2, X41707), tdom(X41749), domdomain(3, X41700).
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
