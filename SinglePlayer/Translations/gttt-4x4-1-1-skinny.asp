mtdom(1..15).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X37234, X37235, b)) :- index(X37234), index(X37235), domdomain(2, X37234), domdomain(2, X37235).
base(cell(X37234, X37235, x)) :- index(X37234), index(X37235), domdomain(2, X37234), domdomain(2, X37235).
base(cell(X37234, X37235, o)) :- index(X37234), index(X37235), domdomain(2, X37234), domdomain(2, X37235).
base(control(X37234)) :- role(X37234), domdomain(4, X37234).
input(X37232, mark(X37235, X37236)) :- index(X37235), index(X37236), role(X37232), domdomain(4, X37232), domdomain(2, X37235), domdomain(2, X37236).
input(X37232, noop) :- role(X37232), domdomain(4, X37232).
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
true(cell(X37234, X37235, x), X37254 + 1) :- does(xplayer, mark(X37234, X37235), X37254), true(cell(X37234, X37235, b), X37254), mtdom(X37254), domdomain(2, X37234), domdomain(2, X37235).
true(cell(X37234, X37235, o), X37254 + 1) :- does(oplayer, mark(X37234, X37235), X37254), true(cell(X37234, X37235, b), X37254), mtdom(X37254), domdomain(2, X37234), domdomain(2, X37235).
true(cell(X37234, X37235, X37236), X37251 + 1) :- true(cell(X37234, X37235, X37236), X37251), X37236 != b, mtdom(X37251), domdomain(2, X37234), domdomain(2, X37235), domdomain(3, X37236).
true(cell(X37234, X37235, b), X37259 + 1) :- does(X37240, mark(X37243, X37244), X37259), true(cell(X37234, X37235, b), X37259), X37234 != X37243, domdomain(4, X37240), domdomain(2, X37243), domdomain(2, X37244), mtdom(X37259), domdomain(2, X37234), domdomain(2, X37235).
true(cell(X37234, X37235, b), X37259 + 1) :- does(X37240, mark(X37243, X37244), X37259), true(cell(X37234, X37235, b), X37259), X37235 != X37244, domdomain(4, X37240), domdomain(2, X37243), domdomain(2, X37244), mtdom(X37259), domdomain(2, X37234), domdomain(2, X37235).
true(control(xplayer), X37242 + 1) :- true(control(oplayer), X37242), mtdom(X37242).
true(control(oplayer), X37242 + 1) :- true(control(xplayer), X37242), mtdom(X37242).
open(X37240) :- true(cell(X37236, X37237, b), X37240), domdomain(2, X37236), domdomain(2, X37237), tdom(X37240).
legal(X37232, mark(X37235, X37236), X37252) :- true(cell(X37235, X37236, b), X37252), true(control(X37232), X37252), tdom(X37252), domdomain(4, X37232), domdomain(2, X37235), domdomain(2, X37236).
legal(xplayer, noop, X37241) :- true(control(oplayer), X37241), tdom(X37241).
legal(oplayer, noop, X37241) :- true(control(xplayer), X37241), tdom(X37241).
goal(xplayer, 100, X37239) :- line(x, X37239), tdom(X37239).
goal(xplayer, 50, X37251) :- not line(x, X37251), not line(o, X37251), not open(X37251), tdom(X37251).
goal(xplayer, 0, X37239) :- line(o, X37239), tdom(X37239).
goal(oplayer, 100, X37239) :- line(o, X37239), tdom(X37239).
goal(oplayer, 50, X37251) :- not line(x, X37251), not line(o, X37251), not open(X37251), tdom(X37251).
goal(oplayer, 0, X37239) :- line(x, X37239), tdom(X37239).
terminal(X37236) :- line(x, X37236), tdom(X37236).
terminal(X37236) :- line(o, X37236), tdom(X37236).
terminal(X37236) :- not open(X37236), tdom(X37236).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X37232, X37281) :- true(cell(X37238, X37239, X37232), X37281), true(cell(X37238, X37247, X37232), X37281), true(cell(X37238, X37255, X37232), X37281), true(cell(X37238, X37263, X37232), X37281), succ(X37239, X37247), succ(X37247, X37255), succ(X37255, X37263), domdomain(7, X37255), domdomain(8, X37263), domdomain(7, X37247), domdomain(8, X37255), domdomain(7, X37239), domdomain(8, X37247), domdomain(2, X37263), domdomain(2, X37255), domdomain(2, X37247), domdomain(2, X37238), domdomain(2, X37239), tdom(X37281), domdomain(3, X37232).
line(X37231, X37280) :- true(cell(X37237, X37238, X37231), X37280), true(cell(X37245, X37238, X37231), X37280), true(cell(X37253, X37238, X37231), X37280), true(cell(X37261, X37238, X37231), X37280), succ(X37237, X37245), succ(X37245, X37253), succ(X37253, X37261), domdomain(7, X37253), domdomain(8, X37261), domdomain(7, X37245), domdomain(8, X37253), domdomain(7, X37237), domdomain(8, X37245), domdomain(2, X37261), domdomain(2, X37253), domdomain(2, X37245), domdomain(2, X37237), domdomain(2, X37238), tdom(X37280), domdomain(3, X37231).
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
