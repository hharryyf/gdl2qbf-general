mtdom(1..19).
role(xplayer).
role(oplayer).
base(cell(X50228, X50229, X50230)) :- x(X50228), y(X50229), role(X50230), domdomain(2, X50228), domdomain(2, X50229), domdomain(3, X50230).
base(control(xplayer)).
base(control(oplayer)).
input(X50226, drop(X50229)) :- role(X50226), x(X50229), domdomain(3, X50226), domdomain(2, X50229).
input(X50226, noop) :- role(X50226), domdomain(3, X50226).
true(control(xplayer), 1).
legal(xplayer, noop, X50235) :- true(control(oplayer), X50235), tdom(X50235).
legal(xplayer, drop(X50229), X50241) :- true(control(xplayer), X50241), columnopen(X50229, X50241), tdom(X50241), domdomain(2, X50229).
legal(oplayer, noop, X50235) :- true(control(xplayer), X50235), tdom(X50235).
legal(oplayer, drop(X50229), X50241) :- true(control(oplayer), X50241), columnopen(X50229, X50241), tdom(X50241), domdomain(2, X50229).
true(cell(X50228, 1, X50230), X50243 + 1) :- does(X50230, drop(X50228), X50243), columnempty(X50228, X50243), tdom(X50243), mtdom(X50243), domdomain(2, X50228), domdomain(3, X50230).
true(cell(X50228, X50229, X50230), X50256 + 1) :- does(X50230, drop(X50228), X50256), cellopen(X50228, X50229, X50256), succ(X50246, X50229), not cellopen(X50228, X50246, X50256), domdomain(2, X50246), domdomain(7, X50246), domdomain(8, X50229), tdom(X50256), mtdom(X50256), domdomain(2, X50228), domdomain(2, X50229), domdomain(3, X50230).
true(cell(X50228, X50229, X50230), X50240 + 1) :- true(cell(X50228, X50229, X50230), X50240), mtdom(X50240), domdomain(2, X50228), domdomain(2, X50229), domdomain(3, X50230).
true(control(xplayer), X50236 + 1) :- true(control(oplayer), X50236), mtdom(X50236).
true(control(oplayer), X50236 + 1) :- true(control(xplayer), X50236), mtdom(X50236).
terminal(X50230) :- line(xplayer, X50230), tdom(X50230).
terminal(X50230) :- line(oplayer, X50230), tdom(X50230).
terminal(X50230) :- not boardopen(X50230), tdom(X50230).
goal(xplayer, 100, X50233) :- line(xplayer, X50233), tdom(X50233).
goal(xplayer, 50, X50245) :- not line(xplayer, X50245), not line(oplayer, X50245), not boardopen(X50245), tdom(X50245).
goal(xplayer, 0, X50233) :- line(oplayer, X50233), tdom(X50233).
goal(xplayer, 0, X50243) :- not line(xplayer, X50243), not line(oplayer, X50243), boardopen(X50243), tdom(X50243).
goal(oplayer, 100, X50233) :- line(oplayer, X50233), tdom(X50233).
goal(oplayer, 50, X50245) :- not line(xplayer, X50245), not line(oplayer, X50245), not boardopen(X50245), tdom(X50245).
goal(oplayer, 0, X50233) :- line(xplayer, X50233), tdom(X50233).
goal(oplayer, 0, X50243) :- not line(xplayer, X50243), not line(oplayer, X50243), boardopen(X50243), tdom(X50243).
cellopen(X50226, X50227, X50257) :- x(X50226), y(X50227), not true(cell(X50226, X50227, xplayer), X50257), not true(cell(X50226, X50227, oplayer), X50257), tdom(X50257), domdomain(2, X50226), domdomain(2, X50227).
columnopen(X50226, X50233) :- cellopen(X50226, 6, X50233), tdom(X50233), domdomain(2, X50226).
columnempty(X50226, X50233) :- cellopen(X50226, 1, X50233), tdom(X50233), domdomain(2, X50226).
boardopen(X50234) :- x(X50228), columnopen(X50228, X50234), domdomain(2, X50228), tdom(X50234).
line(X50226, X50275) :- true(cell(X50232, X50233, X50226), X50275), succ(X50232, X50239), succ(X50239, X50244), succ(X50244, X50249), true(cell(X50239, X50233, X50226), X50275), true(cell(X50244, X50233, X50226), X50275), true(cell(X50249, X50233, X50226), X50275), domdomain(2, X50249), domdomain(2, X50244), domdomain(2, X50239), domdomain(7, X50244), domdomain(8, X50249), domdomain(7, X50239), domdomain(8, X50244), domdomain(7, X50232), domdomain(8, X50239), domdomain(2, X50232), domdomain(2, X50233), tdom(X50275), domdomain(3, X50226).
line(X50226, X50275) :- true(cell(X50232, X50233, X50226), X50275), succ(X50233, X50239), succ(X50239, X50244), succ(X50244, X50249), true(cell(X50232, X50239, X50226), X50275), true(cell(X50232, X50244, X50226), X50275), true(cell(X50232, X50249, X50226), X50275), domdomain(2, X50249), domdomain(2, X50244), domdomain(2, X50239), domdomain(7, X50244), domdomain(8, X50249), domdomain(7, X50239), domdomain(8, X50244), domdomain(7, X50233), domdomain(8, X50239), domdomain(2, X50232), domdomain(2, X50233), tdom(X50275), domdomain(3, X50226).
line(X50226, X50290) :- true(cell(X50232, X50233, X50226), X50290), succ(X50232, X50239), succ(X50239, X50244), succ(X50244, X50249), succ(X50233, X50254), succ(X50254, X50259), succ(X50259, X50264), true(cell(X50239, X50254, X50226), X50290), true(cell(X50244, X50259, X50226), X50290), true(cell(X50249, X50264, X50226), X50290), domdomain(2, X50249), domdomain(2, X50264), domdomain(2, X50244), domdomain(2, X50259), domdomain(2, X50239), domdomain(2, X50254), domdomain(7, X50259), domdomain(8, X50264), domdomain(7, X50254), domdomain(8, X50259), domdomain(7, X50233), domdomain(8, X50254), domdomain(7, X50244), domdomain(8, X50249), domdomain(7, X50239), domdomain(8, X50244), domdomain(7, X50232), domdomain(8, X50239), domdomain(2, X50232), domdomain(2, X50233), tdom(X50290), domdomain(3, X50226).
line(X50226, X50290) :- true(cell(X50232, X50233, X50226), X50290), succ(X50232, X50239), succ(X50239, X50244), succ(X50244, X50249), succ(X50253, X50233), succ(X50258, X50253), succ(X50263, X50258), true(cell(X50239, X50253, X50226), X50290), true(cell(X50244, X50258, X50226), X50290), true(cell(X50249, X50263, X50226), X50290), domdomain(2, X50249), domdomain(2, X50263), domdomain(2, X50244), domdomain(2, X50258), domdomain(2, X50239), domdomain(2, X50253), domdomain(7, X50263), domdomain(8, X50258), domdomain(7, X50258), domdomain(8, X50253), domdomain(7, X50253), domdomain(8, X50233), domdomain(7, X50244), domdomain(8, X50249), domdomain(7, X50239), domdomain(8, X50244), domdomain(7, X50232), domdomain(8, X50239), domdomain(2, X50232), domdomain(2, X50233), tdom(X50290), domdomain(3, X50226).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
succ(5, 6).
x(1).
x(2).
x(3).
x(4).
x(5).
x(6).
y(1).
y(2).
y(3).
y(4).
y(5).
y(6).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(2, 5).
domdomain(2, 6).
domdomain(3, oplayer).
domdomain(3, xplayer).
domdomain(4, 0).
domdomain(4, 50).
domdomain(4, 100).
domdomain(5, control).
domdomain(6, drop).
domdomain(6, noop).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(7, 4).
domdomain(7, 5).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(8, 5).
domdomain(8, 6).
