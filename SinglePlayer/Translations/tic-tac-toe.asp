mtdom(1..9).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
base(cell(X35228, X35229, b)) :- index(X35228), index(X35229), domdomain(2, X35228), domdomain(2, X35229).
base(cell(X35228, X35229, x)) :- index(X35228), index(X35229), domdomain(2, X35228), domdomain(2, X35229).
base(cell(X35228, X35229, o)) :- index(X35228), index(X35229), domdomain(2, X35228), domdomain(2, X35229).
base(control(X35228)) :- role(X35228), domdomain(4, X35228).
input(X35226, mark(X35229, X35230)) :- index(X35229), index(X35230), role(X35226), domdomain(4, X35226), domdomain(2, X35229), domdomain(2, X35230).
input(X35226, noop) :- role(X35226), domdomain(4, X35226).
true(cell(1, 1, b), 1).
true(cell(1, 2, b), 1).
true(cell(1, 3, b), 1).
true(cell(2, 1, b), 1).
true(cell(2, 2, b), 1).
true(cell(2, 3, b), 1).
true(cell(3, 1, b), 1).
true(cell(3, 2, b), 1).
true(cell(3, 3, b), 1).
true(control(xplayer), 1).
true(cell(X35228, X35229, x), X35248 + 1) :- does(xplayer, mark(X35228, X35229), X35248), true(cell(X35228, X35229, b), X35248), mtdom(X35248), domdomain(2, X35228), domdomain(2, X35229).
true(cell(X35228, X35229, o), X35248 + 1) :- does(oplayer, mark(X35228, X35229), X35248), true(cell(X35228, X35229, b), X35248), mtdom(X35248), domdomain(2, X35228), domdomain(2, X35229).
true(cell(X35228, X35229, X35230), X35245 + 1) :- true(cell(X35228, X35229, X35230), X35245), X35230 != b, mtdom(X35245), domdomain(2, X35228), domdomain(2, X35229), domdomain(3, X35230).
true(cell(X35228, X35229, b), X35259 + 1) :- does(X35234, mark(X35237, X35238), X35259), true(cell(X35228, X35229, b), X35259), 1 { X35228 != X35237 ; X35229 != X35238 }, domdomain(4, X35234), domdomain(2, X35237), domdomain(2, X35238), mtdom(X35259), domdomain(2, X35228), domdomain(2, X35229).
true(control(xplayer), X35236 + 1) :- true(control(oplayer), X35236), mtdom(X35236).
true(control(oplayer), X35236 + 1) :- true(control(xplayer), X35236), mtdom(X35236).
row(X35226, X35227, X35253) :- true(cell(X35226, 1, X35227), X35253), true(cell(X35226, 2, X35227), X35253), true(cell(X35226, 3, X35227), X35253), tdom(X35253), domdomain(2, X35226), domdomain(3, X35227).
column(X35226, X35227, X35253) :- true(cell(1, X35226, X35227), X35253), true(cell(2, X35226, X35227), X35253), true(cell(3, X35226, X35227), X35253), tdom(X35253), domdomain(2, X35226), domdomain(3, X35227).
diagonal(X35226, X35252) :- true(cell(1, 1, X35226), X35252), true(cell(2, 2, X35226), X35252), true(cell(3, 3, X35226), X35252), tdom(X35252), domdomain(3, X35226).
diagonal(X35226, X35252) :- true(cell(1, 3, X35226), X35252), true(cell(2, 2, X35226), X35252), true(cell(3, 1, X35226), X35252), tdom(X35252), domdomain(3, X35226).
line(X35226, X35233) :- row(X35230, X35226, X35233), domdomain(2, X35230), tdom(X35233), domdomain(3, X35226).
line(X35226, X35233) :- column(X35230, X35226, X35233), domdomain(2, X35230), tdom(X35233), domdomain(3, X35226).
line(X35226, X35232) :- diagonal(X35226, X35232), tdom(X35232), domdomain(3, X35226).
open(X35234) :- true(cell(X35230, X35231, b), X35234), domdomain(2, X35230), domdomain(2, X35231), tdom(X35234).
legal(X35226, mark(X35229, X35230), X35246) :- true(cell(X35229, X35230, b), X35246), true(control(X35226), X35246), tdom(X35246), domdomain(4, X35226), domdomain(2, X35229), domdomain(2, X35230).
legal(xplayer, noop, X35235) :- true(control(oplayer), X35235), tdom(X35235).
legal(oplayer, noop, X35235) :- true(control(xplayer), X35235), tdom(X35235).
goal(xplayer, 100, X35233) :- line(x, X35233), tdom(X35233).
goal(xplayer, 50, X35245) :- not line(x, X35245), not line(o, X35245), not open(X35245), tdom(X35245).
goal(xplayer, 0, X35233) :- line(o, X35233), tdom(X35233).
goal(oplayer, 100, X35233) :- line(o, X35233), tdom(X35233).
goal(oplayer, 50, X35245) :- not line(x, X35245), not line(o, X35245), not open(X35245), tdom(X35245).
goal(oplayer, 0, X35233) :- line(x, X35233), tdom(X35233).
terminal(X35230) :- line(x, X35230), tdom(X35230).
terminal(X35230) :- line(o, X35230), tdom(X35230).
terminal(X35229) :- not open(X35229), tdom(X35229).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
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
