mtdom(1..9).
role(xplayer).
role(oplayer).
base(cell(X47120, X47121, X47122)) :- x(X47120), y(X47121), role(X47122), domdomain(2, X47120), domdomain(2, X47121), domdomain(3, X47122).
base(control(xplayer)).
base(control(oplayer)).
input(X47118, drop(X47121)) :- role(X47118), x(X47121), domdomain(3, X47118), domdomain(2, X47121).
input(X47118, noop) :- role(X47118), domdomain(3, X47118).
true(control(xplayer), 1).
legal(xplayer, noop, X47127) :- true(control(oplayer), X47127), tdom(X47127).
legal(xplayer, drop(X47121), X47133) :- true(control(xplayer), X47133), columnopen(X47121, X47133), tdom(X47133), domdomain(2, X47121).
legal(oplayer, noop, X47127) :- true(control(xplayer), X47127), tdom(X47127).
legal(oplayer, drop(X47121), X47133) :- true(control(oplayer), X47133), columnopen(X47121, X47133), tdom(X47133), domdomain(2, X47121).
true(cell(X47120, 1, X47122), X47135 + 1) :- does(X47122, drop(X47120), X47135), columnempty(X47120, X47135), tdom(X47135), mtdom(X47135), domdomain(2, X47120), domdomain(3, X47122).
true(cell(X47120, X47121, X47122), X47148 + 1) :- does(X47122, drop(X47120), X47148), cellopen(X47120, X47121, X47148), succ(X47138, X47121), not cellopen(X47120, X47138, X47148), domdomain(2, X47138), domdomain(7, X47138), domdomain(8, X47121), tdom(X47148), mtdom(X47148), domdomain(2, X47120), domdomain(2, X47121), domdomain(3, X47122).
true(cell(X47120, X47121, X47122), X47132 + 1) :- true(cell(X47120, X47121, X47122), X47132), mtdom(X47132), domdomain(2, X47120), domdomain(2, X47121), domdomain(3, X47122).
true(control(xplayer), X47128 + 1) :- true(control(oplayer), X47128), mtdom(X47128).
true(control(oplayer), X47128 + 1) :- true(control(xplayer), X47128), mtdom(X47128).
terminal(X47122) :- line(xplayer, X47122), tdom(X47122).
terminal(X47122) :- line(oplayer, X47122), tdom(X47122).
terminal(X47122) :- not boardopen(X47122), tdom(X47122).
goal(xplayer, 100, X47125) :- line(xplayer, X47125), tdom(X47125).
goal(xplayer, 50, X47137) :- not line(xplayer, X47137), not line(oplayer, X47137), not boardopen(X47137), tdom(X47137).
goal(xplayer, 0, X47125) :- line(oplayer, X47125), tdom(X47125).
goal(xplayer, 0, X47135) :- not line(xplayer, X47135), not line(oplayer, X47135), boardopen(X47135), tdom(X47135).
goal(oplayer, 100, X47125) :- line(oplayer, X47125), tdom(X47125).
goal(oplayer, 50, X47137) :- not line(xplayer, X47137), not line(oplayer, X47137), not boardopen(X47137), tdom(X47137).
goal(oplayer, 0, X47125) :- line(xplayer, X47125), tdom(X47125).
goal(oplayer, 0, X47135) :- not line(xplayer, X47135), not line(oplayer, X47135), boardopen(X47135), tdom(X47135).
cellopen(X47118, X47119, X47149) :- x(X47118), y(X47119), not true(cell(X47118, X47119, xplayer), X47149), not true(cell(X47118, X47119, oplayer), X47149), tdom(X47149), domdomain(2, X47118), domdomain(2, X47119).
columnopen(X47118, X47125) :- cellopen(X47118, 6, X47125), tdom(X47125), domdomain(2, X47118).
columnempty(X47118, X47125) :- cellopen(X47118, 1, X47125), tdom(X47125), domdomain(2, X47118).
boardopen(X47126) :- x(X47120), columnopen(X47120, X47126), domdomain(2, X47120), tdom(X47126).
line(X47118, X47154) :- true(cell(X47124, X47125, X47118), X47154), succ(X47124, X47131), succ(X47131, X47136), true(cell(X47131, X47125, X47118), X47154), true(cell(X47136, X47125, X47118), X47154), domdomain(2, X47136), domdomain(2, X47131), domdomain(7, X47131), domdomain(8, X47136), domdomain(7, X47124), domdomain(8, X47131), domdomain(2, X47124), domdomain(2, X47125), tdom(X47154), domdomain(3, X47118).
line(X47118, X47154) :- true(cell(X47124, X47125, X47118), X47154), succ(X47125, X47131), succ(X47131, X47136), true(cell(X47124, X47131, X47118), X47154), true(cell(X47124, X47136, X47118), X47154), domdomain(2, X47136), domdomain(2, X47131), domdomain(7, X47131), domdomain(8, X47136), domdomain(7, X47125), domdomain(8, X47131), domdomain(2, X47124), domdomain(2, X47125), tdom(X47154), domdomain(3, X47118).
line(X47118, X47164) :- true(cell(X47124, X47125, X47118), X47164), succ(X47124, X47131), succ(X47131, X47136), succ(X47125, X47141), succ(X47141, X47146), true(cell(X47131, X47141, X47118), X47164), true(cell(X47136, X47146, X47118), X47164), domdomain(2, X47136), domdomain(2, X47146), domdomain(2, X47131), domdomain(2, X47141), domdomain(7, X47141), domdomain(8, X47146), domdomain(7, X47125), domdomain(8, X47141), domdomain(7, X47131), domdomain(8, X47136), domdomain(7, X47124), domdomain(8, X47131), domdomain(2, X47124), domdomain(2, X47125), tdom(X47164), domdomain(3, X47118).
line(X47118, X47164) :- true(cell(X47124, X47125, X47118), X47164), succ(X47124, X47131), succ(X47131, X47136), succ(X47140, X47125), succ(X47145, X47140), true(cell(X47131, X47140, X47118), X47164), true(cell(X47136, X47145, X47118), X47164), domdomain(2, X47136), domdomain(2, X47145), domdomain(2, X47131), domdomain(2, X47140), domdomain(7, X47145), domdomain(8, X47140), domdomain(7, X47140), domdomain(8, X47125), domdomain(7, X47131), domdomain(8, X47136), domdomain(7, X47124), domdomain(8, X47131), domdomain(2, X47124), domdomain(2, X47125), tdom(X47164), domdomain(3, X47118).
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
