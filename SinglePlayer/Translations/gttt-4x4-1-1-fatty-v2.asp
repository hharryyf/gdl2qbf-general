mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X28134, X28135, x)) :- index(X28134), index(X28135), domdomain(2, X28134), domdomain(2, X28135).
base(cell(X28134, X28135, o)) :- index(X28134), index(X28135), domdomain(2, X28134), domdomain(2, X28135).
base(control(X28134)) :- role(X28134), domdomain(4, X28134).
input(X28132, mark(X28135, X28136)) :- index(X28135), index(X28136), role(X28132), domdomain(4, X28132), domdomain(2, X28135), domdomain(2, X28136).
input(X28132, noop) :- role(X28132), domdomain(4, X28132).
true(control(xplayer), 1).
true(cell(X28134, X28135, x), X28146 + 1) :- does(xplayer, mark(X28134, X28135), X28146), mtdom(X28146), domdomain(2, X28134), domdomain(2, X28135).
true(cell(X28134, X28135, o), X28146 + 1) :- does(oplayer, mark(X28134, X28135), X28146), mtdom(X28146), domdomain(2, X28134), domdomain(2, X28135).
true(cell(X28134, X28135, X28136), X28146 + 1) :- true(cell(X28134, X28135, X28136), X28146), mtdom(X28146), domdomain(2, X28134), domdomain(2, X28135), domdomain(3, X28136).
true(control(xplayer), X28142 + 1) :- true(control(oplayer), X28142), mtdom(X28142).
true(control(oplayer), X28142 + 1) :- true(control(xplayer), X28142), mtdom(X28142).
open(X28160) :- not true(cell(X28138, X28139, x), X28160), not true(cell(X28138, X28139, o), X28160), index(X28138), index(X28139), domdomain(2, X28138), domdomain(2, X28139), tdom(X28160).
legal(X28132, mark(X28135, X28136), X28172) :- not true(cell(X28135, X28136, x), X28172), not true(cell(X28135, X28136, o), X28172), true(control(X28132), X28172), index(X28135), index(X28136), tdom(X28172), domdomain(4, X28132), domdomain(2, X28135), domdomain(2, X28136).
legal(xplayer, noop, X28141) :- true(control(oplayer), X28141), tdom(X28141).
legal(oplayer, noop, X28141) :- true(control(xplayer), X28141), tdom(X28141).
goal(xplayer, 100, X28139) :- line(x, X28139), tdom(X28139).
goal(xplayer, 50, X28151) :- not line(x, X28151), not line(o, X28151), not open(X28151), tdom(X28151).
goal(xplayer, 0, X28139) :- line(o, X28139), tdom(X28139).
goal(oplayer, 100, X28139) :- line(o, X28139), tdom(X28139).
goal(oplayer, 50, X28151) :- not line(x, X28151), not line(o, X28151), not open(X28151), tdom(X28151).
goal(oplayer, 0, X28139) :- line(x, X28139), tdom(X28139).
terminal(X28136) :- line(x, X28136), tdom(X28136).
terminal(X28136) :- line(o, X28136), tdom(X28136).
terminal(X28136) :- not open(X28136), tdom(X28136).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X28131, X28175) :- true(cell(X28137, X28138, X28131), X28175), true(cell(X28137, X28146, X28131), X28175), true(cell(X28153, X28138, X28131), X28175), true(cell(X28153, X28146, X28131), X28175), succ(X28137, X28153), succ(X28138, X28146), domdomain(8, X28138), domdomain(9, X28146), domdomain(8, X28137), domdomain(9, X28153), domdomain(2, X28153), domdomain(2, X28146), domdomain(2, X28137), domdomain(2, X28138), tdom(X28175), domdomain(3, X28131).
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
