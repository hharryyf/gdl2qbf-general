mtdom(1..9).
role(xplayer).
role(oplayer).
base(cell(X46318, X46319, X46320)) :- x(X46318), y(X46319), role(X46320), domdomain(2, X46318), domdomain(2, X46319), domdomain(3, X46320).
base(control(xplayer)).
base(control(oplayer)).
input(X46316, drop(X46319)) :- role(X46316), x(X46319), domdomain(3, X46316), domdomain(2, X46319).
input(X46316, noop) :- role(X46316), domdomain(3, X46316).
true(control(xplayer), 1).
legal(xplayer, noop, X46325) :- true(control(oplayer), X46325), tdom(X46325).
legal(xplayer, drop(X46319), X46331) :- true(control(xplayer), X46331), columnopen(X46319, X46331), tdom(X46331), domdomain(2, X46319).
legal(oplayer, noop, X46325) :- true(control(xplayer), X46325), tdom(X46325).
legal(oplayer, drop(X46319), X46331) :- true(control(oplayer), X46331), columnopen(X46319, X46331), tdom(X46331), domdomain(2, X46319).
true(cell(X46318, 1, X46320), X46333 + 1) :- does(X46320, drop(X46318), X46333), columnempty(X46318, X46333), tdom(X46333), mtdom(X46333), domdomain(2, X46318), domdomain(3, X46320).
true(cell(X46318, X46319, X46320), X46346 + 1) :- does(X46320, drop(X46318), X46346), cellopen(X46318, X46319, X46346), succ(X46336, X46319), not cellopen(X46318, X46336, X46346), domdomain(2, X46336), domdomain(7, X46336), domdomain(8, X46319), tdom(X46346), mtdom(X46346), domdomain(2, X46318), domdomain(2, X46319), domdomain(3, X46320).
true(cell(X46318, X46319, X46320), X46330 + 1) :- true(cell(X46318, X46319, X46320), X46330), mtdom(X46330), domdomain(2, X46318), domdomain(2, X46319), domdomain(3, X46320).
true(control(xplayer), X46326 + 1) :- true(control(oplayer), X46326), mtdom(X46326).
true(control(oplayer), X46326 + 1) :- true(control(xplayer), X46326), mtdom(X46326).
terminal(X46320) :- line(xplayer, X46320), tdom(X46320).
terminal(X46320) :- line(oplayer, X46320), tdom(X46320).
terminal(X46320) :- not boardopen(X46320), tdom(X46320).
goal(xplayer, 100, X46323) :- line(xplayer, X46323), tdom(X46323).
goal(xplayer, 50, X46335) :- not line(xplayer, X46335), not line(oplayer, X46335), not boardopen(X46335), tdom(X46335).
goal(xplayer, 0, X46323) :- line(oplayer, X46323), tdom(X46323).
goal(xplayer, 0, X46333) :- not line(xplayer, X46333), not line(oplayer, X46333), boardopen(X46333), tdom(X46333).
goal(oplayer, 100, X46323) :- line(oplayer, X46323), tdom(X46323).
goal(oplayer, 50, X46335) :- not line(xplayer, X46335), not line(oplayer, X46335), not boardopen(X46335), tdom(X46335).
goal(oplayer, 0, X46323) :- line(xplayer, X46323), tdom(X46323).
goal(oplayer, 0, X46333) :- not line(xplayer, X46333), not line(oplayer, X46333), boardopen(X46333), tdom(X46333).
cellopen(X46316, X46317, X46347) :- x(X46316), y(X46317), not true(cell(X46316, X46317, xplayer), X46347), not true(cell(X46316, X46317, oplayer), X46347), tdom(X46347), domdomain(2, X46316), domdomain(2, X46317).
columnopen(X46316, X46323) :- cellopen(X46316, 4, X46323), tdom(X46323), domdomain(2, X46316).
columnempty(X46316, X46323) :- cellopen(X46316, 1, X46323), tdom(X46323), domdomain(2, X46316).
boardopen(X46324) :- x(X46318), columnopen(X46318, X46324), domdomain(2, X46318), tdom(X46324).
line(X46316, X46352) :- true(cell(X46322, X46323, X46316), X46352), succ(X46322, X46329), succ(X46329, X46334), true(cell(X46329, X46323, X46316), X46352), true(cell(X46334, X46323, X46316), X46352), domdomain(2, X46334), domdomain(2, X46329), domdomain(7, X46329), domdomain(8, X46334), domdomain(7, X46322), domdomain(8, X46329), domdomain(2, X46322), domdomain(2, X46323), tdom(X46352), domdomain(3, X46316).
line(X46316, X46352) :- true(cell(X46322, X46323, X46316), X46352), succ(X46323, X46329), succ(X46329, X46334), true(cell(X46322, X46329, X46316), X46352), true(cell(X46322, X46334, X46316), X46352), domdomain(2, X46334), domdomain(2, X46329), domdomain(7, X46329), domdomain(8, X46334), domdomain(7, X46323), domdomain(8, X46329), domdomain(2, X46322), domdomain(2, X46323), tdom(X46352), domdomain(3, X46316).
line(X46316, X46362) :- true(cell(X46322, X46323, X46316), X46362), succ(X46322, X46329), succ(X46329, X46334), succ(X46323, X46339), succ(X46339, X46344), true(cell(X46329, X46339, X46316), X46362), true(cell(X46334, X46344, X46316), X46362), domdomain(2, X46334), domdomain(2, X46344), domdomain(2, X46329), domdomain(2, X46339), domdomain(7, X46339), domdomain(8, X46344), domdomain(7, X46323), domdomain(8, X46339), domdomain(7, X46329), domdomain(8, X46334), domdomain(7, X46322), domdomain(8, X46329), domdomain(2, X46322), domdomain(2, X46323), tdom(X46362), domdomain(3, X46316).
line(X46316, X46362) :- true(cell(X46322, X46323, X46316), X46362), succ(X46322, X46329), succ(X46329, X46334), succ(X46338, X46323), succ(X46343, X46338), true(cell(X46329, X46338, X46316), X46362), true(cell(X46334, X46343, X46316), X46362), domdomain(2, X46334), domdomain(2, X46343), domdomain(2, X46329), domdomain(2, X46338), domdomain(7, X46343), domdomain(8, X46338), domdomain(7, X46338), domdomain(8, X46323), domdomain(7, X46329), domdomain(8, X46334), domdomain(7, X46322), domdomain(8, X46329), domdomain(2, X46322), domdomain(2, X46323), tdom(X46362), domdomain(3, X46316).
succ(1, 2).
succ(2, 3).
succ(3, 4).
x(1).
x(2).
x(3).
x(4).
y(1).
y(2).
y(3).
y(4).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
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
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
