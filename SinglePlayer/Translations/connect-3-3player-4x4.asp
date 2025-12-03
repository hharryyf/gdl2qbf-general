mtdom(1..16).
role(xplayer).
role(oplayer).
role(zplayer).
base(cell(X48303, X48304, X48305)) :- x(X48303), y(X48304), role(X48305), domdomain(2, X48303), domdomain(2, X48304), domdomain(3, X48305).
base(control(xplayer)).
base(control(oplayer)).
base(control(zplayer)).
input(X48301, drop(X48304)) :- role(X48301), x(X48304), domdomain(3, X48301), domdomain(2, X48304).
input(X48301, noop) :- role(X48301), domdomain(3, X48301).
true(control(xplayer), 1).
legal(X48301, noop, X48316) :- role(X48301), not true(control(X48301), X48316), tdom(X48316), domdomain(3, X48301).
legal(X48301, drop(X48304), X48316) :- true(control(X48301), X48316), columnopen(X48304, X48316), tdom(X48316), domdomain(3, X48301), domdomain(2, X48304).
true(cell(X48303, 1, X48305), X48318 + 1) :- does(X48305, drop(X48303), X48318), columnempty(X48303, X48318), tdom(X48318), mtdom(X48318), domdomain(2, X48303), domdomain(3, X48305).
true(cell(X48303, X48304, X48305), X48331 + 1) :- does(X48305, drop(X48303), X48331), cellopen(X48303, X48304, X48331), succ(X48321, X48304), not cellopen(X48303, X48321, X48331), domdomain(2, X48321), domdomain(7, X48321), domdomain(8, X48304), tdom(X48331), mtdom(X48331), domdomain(2, X48303), domdomain(2, X48304), domdomain(3, X48305).
true(cell(X48303, X48304, X48305), X48315 + 1) :- true(cell(X48303, X48304, X48305), X48315), mtdom(X48315), domdomain(2, X48303), domdomain(2, X48304), domdomain(3, X48305).
true(control(xplayer), X48311 + 1) :- true(control(zplayer), X48311), mtdom(X48311).
true(control(zplayer), X48311 + 1) :- true(control(oplayer), X48311), mtdom(X48311).
true(control(oplayer), X48311 + 1) :- true(control(xplayer), X48311), mtdom(X48311).
terminal(X48305) :- line(xplayer, X48305), tdom(X48305).
terminal(X48305) :- line(oplayer, X48305), tdom(X48305).
terminal(X48305) :- line(zplayer, X48305), tdom(X48305).
terminal(X48305) :- not boardopen(X48305), tdom(X48305).
goal(X48301, 100, X48312) :- line(X48301, X48312), role(X48301), tdom(X48312), domdomain(3, X48301).
goal(xplayer, 100, X48326) :- not line(xplayer, X48326), not line(oplayer, X48326), not line(zplayer, X48326), not boardopen(X48326), tdom(X48326).
goal(oplayer, 0, X48326) :- not line(xplayer, X48326), not line(oplayer, X48326), not line(zplayer, X48326), not boardopen(X48326), tdom(X48326).
goal(zplayer, 0, X48326) :- not line(xplayer, X48326), not line(oplayer, X48326), not line(zplayer, X48326), not boardopen(X48326), tdom(X48326).
goal(xplayer, 0, X48308) :- line(oplayer, X48308), tdom(X48308).
goal(xplayer, 0, X48308) :- line(zplayer, X48308), tdom(X48308).
goal(oplayer, 0, X48308) :- line(xplayer, X48308), tdom(X48308).
goal(oplayer, 0, X48308) :- line(zplayer, X48308), tdom(X48308).
goal(zplayer, 0, X48308) :- line(xplayer, X48308), tdom(X48308).
goal(zplayer, 0, X48308) :- line(oplayer, X48308), tdom(X48308).
cellopen(X48301, X48302, X48342) :- x(X48301), y(X48302), not true(cell(X48301, X48302, xplayer), X48342), not true(cell(X48301, X48302, oplayer), X48342), not true(cell(X48301, X48302, zplayer), X48342), tdom(X48342), domdomain(2, X48301), domdomain(2, X48302).
columnopen(X48301, X48308) :- cellopen(X48301, 4, X48308), tdom(X48308), domdomain(2, X48301).
columnempty(X48301, X48308) :- cellopen(X48301, 1, X48308), tdom(X48308), domdomain(2, X48301).
boardopen(X48309) :- x(X48303), columnopen(X48303, X48309), domdomain(2, X48303), tdom(X48309).
line(X48301, X48337) :- true(cell(X48307, X48308, X48301), X48337), succ(X48307, X48314), succ(X48314, X48319), true(cell(X48314, X48308, X48301), X48337), true(cell(X48319, X48308, X48301), X48337), domdomain(2, X48319), domdomain(2, X48314), domdomain(7, X48314), domdomain(8, X48319), domdomain(7, X48307), domdomain(8, X48314), domdomain(2, X48307), domdomain(2, X48308), tdom(X48337), domdomain(3, X48301).
line(X48301, X48337) :- true(cell(X48307, X48308, X48301), X48337), succ(X48308, X48314), succ(X48314, X48319), true(cell(X48307, X48314, X48301), X48337), true(cell(X48307, X48319, X48301), X48337), domdomain(2, X48319), domdomain(2, X48314), domdomain(7, X48314), domdomain(8, X48319), domdomain(7, X48308), domdomain(8, X48314), domdomain(2, X48307), domdomain(2, X48308), tdom(X48337), domdomain(3, X48301).
line(X48301, X48347) :- true(cell(X48307, X48308, X48301), X48347), succ(X48307, X48314), succ(X48314, X48319), succ(X48308, X48324), succ(X48324, X48329), true(cell(X48314, X48324, X48301), X48347), true(cell(X48319, X48329, X48301), X48347), domdomain(2, X48319), domdomain(2, X48329), domdomain(2, X48314), domdomain(2, X48324), domdomain(7, X48324), domdomain(8, X48329), domdomain(7, X48308), domdomain(8, X48324), domdomain(7, X48314), domdomain(8, X48319), domdomain(7, X48307), domdomain(8, X48314), domdomain(2, X48307), domdomain(2, X48308), tdom(X48347), domdomain(3, X48301).
line(X48301, X48347) :- true(cell(X48307, X48308, X48301), X48347), succ(X48307, X48314), succ(X48314, X48319), succ(X48323, X48308), succ(X48328, X48323), true(cell(X48314, X48323, X48301), X48347), true(cell(X48319, X48328, X48301), X48347), domdomain(2, X48319), domdomain(2, X48328), domdomain(2, X48314), domdomain(2, X48323), domdomain(7, X48328), domdomain(8, X48323), domdomain(7, X48323), domdomain(8, X48308), domdomain(7, X48314), domdomain(8, X48319), domdomain(7, X48307), domdomain(8, X48314), domdomain(2, X48307), domdomain(2, X48308), tdom(X48347), domdomain(3, X48301).
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
domdomain(3, zplayer).
domdomain(4, 0).
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
