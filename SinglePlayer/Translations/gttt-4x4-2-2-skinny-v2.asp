mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X35644, X35645, x)) :- index(X35644), index(X35645), domdomain(2, X35644), domdomain(2, X35645).
base(cell(X35644, X35645, o)) :- index(X35644), index(X35645), domdomain(2, X35644), domdomain(2, X35645).
base(control1(X35644)) :- role(X35644), domdomain(4, X35644).
base(control2(X35644)) :- role(X35644), domdomain(4, X35644).
input(X35642, mark(X35645, X35646)) :- index(X35645), index(X35646), role(X35642), domdomain(4, X35642), domdomain(2, X35645), domdomain(2, X35646).
input(X35642, noop) :- role(X35642), domdomain(4, X35642).
true(control1(xplayer), 1).
true(cell(X35644, X35645, x), X35656 + 1) :- does(xplayer, mark(X35644, X35645), X35656), mtdom(X35656), domdomain(2, X35644), domdomain(2, X35645).
true(cell(X35644, X35645, o), X35656 + 1) :- does(oplayer, mark(X35644, X35645), X35656), mtdom(X35656), domdomain(2, X35644), domdomain(2, X35645).
true(cell(X35644, X35645, X35646), X35656 + 1) :- true(cell(X35644, X35645, X35646), X35656), mtdom(X35656), domdomain(2, X35644), domdomain(2, X35645), domdomain(3, X35646).
true(control1(xplayer), X35652 + 1) :- true(control2(oplayer), X35652), mtdom(X35652).
true(control1(oplayer), X35652 + 1) :- true(control2(xplayer), X35652), mtdom(X35652).
true(control2(xplayer), X35652 + 1) :- true(control1(xplayer), X35652), mtdom(X35652).
true(control2(oplayer), X35652 + 1) :- true(control1(oplayer), X35652), mtdom(X35652).
open(X35670) :- not true(cell(X35648, X35649, x), X35670), not true(cell(X35648, X35649, o), X35670), index(X35648), index(X35649), domdomain(2, X35648), domdomain(2, X35649), tdom(X35670).
legal(X35642, mark(X35645, X35646), X35682) :- not true(cell(X35645, X35646, x), X35682), not true(cell(X35645, X35646, o), X35682), true(control1(X35642), X35682), index(X35645), index(X35646), tdom(X35682), domdomain(4, X35642), domdomain(2, X35645), domdomain(2, X35646).
legal(xplayer, noop, X35651) :- true(control1(oplayer), X35651), tdom(X35651).
legal(oplayer, noop, X35651) :- true(control1(xplayer), X35651), tdom(X35651).
legal(X35642, mark(X35645, X35646), X35682) :- not true(cell(X35645, X35646, x), X35682), not true(cell(X35645, X35646, o), X35682), true(control2(X35642), X35682), index(X35645), index(X35646), tdom(X35682), domdomain(4, X35642), domdomain(2, X35645), domdomain(2, X35646).
legal(xplayer, noop, X35651) :- true(control2(oplayer), X35651), tdom(X35651).
legal(oplayer, noop, X35651) :- true(control2(xplayer), X35651), tdom(X35651).
goal(xplayer, 100, X35649) :- line(x, X35649), tdom(X35649).
goal(xplayer, 50, X35661) :- not line(x, X35661), not line(o, X35661), not open(X35661), tdom(X35661).
goal(xplayer, 0, X35649) :- line(o, X35649), tdom(X35649).
goal(oplayer, 100, X35649) :- line(o, X35649), tdom(X35649).
goal(oplayer, 50, X35661) :- not line(x, X35661), not line(o, X35661), not open(X35661), tdom(X35661).
goal(oplayer, 0, X35649) :- line(x, X35649), tdom(X35649).
terminal(X35646) :- line(x, X35646), tdom(X35646).
terminal(X35646) :- line(o, X35646), tdom(X35646).
terminal(X35646) :- not open(X35646), tdom(X35646).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X35642, X35691) :- true(cell(X35648, X35649, X35642), X35691), true(cell(X35648, X35657, X35642), X35691), true(cell(X35648, X35665, X35642), X35691), true(cell(X35648, X35673, X35642), X35691), succ(X35649, X35657), succ(X35657, X35665), succ(X35665, X35673), domdomain(8, X35665), domdomain(9, X35673), domdomain(8, X35657), domdomain(9, X35665), domdomain(8, X35649), domdomain(9, X35657), domdomain(2, X35673), domdomain(2, X35665), domdomain(2, X35657), domdomain(2, X35648), domdomain(2, X35649), tdom(X35691), domdomain(3, X35642).
line(X35641, X35690) :- true(cell(X35647, X35648, X35641), X35690), true(cell(X35655, X35648, X35641), X35690), true(cell(X35663, X35648, X35641), X35690), true(cell(X35671, X35648, X35641), X35690), succ(X35647, X35655), succ(X35655, X35663), succ(X35663, X35671), domdomain(8, X35663), domdomain(9, X35671), domdomain(8, X35655), domdomain(9, X35663), domdomain(8, X35647), domdomain(9, X35655), domdomain(2, X35671), domdomain(2, X35663), domdomain(2, X35655), domdomain(2, X35647), domdomain(2, X35648), tdom(X35690), domdomain(3, X35641).
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
