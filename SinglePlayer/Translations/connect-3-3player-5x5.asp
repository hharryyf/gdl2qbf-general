mtdom(1..25).
role(xplayer).
role(oplayer).
role(zplayer).
base(cell(X48738, X48739, X48740)) :- x(X48738), y(X48739), role(X48740), domdomain(2, X48738), domdomain(2, X48739), domdomain(3, X48740).
base(control(xplayer)).
base(control(oplayer)).
base(control(zplayer)).
input(X48736, drop(X48739)) :- role(X48736), x(X48739), domdomain(3, X48736), domdomain(2, X48739).
input(X48736, noop) :- role(X48736), domdomain(3, X48736).
true(control(xplayer), 1).
legal(X48736, noop, X48751) :- role(X48736), not true(control(X48736), X48751), tdom(X48751), domdomain(3, X48736).
legal(X48736, drop(X48739), X48751) :- true(control(X48736), X48751), columnopen(X48739, X48751), tdom(X48751), domdomain(3, X48736), domdomain(2, X48739).
true(cell(X48738, 1, X48740), X48753 + 1) :- does(X48740, drop(X48738), X48753), columnempty(X48738, X48753), tdom(X48753), mtdom(X48753), domdomain(2, X48738), domdomain(3, X48740).
true(cell(X48738, X48739, X48740), X48766 + 1) :- does(X48740, drop(X48738), X48766), cellopen(X48738, X48739, X48766), succ(X48756, X48739), not cellopen(X48738, X48756, X48766), domdomain(2, X48756), domdomain(7, X48756), domdomain(8, X48739), tdom(X48766), mtdom(X48766), domdomain(2, X48738), domdomain(2, X48739), domdomain(3, X48740).
true(cell(X48738, X48739, X48740), X48750 + 1) :- true(cell(X48738, X48739, X48740), X48750), mtdom(X48750), domdomain(2, X48738), domdomain(2, X48739), domdomain(3, X48740).
true(control(xplayer), X48746 + 1) :- true(control(zplayer), X48746), mtdom(X48746).
true(control(zplayer), X48746 + 1) :- true(control(oplayer), X48746), mtdom(X48746).
true(control(oplayer), X48746 + 1) :- true(control(xplayer), X48746), mtdom(X48746).
terminal(X48740) :- line(xplayer, X48740), tdom(X48740).
terminal(X48740) :- line(oplayer, X48740), tdom(X48740).
terminal(X48740) :- line(zplayer, X48740), tdom(X48740).
terminal(X48740) :- not boardopen(X48740), tdom(X48740).
goal(X48736, 100, X48747) :- line(X48736, X48747), role(X48736), tdom(X48747), domdomain(3, X48736).
goal(xplayer, 100, X48761) :- not line(xplayer, X48761), not line(oplayer, X48761), not line(zplayer, X48761), not boardopen(X48761), tdom(X48761).
goal(oplayer, 0, X48761) :- not line(xplayer, X48761), not line(oplayer, X48761), not line(zplayer, X48761), not boardopen(X48761), tdom(X48761).
goal(zplayer, 0, X48761) :- not line(xplayer, X48761), not line(oplayer, X48761), not line(zplayer, X48761), not boardopen(X48761), tdom(X48761).
goal(xplayer, 0, X48743) :- line(oplayer, X48743), tdom(X48743).
goal(xplayer, 0, X48743) :- line(zplayer, X48743), tdom(X48743).
goal(oplayer, 0, X48743) :- line(xplayer, X48743), tdom(X48743).
goal(oplayer, 0, X48743) :- line(zplayer, X48743), tdom(X48743).
goal(zplayer, 0, X48743) :- line(xplayer, X48743), tdom(X48743).
goal(zplayer, 0, X48743) :- line(oplayer, X48743), tdom(X48743).
cellopen(X48736, X48737, X48777) :- x(X48736), y(X48737), not true(cell(X48736, X48737, xplayer), X48777), not true(cell(X48736, X48737, oplayer), X48777), not true(cell(X48736, X48737, zplayer), X48777), tdom(X48777), domdomain(2, X48736), domdomain(2, X48737).
columnopen(X48736, X48743) :- cellopen(X48736, 5, X48743), tdom(X48743), domdomain(2, X48736).
columnempty(X48736, X48743) :- cellopen(X48736, 1, X48743), tdom(X48743), domdomain(2, X48736).
boardopen(X48744) :- x(X48738), columnopen(X48738, X48744), domdomain(2, X48738), tdom(X48744).
line(X48736, X48772) :- true(cell(X48742, X48743, X48736), X48772), succ(X48742, X48749), succ(X48749, X48754), true(cell(X48749, X48743, X48736), X48772), true(cell(X48754, X48743, X48736), X48772), domdomain(2, X48754), domdomain(2, X48749), domdomain(7, X48749), domdomain(8, X48754), domdomain(7, X48742), domdomain(8, X48749), domdomain(2, X48742), domdomain(2, X48743), tdom(X48772), domdomain(3, X48736).
line(X48736, X48772) :- true(cell(X48742, X48743, X48736), X48772), succ(X48743, X48749), succ(X48749, X48754), true(cell(X48742, X48749, X48736), X48772), true(cell(X48742, X48754, X48736), X48772), domdomain(2, X48754), domdomain(2, X48749), domdomain(7, X48749), domdomain(8, X48754), domdomain(7, X48743), domdomain(8, X48749), domdomain(2, X48742), domdomain(2, X48743), tdom(X48772), domdomain(3, X48736).
line(X48736, X48782) :- true(cell(X48742, X48743, X48736), X48782), succ(X48742, X48749), succ(X48749, X48754), succ(X48743, X48759), succ(X48759, X48764), true(cell(X48749, X48759, X48736), X48782), true(cell(X48754, X48764, X48736), X48782), domdomain(2, X48754), domdomain(2, X48764), domdomain(2, X48749), domdomain(2, X48759), domdomain(7, X48759), domdomain(8, X48764), domdomain(7, X48743), domdomain(8, X48759), domdomain(7, X48749), domdomain(8, X48754), domdomain(7, X48742), domdomain(8, X48749), domdomain(2, X48742), domdomain(2, X48743), tdom(X48782), domdomain(3, X48736).
line(X48736, X48782) :- true(cell(X48742, X48743, X48736), X48782), succ(X48742, X48749), succ(X48749, X48754), succ(X48758, X48743), succ(X48763, X48758), true(cell(X48749, X48758, X48736), X48782), true(cell(X48754, X48763, X48736), X48782), domdomain(2, X48754), domdomain(2, X48763), domdomain(2, X48749), domdomain(2, X48758), domdomain(7, X48763), domdomain(8, X48758), domdomain(7, X48758), domdomain(8, X48743), domdomain(7, X48749), domdomain(8, X48754), domdomain(7, X48742), domdomain(8, X48749), domdomain(2, X48742), domdomain(2, X48743), tdom(X48782), domdomain(3, X48736).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
x(1).
x(2).
x(3).
x(4).
x(5).
y(1).
y(2).
y(3).
y(4).
y(5).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(2, 5).
domdomain(3, oplayer).
domdomain(3, xplayer).
domdomain(3, zplayer).
domdomain(4, 0).
domdomain(4, 100).
domdomain(5, control).
domdomain(6, drop).
domdomain(6, noop).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(7, 4).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(8, 5).
