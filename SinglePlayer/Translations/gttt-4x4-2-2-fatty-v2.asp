mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X33293, X33294, x)) :- index(X33293), index(X33294), domdomain(2, X33293), domdomain(2, X33294).
base(cell(X33293, X33294, o)) :- index(X33293), index(X33294), domdomain(2, X33293), domdomain(2, X33294).
base(control1(X33293)) :- role(X33293), domdomain(4, X33293).
base(control2(X33293)) :- role(X33293), domdomain(4, X33293).
input(X33291, mark(X33294, X33295)) :- index(X33294), index(X33295), role(X33291), domdomain(4, X33291), domdomain(2, X33294), domdomain(2, X33295).
input(X33291, noop) :- role(X33291), domdomain(4, X33291).
true(control1(xplayer), 1).
true(cell(X33293, X33294, x), X33305 + 1) :- does(xplayer, mark(X33293, X33294), X33305), mtdom(X33305), domdomain(2, X33293), domdomain(2, X33294).
true(cell(X33293, X33294, o), X33305 + 1) :- does(oplayer, mark(X33293, X33294), X33305), mtdom(X33305), domdomain(2, X33293), domdomain(2, X33294).
true(cell(X33293, X33294, X33295), X33305 + 1) :- true(cell(X33293, X33294, X33295), X33305), mtdom(X33305), domdomain(2, X33293), domdomain(2, X33294), domdomain(3, X33295).
true(control1(xplayer), X33301 + 1) :- true(control2(oplayer), X33301), mtdom(X33301).
true(control1(oplayer), X33301 + 1) :- true(control2(xplayer), X33301), mtdom(X33301).
true(control2(xplayer), X33301 + 1) :- true(control1(xplayer), X33301), mtdom(X33301).
true(control2(oplayer), X33301 + 1) :- true(control1(oplayer), X33301), mtdom(X33301).
open(X33319) :- not true(cell(X33297, X33298, x), X33319), not true(cell(X33297, X33298, o), X33319), index(X33297), index(X33298), domdomain(2, X33297), domdomain(2, X33298), tdom(X33319).
legal(X33291, mark(X33294, X33295), X33331) :- not true(cell(X33294, X33295, x), X33331), not true(cell(X33294, X33295, o), X33331), true(control1(X33291), X33331), index(X33294), index(X33295), tdom(X33331), domdomain(4, X33291), domdomain(2, X33294), domdomain(2, X33295).
legal(xplayer, noop, X33300) :- true(control1(oplayer), X33300), tdom(X33300).
legal(oplayer, noop, X33300) :- true(control1(xplayer), X33300), tdom(X33300).
legal(X33291, mark(X33294, X33295), X33331) :- not true(cell(X33294, X33295, x), X33331), not true(cell(X33294, X33295, o), X33331), true(control2(X33291), X33331), index(X33294), index(X33295), tdom(X33331), domdomain(4, X33291), domdomain(2, X33294), domdomain(2, X33295).
legal(xplayer, noop, X33300) :- true(control2(oplayer), X33300), tdom(X33300).
legal(oplayer, noop, X33300) :- true(control2(xplayer), X33300), tdom(X33300).
goal(xplayer, 100, X33298) :- line(x, X33298), tdom(X33298).
goal(xplayer, 50, X33310) :- not line(x, X33310), not line(o, X33310), not open(X33310), tdom(X33310).
goal(xplayer, 0, X33298) :- line(o, X33298), tdom(X33298).
goal(oplayer, 100, X33298) :- line(o, X33298), tdom(X33298).
goal(oplayer, 50, X33310) :- not line(x, X33310), not line(o, X33310), not open(X33310), tdom(X33310).
goal(oplayer, 0, X33298) :- line(x, X33298), tdom(X33298).
terminal(X33295) :- line(x, X33295), tdom(X33295).
terminal(X33295) :- line(o, X33295), tdom(X33295).
terminal(X33295) :- not open(X33295), tdom(X33295).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X33290, X33334) :- true(cell(X33296, X33297, X33290), X33334), true(cell(X33296, X33305, X33290), X33334), true(cell(X33312, X33297, X33290), X33334), true(cell(X33312, X33305, X33290), X33334), succ(X33296, X33312), succ(X33297, X33305), domdomain(8, X33297), domdomain(9, X33305), domdomain(8, X33296), domdomain(9, X33312), domdomain(2, X33312), domdomain(2, X33305), domdomain(2, X33296), domdomain(2, X33297), tdom(X33334), domdomain(3, X33290).
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
