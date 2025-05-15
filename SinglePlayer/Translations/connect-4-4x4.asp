mtdom(1..15).
role(xplayer).
role(oplayer).
base(cell(X49453, X49454, X49455)) :- x(X49453), y(X49454), role(X49455), domdomain(2, X49453), domdomain(2, X49454), domdomain(3, X49455).
base(control(xplayer)).
base(control(oplayer)).
input(X49451, drop(X49454)) :- role(X49451), x(X49454), domdomain(3, X49451), domdomain(2, X49454).
input(X49451, noop) :- role(X49451), domdomain(3, X49451).
true(control(xplayer), 1).
legal(xplayer, noop, X49460) :- true(control(oplayer), X49460), tdom(X49460).
legal(xplayer, drop(X49454), X49466) :- true(control(xplayer), X49466), columnopen(X49454, X49466), tdom(X49466), domdomain(2, X49454).
legal(oplayer, noop, X49460) :- true(control(xplayer), X49460), tdom(X49460).
legal(oplayer, drop(X49454), X49466) :- true(control(oplayer), X49466), columnopen(X49454, X49466), tdom(X49466), domdomain(2, X49454).
true(cell(X49453, 1, X49455), X49468 + 1) :- does(X49455, drop(X49453), X49468), columnempty(X49453, X49468), tdom(X49468), mtdom(X49468), domdomain(2, X49453), domdomain(3, X49455).
true(cell(X49453, X49454, X49455), X49481 + 1) :- does(X49455, drop(X49453), X49481), cellopen(X49453, X49454, X49481), succ(X49471, X49454), not cellopen(X49453, X49471, X49481), domdomain(2, X49471), domdomain(7, X49471), domdomain(8, X49454), tdom(X49481), mtdom(X49481), domdomain(2, X49453), domdomain(2, X49454), domdomain(3, X49455).
true(cell(X49453, X49454, X49455), X49465 + 1) :- true(cell(X49453, X49454, X49455), X49465), mtdom(X49465), domdomain(2, X49453), domdomain(2, X49454), domdomain(3, X49455).
true(control(xplayer), X49461 + 1) :- true(control(oplayer), X49461), mtdom(X49461).
true(control(oplayer), X49461 + 1) :- true(control(xplayer), X49461), mtdom(X49461).
terminal(X49455) :- line(xplayer, X49455), tdom(X49455).
terminal(X49455) :- line(oplayer, X49455), tdom(X49455).
terminal(X49455) :- not boardopen(X49455), tdom(X49455).
goal(xplayer, 100, X49458) :- line(xplayer, X49458), tdom(X49458).
goal(xplayer, 50, X49470) :- not line(xplayer, X49470), not line(oplayer, X49470), not boardopen(X49470), tdom(X49470).
goal(xplayer, 0, X49458) :- line(oplayer, X49458), tdom(X49458).
goal(xplayer, 0, X49468) :- not line(xplayer, X49468), not line(oplayer, X49468), boardopen(X49468), tdom(X49468).
goal(oplayer, 100, X49458) :- line(oplayer, X49458), tdom(X49458).
goal(oplayer, 50, X49470) :- not line(xplayer, X49470), not line(oplayer, X49470), not boardopen(X49470), tdom(X49470).
goal(oplayer, 0, X49458) :- line(xplayer, X49458), tdom(X49458).
goal(oplayer, 0, X49468) :- not line(xplayer, X49468), not line(oplayer, X49468), boardopen(X49468), tdom(X49468).
cellopen(X49451, X49452, X49482) :- x(X49451), y(X49452), not true(cell(X49451, X49452, xplayer), X49482), not true(cell(X49451, X49452, oplayer), X49482), tdom(X49482), domdomain(2, X49451), domdomain(2, X49452).
columnopen(X49451, X49458) :- cellopen(X49451, 4, X49458), tdom(X49458), domdomain(2, X49451).
columnempty(X49451, X49458) :- cellopen(X49451, 1, X49458), tdom(X49458), domdomain(2, X49451).
boardopen(X49459) :- x(X49453), columnopen(X49453, X49459), domdomain(2, X49453), tdom(X49459).
line(X49451, X49500) :- true(cell(X49457, X49458, X49451), X49500), succ(X49457, X49464), succ(X49464, X49469), succ(X49469, X49474), true(cell(X49464, X49458, X49451), X49500), true(cell(X49469, X49458, X49451), X49500), true(cell(X49474, X49458, X49451), X49500), domdomain(2, X49474), domdomain(2, X49469), domdomain(2, X49464), domdomain(7, X49469), domdomain(8, X49474), domdomain(7, X49464), domdomain(8, X49469), domdomain(7, X49457), domdomain(8, X49464), domdomain(2, X49457), domdomain(2, X49458), tdom(X49500), domdomain(3, X49451).
line(X49451, X49500) :- true(cell(X49457, X49458, X49451), X49500), succ(X49458, X49464), succ(X49464, X49469), succ(X49469, X49474), true(cell(X49457, X49464, X49451), X49500), true(cell(X49457, X49469, X49451), X49500), true(cell(X49457, X49474, X49451), X49500), domdomain(2, X49474), domdomain(2, X49469), domdomain(2, X49464), domdomain(7, X49469), domdomain(8, X49474), domdomain(7, X49464), domdomain(8, X49469), domdomain(7, X49458), domdomain(8, X49464), domdomain(2, X49457), domdomain(2, X49458), tdom(X49500), domdomain(3, X49451).
line(X49451, X49515) :- true(cell(X49457, X49458, X49451), X49515), succ(X49457, X49464), succ(X49464, X49469), succ(X49469, X49474), succ(X49458, X49479), succ(X49479, X49484), succ(X49484, X49489), true(cell(X49464, X49479, X49451), X49515), true(cell(X49469, X49484, X49451), X49515), true(cell(X49474, X49489, X49451), X49515), domdomain(2, X49474), domdomain(2, X49489), domdomain(2, X49469), domdomain(2, X49484), domdomain(2, X49464), domdomain(2, X49479), domdomain(7, X49484), domdomain(8, X49489), domdomain(7, X49479), domdomain(8, X49484), domdomain(7, X49458), domdomain(8, X49479), domdomain(7, X49469), domdomain(8, X49474), domdomain(7, X49464), domdomain(8, X49469), domdomain(7, X49457), domdomain(8, X49464), domdomain(2, X49457), domdomain(2, X49458), tdom(X49515), domdomain(3, X49451).
line(X49451, X49515) :- true(cell(X49457, X49458, X49451), X49515), succ(X49457, X49464), succ(X49464, X49469), succ(X49469, X49474), succ(X49478, X49458), succ(X49483, X49478), succ(X49488, X49483), true(cell(X49464, X49478, X49451), X49515), true(cell(X49469, X49483, X49451), X49515), true(cell(X49474, X49488, X49451), X49515), domdomain(2, X49474), domdomain(2, X49488), domdomain(2, X49469), domdomain(2, X49483), domdomain(2, X49464), domdomain(2, X49478), domdomain(7, X49488), domdomain(8, X49483), domdomain(7, X49483), domdomain(8, X49478), domdomain(7, X49478), domdomain(8, X49458), domdomain(7, X49469), domdomain(8, X49474), domdomain(7, X49464), domdomain(8, X49469), domdomain(7, X49457), domdomain(8, X49464), domdomain(2, X49457), domdomain(2, X49458), tdom(X49515), domdomain(3, X49451).
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
