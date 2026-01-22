mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X40034, X40035, x)) :- index(X40034), index(X40035), domdomain(2, X40034), domdomain(2, X40035).
base(cell(X40034, X40035, o)) :- index(X40034), index(X40035), domdomain(2, X40034), domdomain(2, X40035).
base(control1(X40034)) :- role(X40034), domdomain(4, X40034).
base(control2(X40034)) :- role(X40034), domdomain(4, X40034).
input(X40032, mark(X40035, X40036)) :- index(X40035), index(X40036), role(X40032), domdomain(4, X40032), domdomain(2, X40035), domdomain(2, X40036).
input(X40032, noop) :- role(X40032), domdomain(4, X40032).
true(control1(xplayer), 1).
true(cell(X40034, X40035, x), X40046 + 1) :- does(xplayer, mark(X40034, X40035), X40046), mtdom(X40046), domdomain(2, X40034), domdomain(2, X40035).
true(cell(X40034, X40035, o), X40046 + 1) :- does(oplayer, mark(X40034, X40035), X40046), mtdom(X40046), domdomain(2, X40034), domdomain(2, X40035).
true(cell(X40034, X40035, X40036), X40046 + 1) :- true(cell(X40034, X40035, X40036), X40046), mtdom(X40046), domdomain(2, X40034), domdomain(2, X40035), domdomain(3, X40036).
true(control1(xplayer), X40042 + 1) :- true(control2(oplayer), X40042), mtdom(X40042).
true(control1(oplayer), X40042 + 1) :- true(control2(xplayer), X40042), mtdom(X40042).
true(control2(xplayer), X40042 + 1) :- true(control1(xplayer), X40042), mtdom(X40042).
true(control2(oplayer), X40042 + 1) :- true(control1(oplayer), X40042), mtdom(X40042).
open(X40060) :- not true(cell(X40038, X40039, x), X40060), not true(cell(X40038, X40039, o), X40060), index(X40038), index(X40039), domdomain(2, X40038), domdomain(2, X40039), tdom(X40060).
legal(X40032, mark(X40035, X40036), X40072) :- not true(cell(X40035, X40036, x), X40072), not true(cell(X40035, X40036, o), X40072), true(control1(X40032), X40072), index(X40035), index(X40036), tdom(X40072), domdomain(4, X40032), domdomain(2, X40035), domdomain(2, X40036).
legal(xplayer, noop, X40041) :- true(control1(oplayer), X40041), tdom(X40041).
legal(oplayer, noop, X40041) :- true(control1(xplayer), X40041), tdom(X40041).
legal(X40032, mark(X40035, X40036), X40072) :- not true(cell(X40035, X40036, x), X40072), not true(cell(X40035, X40036, o), X40072), true(control2(X40032), X40072), index(X40035), index(X40036), tdom(X40072), domdomain(4, X40032), domdomain(2, X40035), domdomain(2, X40036).
legal(xplayer, noop, X40041) :- true(control2(oplayer), X40041), tdom(X40041).
legal(oplayer, noop, X40041) :- true(control2(xplayer), X40041), tdom(X40041).
goal(xplayer, 100, X40039) :- line(x, X40039), tdom(X40039).
goal(xplayer, 50, X40051) :- not line(x, X40051), not line(o, X40051), not open(X40051), tdom(X40051).
goal(xplayer, 0, X40039) :- line(o, X40039), tdom(X40039).
goal(oplayer, 100, X40039) :- line(o, X40039), tdom(X40039).
goal(oplayer, 50, X40051) :- not line(x, X40051), not line(o, X40051), not open(X40051), tdom(X40051).
goal(oplayer, 0, X40039) :- line(x, X40039), tdom(X40039).
terminal(X40036) :- line(x, X40036), tdom(X40036).
terminal(X40036) :- line(o, X40036), tdom(X40036).
terminal(X40036) :- not open(X40036), tdom(X40036).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X40032, X40081) :- true(cell(X40038, X40039, X40032), X40081), true(cell(X40038, X40047, X40032), X40081), true(cell(X40038, X40055, X40032), X40081), true(cell(X40062, X40047, X40032), X40081), succ(X40039, X40047), succ(X40038, X40062), succ(X40047, X40055), domdomain(8, X40047), domdomain(9, X40055), domdomain(8, X40038), domdomain(9, X40062), domdomain(8, X40039), domdomain(9, X40047), domdomain(2, X40062), domdomain(2, X40055), domdomain(2, X40047), domdomain(2, X40038), domdomain(2, X40039), tdom(X40081), domdomain(3, X40032).
line(X40032, X40081) :- true(cell(X40038, X40039, X40032), X40081), true(cell(X40038, X40047, X40032), X40081), true(cell(X40038, X40055, X40032), X40081), true(cell(X40062, X40047, X40032), X40081), succ(X40039, X40047), succ(X40062, X40038), succ(X40047, X40055), domdomain(8, X40047), domdomain(9, X40055), domdomain(8, X40062), domdomain(9, X40038), domdomain(8, X40039), domdomain(9, X40047), domdomain(2, X40062), domdomain(2, X40055), domdomain(2, X40047), domdomain(2, X40038), domdomain(2, X40039), tdom(X40081), domdomain(3, X40032).
line(X40032, X40081) :- true(cell(X40038, X40039, X40032), X40081), true(cell(X40046, X40039, X40032), X40081), true(cell(X40054, X40039, X40032), X40081), true(cell(X40046, X40063, X40032), X40081), succ(X40038, X40046), succ(X40046, X40054), succ(X40039, X40063), domdomain(8, X40039), domdomain(9, X40063), domdomain(8, X40046), domdomain(9, X40054), domdomain(8, X40038), domdomain(9, X40046), domdomain(2, X40063), domdomain(2, X40054), domdomain(2, X40046), domdomain(2, X40038), domdomain(2, X40039), tdom(X40081), domdomain(3, X40032).
line(X40031, X40080) :- true(cell(X40037, X40038, X40031), X40080), true(cell(X40045, X40038, X40031), X40080), true(cell(X40053, X40038, X40031), X40080), true(cell(X40045, X40062, X40031), X40080), succ(X40037, X40045), succ(X40045, X40053), succ(X40062, X40038), domdomain(8, X40062), domdomain(9, X40038), domdomain(8, X40045), domdomain(9, X40053), domdomain(8, X40037), domdomain(9, X40045), domdomain(2, X40062), domdomain(2, X40053), domdomain(2, X40045), domdomain(2, X40037), domdomain(2, X40038), tdom(X40080), domdomain(3, X40031).
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
