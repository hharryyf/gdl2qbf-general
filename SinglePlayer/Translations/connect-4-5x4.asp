mtdom(1..20).
role(xplayer).
role(oplayer).
base(cell(X49759, X49760, X49761)) :- x(X49759), y(X49760), role(X49761), domdomain(7, X49760), domdomain(2, X49759), domdomain(2, X49760), domdomain(3, X49761).
base(control(xplayer)).
base(control(oplayer)).
input(X49757, drop(X49760)) :- role(X49757), x(X49760), domdomain(3, X49757), domdomain(2, X49760).
input(X49757, noop) :- role(X49757), domdomain(3, X49757).
true(control(xplayer), 1).
legal(xplayer, noop, X49766) :- true(control(oplayer), X49766), tdom(X49766).
legal(xplayer, drop(X49760), X49772) :- true(control(xplayer), X49772), columnopen(X49760, X49772), tdom(X49772), domdomain(2, X49760).
legal(oplayer, noop, X49766) :- true(control(xplayer), X49766), tdom(X49766).
legal(oplayer, drop(X49760), X49772) :- true(control(oplayer), X49772), columnopen(X49760, X49772), tdom(X49772), domdomain(2, X49760).
true(cell(X49759, 1, X49761), X49774 + 1) :- does(X49761, drop(X49759), X49774), columnempty(X49759, X49774), tdom(X49774), mtdom(X49774), domdomain(2, X49759), domdomain(3, X49761).
true(cell(X49759, X49760, X49761), X49787 + 1) :- does(X49761, drop(X49759), X49787), cellopen(X49759, X49760, X49787), succ(X49777, X49760), not cellopen(X49759, X49777, X49787), domdomain(2, X49777), domdomain(7, X49777), domdomain(8, X49760), tdom(X49787), mtdom(X49787), domdomain(2, X49759), domdomain(2, X49760), domdomain(3, X49761).
true(cell(X49759, X49760, X49761), X49771 + 1) :- true(cell(X49759, X49760, X49761), X49771), mtdom(X49771), domdomain(2, X49759), domdomain(2, X49760), domdomain(3, X49761).
true(control(xplayer), X49767 + 1) :- true(control(oplayer), X49767), mtdom(X49767).
true(control(oplayer), X49767 + 1) :- true(control(xplayer), X49767), mtdom(X49767).
terminal(X49761) :- line(xplayer, X49761), tdom(X49761).
terminal(X49761) :- line(oplayer, X49761), tdom(X49761).
terminal(X49761) :- not boardopen(X49761), tdom(X49761).
goal(xplayer, 100, X49764) :- line(xplayer, X49764), tdom(X49764).
goal(xplayer, 50, X49776) :- not line(xplayer, X49776), not line(oplayer, X49776), not boardopen(X49776), tdom(X49776).
goal(xplayer, 0, X49764) :- line(oplayer, X49764), tdom(X49764).
goal(xplayer, 0, X49774) :- not line(xplayer, X49774), not line(oplayer, X49774), boardopen(X49774), tdom(X49774).
goal(oplayer, 100, X49764) :- line(oplayer, X49764), tdom(X49764).
goal(oplayer, 50, X49776) :- not line(xplayer, X49776), not line(oplayer, X49776), not boardopen(X49776), tdom(X49776).
goal(oplayer, 0, X49764) :- line(xplayer, X49764), tdom(X49764).
goal(oplayer, 0, X49774) :- not line(xplayer, X49774), not line(oplayer, X49774), boardopen(X49774), tdom(X49774).
cellopen(X49757, X49758, X49788) :- x(X49757), y(X49758), not true(cell(X49757, X49758, xplayer), X49788), not true(cell(X49757, X49758, oplayer), X49788), domdomain(7, X49758), tdom(X49788), domdomain(2, X49757), domdomain(2, X49758).
columnopen(X49757, X49764) :- cellopen(X49757, 4, X49764), tdom(X49764), domdomain(2, X49757).
columnempty(X49757, X49764) :- cellopen(X49757, 1, X49764), tdom(X49764), domdomain(2, X49757).
boardopen(X49765) :- x(X49759), columnopen(X49759, X49765), domdomain(2, X49759), tdom(X49765).
line(X49757, X49806) :- true(cell(X49763, X49764, X49757), X49806), succ(X49763, X49770), succ(X49770, X49775), succ(X49775, X49780), true(cell(X49770, X49764, X49757), X49806), true(cell(X49775, X49764, X49757), X49806), true(cell(X49780, X49764, X49757), X49806), domdomain(2, X49780), domdomain(2, X49775), domdomain(2, X49770), domdomain(7, X49775), domdomain(8, X49780), domdomain(7, X49770), domdomain(8, X49775), domdomain(7, X49763), domdomain(8, X49770), domdomain(2, X49763), domdomain(2, X49764), tdom(X49806), domdomain(3, X49757).
line(X49757, X49806) :- true(cell(X49763, X49764, X49757), X49806), succ(X49764, X49770), succ(X49770, X49775), succ(X49775, X49780), true(cell(X49763, X49770, X49757), X49806), true(cell(X49763, X49775, X49757), X49806), true(cell(X49763, X49780, X49757), X49806), domdomain(2, X49780), domdomain(2, X49775), domdomain(2, X49770), domdomain(7, X49775), domdomain(8, X49780), domdomain(7, X49770), domdomain(8, X49775), domdomain(7, X49764), domdomain(8, X49770), domdomain(2, X49763), domdomain(2, X49764), tdom(X49806), domdomain(3, X49757).
line(X49757, X49821) :- true(cell(X49763, X49764, X49757), X49821), succ(X49763, X49770), succ(X49770, X49775), succ(X49775, X49780), succ(X49764, X49785), succ(X49785, X49790), succ(X49790, X49795), true(cell(X49770, X49785, X49757), X49821), true(cell(X49775, X49790, X49757), X49821), true(cell(X49780, X49795, X49757), X49821), domdomain(2, X49780), domdomain(2, X49795), domdomain(2, X49775), domdomain(2, X49790), domdomain(2, X49770), domdomain(2, X49785), domdomain(7, X49790), domdomain(8, X49795), domdomain(7, X49785), domdomain(8, X49790), domdomain(7, X49764), domdomain(8, X49785), domdomain(7, X49775), domdomain(8, X49780), domdomain(7, X49770), domdomain(8, X49775), domdomain(7, X49763), domdomain(8, X49770), domdomain(2, X49763), domdomain(2, X49764), tdom(X49821), domdomain(3, X49757).
line(X49757, X49821) :- true(cell(X49763, X49764, X49757), X49821), succ(X49763, X49770), succ(X49770, X49775), succ(X49775, X49780), succ(X49784, X49764), succ(X49789, X49784), succ(X49794, X49789), true(cell(X49770, X49784, X49757), X49821), true(cell(X49775, X49789, X49757), X49821), true(cell(X49780, X49794, X49757), X49821), domdomain(2, X49780), domdomain(2, X49794), domdomain(2, X49775), domdomain(2, X49789), domdomain(2, X49770), domdomain(2, X49784), domdomain(7, X49794), domdomain(8, X49789), domdomain(7, X49789), domdomain(8, X49784), domdomain(7, X49784), domdomain(8, X49764), domdomain(7, X49775), domdomain(8, X49780), domdomain(7, X49770), domdomain(8, X49775), domdomain(7, X49763), domdomain(8, X49770), domdomain(2, X49763), domdomain(2, X49764), tdom(X49821), domdomain(3, X49757).
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
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(2, 5).
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
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(8, 5).
