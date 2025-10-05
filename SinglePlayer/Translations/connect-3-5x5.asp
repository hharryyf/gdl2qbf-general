mtdom(1..25).
role(xplayer).
role(oplayer).
base(cell(X46685, X46686, X46687)) :- x(X46685), y(X46686), role(X46687), domdomain(2, X46685), domdomain(2, X46686), domdomain(3, X46687).
base(control(xplayer)).
base(control(oplayer)).
input(X46683, drop(X46686)) :- role(X46683), x(X46686), domdomain(3, X46683), domdomain(2, X46686).
input(X46683, noop) :- role(X46683), domdomain(3, X46683).
true(control(xplayer), 1).
legal(xplayer, noop, X46692) :- true(control(oplayer), X46692), tdom(X46692).
legal(xplayer, drop(X46686), X46698) :- true(control(xplayer), X46698), columnopen(X46686, X46698), tdom(X46698), domdomain(2, X46686).
legal(oplayer, noop, X46692) :- true(control(xplayer), X46692), tdom(X46692).
legal(oplayer, drop(X46686), X46698) :- true(control(oplayer), X46698), columnopen(X46686, X46698), tdom(X46698), domdomain(2, X46686).
true(cell(X46685, 1, X46687), X46700 + 1) :- does(X46687, drop(X46685), X46700), columnempty(X46685, X46700), tdom(X46700), mtdom(X46700), domdomain(2, X46685), domdomain(3, X46687).
true(cell(X46685, X46686, X46687), X46713 + 1) :- does(X46687, drop(X46685), X46713), cellopen(X46685, X46686, X46713), succ(X46703, X46686), not cellopen(X46685, X46703, X46713), domdomain(2, X46703), domdomain(7, X46703), domdomain(8, X46686), tdom(X46713), mtdom(X46713), domdomain(2, X46685), domdomain(2, X46686), domdomain(3, X46687).
true(cell(X46685, X46686, X46687), X46697 + 1) :- true(cell(X46685, X46686, X46687), X46697), mtdom(X46697), domdomain(2, X46685), domdomain(2, X46686), domdomain(3, X46687).
true(control(xplayer), X46693 + 1) :- true(control(oplayer), X46693), mtdom(X46693).
true(control(oplayer), X46693 + 1) :- true(control(xplayer), X46693), mtdom(X46693).
terminal(X46687) :- line(xplayer, X46687), tdom(X46687).
terminal(X46687) :- line(oplayer, X46687), tdom(X46687).
terminal(X46687) :- not boardopen(X46687), tdom(X46687).
goal(xplayer, 100, X46690) :- line(xplayer, X46690), tdom(X46690).
goal(xplayer, 50, X46702) :- not line(xplayer, X46702), not line(oplayer, X46702), not boardopen(X46702), tdom(X46702).
goal(xplayer, 0, X46690) :- line(oplayer, X46690), tdom(X46690).
goal(xplayer, 0, X46700) :- not line(xplayer, X46700), not line(oplayer, X46700), boardopen(X46700), tdom(X46700).
goal(oplayer, 100, X46690) :- line(oplayer, X46690), tdom(X46690).
goal(oplayer, 50, X46702) :- not line(xplayer, X46702), not line(oplayer, X46702), not boardopen(X46702), tdom(X46702).
goal(oplayer, 0, X46690) :- line(xplayer, X46690), tdom(X46690).
goal(oplayer, 0, X46700) :- not line(xplayer, X46700), not line(oplayer, X46700), boardopen(X46700), tdom(X46700).
cellopen(X46683, X46684, X46714) :- x(X46683), y(X46684), not true(cell(X46683, X46684, xplayer), X46714), not true(cell(X46683, X46684, oplayer), X46714), tdom(X46714), domdomain(2, X46683), domdomain(2, X46684).
columnopen(X46683, X46690) :- cellopen(X46683, 5, X46690), tdom(X46690), domdomain(2, X46683).
columnempty(X46683, X46690) :- cellopen(X46683, 1, X46690), tdom(X46690), domdomain(2, X46683).
boardopen(X46691) :- x(X46685), columnopen(X46685, X46691), domdomain(2, X46685), tdom(X46691).
line(X46683, X46719) :- true(cell(X46689, X46690, X46683), X46719), succ(X46689, X46696), succ(X46696, X46701), true(cell(X46696, X46690, X46683), X46719), true(cell(X46701, X46690, X46683), X46719), domdomain(2, X46701), domdomain(2, X46696), domdomain(7, X46696), domdomain(8, X46701), domdomain(7, X46689), domdomain(8, X46696), domdomain(2, X46689), domdomain(2, X46690), tdom(X46719), domdomain(3, X46683).
line(X46683, X46719) :- true(cell(X46689, X46690, X46683), X46719), succ(X46690, X46696), succ(X46696, X46701), true(cell(X46689, X46696, X46683), X46719), true(cell(X46689, X46701, X46683), X46719), domdomain(2, X46701), domdomain(2, X46696), domdomain(7, X46696), domdomain(8, X46701), domdomain(7, X46690), domdomain(8, X46696), domdomain(2, X46689), domdomain(2, X46690), tdom(X46719), domdomain(3, X46683).
line(X46683, X46729) :- true(cell(X46689, X46690, X46683), X46729), succ(X46689, X46696), succ(X46696, X46701), succ(X46690, X46706), succ(X46706, X46711), true(cell(X46696, X46706, X46683), X46729), true(cell(X46701, X46711, X46683), X46729), domdomain(2, X46701), domdomain(2, X46711), domdomain(2, X46696), domdomain(2, X46706), domdomain(7, X46706), domdomain(8, X46711), domdomain(7, X46690), domdomain(8, X46706), domdomain(7, X46696), domdomain(8, X46701), domdomain(7, X46689), domdomain(8, X46696), domdomain(2, X46689), domdomain(2, X46690), tdom(X46729), domdomain(3, X46683).
line(X46683, X46729) :- true(cell(X46689, X46690, X46683), X46729), succ(X46689, X46696), succ(X46696, X46701), succ(X46705, X46690), succ(X46710, X46705), true(cell(X46696, X46705, X46683), X46729), true(cell(X46701, X46710, X46683), X46729), domdomain(2, X46701), domdomain(2, X46710), domdomain(2, X46696), domdomain(2, X46705), domdomain(7, X46710), domdomain(8, X46705), domdomain(7, X46705), domdomain(8, X46690), domdomain(7, X46696), domdomain(8, X46701), domdomain(7, X46689), domdomain(8, X46696), domdomain(2, X46689), domdomain(2, X46690), tdom(X46729), domdomain(3, X46683).
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
