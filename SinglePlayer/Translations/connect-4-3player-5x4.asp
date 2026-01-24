mtdom(1..20).
role(xplayer).
role(oplayer).
role(zplayer).
base(cell(X51736, X51737, X51738)) :- x(X51736), y(X51737), role(X51738), domdomain(7, X51737), domdomain(2, X51736), domdomain(2, X51737), domdomain(3, X51738).
base(control(xplayer)).
base(control(oplayer)).
base(control(zplayer)).
input(X51734, drop(X51737)) :- role(X51734), x(X51737), domdomain(3, X51734), domdomain(2, X51737).
input(X51734, noop) :- role(X51734), domdomain(3, X51734).
true(control(xplayer), 1).
legal(X51734, noop, X51749) :- role(X51734), not true(control(X51734), X51749), tdom(X51749), domdomain(3, X51734).
legal(X51734, drop(X51737), X51749) :- true(control(X51734), X51749), columnopen(X51737, X51749), tdom(X51749), domdomain(3, X51734), domdomain(2, X51737).
true(cell(X51736, 1, X51738), X51751 + 1) :- does(X51738, drop(X51736), X51751), columnempty(X51736, X51751), tdom(X51751), mtdom(X51751), domdomain(2, X51736), domdomain(3, X51738).
true(cell(X51736, X51737, X51738), X51764 + 1) :- does(X51738, drop(X51736), X51764), cellopen(X51736, X51737, X51764), succ(X51754, X51737), not cellopen(X51736, X51754, X51764), domdomain(2, X51754), domdomain(7, X51754), domdomain(8, X51737), tdom(X51764), mtdom(X51764), domdomain(2, X51736), domdomain(2, X51737), domdomain(3, X51738).
true(cell(X51736, X51737, X51738), X51748 + 1) :- true(cell(X51736, X51737, X51738), X51748), mtdom(X51748), domdomain(2, X51736), domdomain(2, X51737), domdomain(3, X51738).
true(control(xplayer), X51744 + 1) :- true(control(zplayer), X51744), mtdom(X51744).
true(control(zplayer), X51744 + 1) :- true(control(oplayer), X51744), mtdom(X51744).
true(control(oplayer), X51744 + 1) :- true(control(xplayer), X51744), mtdom(X51744).
terminal(X51738) :- line(xplayer, X51738), tdom(X51738).
terminal(X51738) :- line(oplayer, X51738), tdom(X51738).
terminal(X51738) :- line(zplayer, X51738), tdom(X51738).
terminal(X51738) :- not boardopen(X51738), tdom(X51738).
goal(X51734, 100, X51745) :- line(X51734, X51745), role(X51734), tdom(X51745), domdomain(3, X51734).
goal(xplayer, 100, X51759) :- not line(xplayer, X51759), not line(oplayer, X51759), not line(zplayer, X51759), not boardopen(X51759), tdom(X51759).
goal(oplayer, 0, X51759) :- not line(xplayer, X51759), not line(oplayer, X51759), not line(zplayer, X51759), not boardopen(X51759), tdom(X51759).
goal(zplayer, 0, X51759) :- not line(xplayer, X51759), not line(oplayer, X51759), not line(zplayer, X51759), not boardopen(X51759), tdom(X51759).
goal(xplayer, 0, X51741) :- line(oplayer, X51741), tdom(X51741).
goal(xplayer, 0, X51741) :- line(zplayer, X51741), tdom(X51741).
goal(oplayer, 0, X51741) :- line(xplayer, X51741), tdom(X51741).
goal(oplayer, 0, X51741) :- line(zplayer, X51741), tdom(X51741).
goal(zplayer, 0, X51741) :- line(xplayer, X51741), tdom(X51741).
goal(zplayer, 0, X51741) :- line(oplayer, X51741), tdom(X51741).
cellopen(X51734, X51735, X51775) :- x(X51734), y(X51735), not true(cell(X51734, X51735, xplayer), X51775), not true(cell(X51734, X51735, oplayer), X51775), not true(cell(X51734, X51735, zplayer), X51775), domdomain(7, X51735), tdom(X51775), domdomain(2, X51734), domdomain(2, X51735).
columnopen(X51734, X51741) :- cellopen(X51734, 4, X51741), tdom(X51741), domdomain(2, X51734).
columnempty(X51734, X51741) :- cellopen(X51734, 1, X51741), tdom(X51741), domdomain(2, X51734).
boardopen(X51742) :- x(X51736), columnopen(X51736, X51742), domdomain(2, X51736), tdom(X51742).
line(X51734, X51783) :- true(cell(X51740, X51741, X51734), X51783), succ(X51740, X51747), succ(X51747, X51752), succ(X51752, X51757), true(cell(X51747, X51741, X51734), X51783), true(cell(X51752, X51741, X51734), X51783), true(cell(X51757, X51741, X51734), X51783), domdomain(2, X51757), domdomain(2, X51752), domdomain(2, X51747), domdomain(7, X51752), domdomain(8, X51757), domdomain(7, X51747), domdomain(8, X51752), domdomain(7, X51740), domdomain(8, X51747), domdomain(2, X51740), domdomain(2, X51741), tdom(X51783), domdomain(3, X51734).
line(X51734, X51783) :- true(cell(X51740, X51741, X51734), X51783), succ(X51741, X51747), succ(X51747, X51752), succ(X51752, X51757), true(cell(X51740, X51747, X51734), X51783), true(cell(X51740, X51752, X51734), X51783), true(cell(X51740, X51757, X51734), X51783), domdomain(2, X51757), domdomain(2, X51752), domdomain(2, X51747), domdomain(7, X51752), domdomain(8, X51757), domdomain(7, X51747), domdomain(8, X51752), domdomain(7, X51741), domdomain(8, X51747), domdomain(2, X51740), domdomain(2, X51741), tdom(X51783), domdomain(3, X51734).
line(X51734, X51798) :- true(cell(X51740, X51741, X51734), X51798), succ(X51740, X51747), succ(X51747, X51752), succ(X51752, X51757), succ(X51741, X51762), succ(X51762, X51767), succ(X51767, X51772), true(cell(X51747, X51762, X51734), X51798), true(cell(X51752, X51767, X51734), X51798), true(cell(X51757, X51772, X51734), X51798), domdomain(2, X51757), domdomain(2, X51772), domdomain(2, X51752), domdomain(2, X51767), domdomain(2, X51747), domdomain(2, X51762), domdomain(7, X51767), domdomain(8, X51772), domdomain(7, X51762), domdomain(8, X51767), domdomain(7, X51741), domdomain(8, X51762), domdomain(7, X51752), domdomain(8, X51757), domdomain(7, X51747), domdomain(8, X51752), domdomain(7, X51740), domdomain(8, X51747), domdomain(2, X51740), domdomain(2, X51741), tdom(X51798), domdomain(3, X51734).
line(X51734, X51798) :- true(cell(X51740, X51741, X51734), X51798), succ(X51740, X51747), succ(X51747, X51752), succ(X51752, X51757), succ(X51761, X51741), succ(X51766, X51761), succ(X51771, X51766), true(cell(X51747, X51761, X51734), X51798), true(cell(X51752, X51766, X51734), X51798), true(cell(X51757, X51771, X51734), X51798), domdomain(2, X51757), domdomain(2, X51771), domdomain(2, X51752), domdomain(2, X51766), domdomain(2, X51747), domdomain(2, X51761), domdomain(7, X51771), domdomain(8, X51766), domdomain(7, X51766), domdomain(8, X51761), domdomain(7, X51761), domdomain(8, X51741), domdomain(7, X51752), domdomain(8, X51757), domdomain(7, X51747), domdomain(8, X51752), domdomain(7, X51740), domdomain(8, X51747), domdomain(2, X51740), domdomain(2, X51741), tdom(X51798), domdomain(3, X51734).
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
