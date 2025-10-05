mtdom(1..29).
role(xplayer).
role(oplayer).
true(cell(1, 1, xplayer), 1).
true(cell(2, 1, xplayer), 1).
true(cell(1, 2, xplayer), 1).
true(cell(2, 2, xplayer), 1).
true(cell(1, 6, oplayer), 1).
true(cell(2, 6, oplayer), 1).
true(cell(1, 5, oplayer), 1).
true(cell(2, 5, oplayer), 1).
true(control(xplayer), 1).
legal(xplayer, move(X62373, X62374, X62373, X62376), X62402) :- true(control(xplayer), X62402), true(cell(X62373, X62374, xplayer), X62402), plusplusy(X62374, X62376), cellempty(X62373, X62376, X62402), domdomain(9, X62374), domdomain(10, X62376), tdom(X62402), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62373), domdomain(3, X62376).
legal(xplayer, move(X62373, X62374, X62375, X62376), X62412) :- true(control(xplayer), X62412), true(cell(X62373, X62374, xplayer), X62412), plusplusy(X62374, X62376), plusplusx(X62373, X62375), not true(cell(X62375, X62376, xplayer), X62412), domdomain(7, X62373), domdomain(8, X62375), domdomain(9, X62374), domdomain(10, X62376), tdom(X62412), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62375), domdomain(3, X62376).
legal(xplayer, move(X62373, X62374, X62375, X62376), X62412) :- true(control(xplayer), X62412), true(cell(X62373, X62374, xplayer), X62412), plusplusy(X62374, X62376), plusplusx(X62375, X62373), not true(cell(X62375, X62376, xplayer), X62412), domdomain(7, X62375), domdomain(8, X62373), domdomain(9, X62374), domdomain(10, X62376), tdom(X62412), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62375), domdomain(3, X62376).
legal(oplayer, move(X62373, X62374, X62373, X62376), X62402) :- true(control(oplayer), X62402), true(cell(X62373, X62374, oplayer), X62402), plusplusy(X62376, X62374), cellempty(X62373, X62376, X62402), domdomain(9, X62376), domdomain(10, X62374), tdom(X62402), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62373), domdomain(3, X62376).
legal(oplayer, move(X62373, X62374, X62375, X62376), X62412) :- true(control(oplayer), X62412), true(cell(X62373, X62374, oplayer), X62412), plusplusy(X62376, X62374), plusplusx(X62373, X62375), not true(cell(X62375, X62376, oplayer), X62412), domdomain(7, X62373), domdomain(8, X62375), domdomain(9, X62376), domdomain(10, X62374), tdom(X62412), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62375), domdomain(3, X62376).
legal(oplayer, move(X62373, X62374, X62375, X62376), X62412) :- true(control(oplayer), X62412), true(cell(X62373, X62374, oplayer), X62412), plusplusy(X62376, X62374), plusplusx(X62375, X62373), not true(cell(X62375, X62376, oplayer), X62412), domdomain(7, X62375), domdomain(8, X62373), domdomain(9, X62376), domdomain(10, X62374), tdom(X62412), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62375), domdomain(3, X62376).
legal(xplayer, noop, X62379) :- true(control(oplayer), X62379), tdom(X62379).
legal(oplayer, noop, X62379) :- true(control(xplayer), X62379), tdom(X62379).
true(cell(X62372, X62373, X62374), X62390 + 1) :- role(X62374), does(X62374, move(X62385, X62386, X62372, X62373), X62390), domdomain(2, X62385), domdomain(3, X62386), mtdom(X62390), domdomain(2, X62372), domdomain(3, X62373), domdomain(4, X62374).
true(cell(X62372, X62373, X62374), X62412 + 1) :- true(cell(X62372, X62373, X62374), X62412), role(X62386), does(X62386, move(X62393, X62394, X62395, X62396), X62412), differentcell(X62393, X62394, X62372, X62373), differentcell(X62395, X62396, X62372, X62373), domdomain(2, X62393), domdomain(3, X62394), domdomain(2, X62395), domdomain(3, X62396), domdomain(4, X62386), mtdom(X62412), domdomain(2, X62372), domdomain(3, X62373), domdomain(4, X62374).
true(control(xplayer), X62380 + 1) :- true(control(oplayer), X62380), mtdom(X62380).
true(control(oplayer), X62380 + 1) :- true(control(xplayer), X62380), mtdom(X62380).
terminal(X62372) :- xplayerwin(X62372), tdom(X62372).
terminal(X62372) :- oplayerwin(X62372), tdom(X62372).
goal(xplayer, 100, X62375) :- xplayerwin(X62375), tdom(X62375).
goal(xplayer, 0, X62377) :- not xplayerwin(X62377), tdom(X62377).
goal(oplayer, 100, X62375) :- oplayerwin(X62375), tdom(X62375).
goal(oplayer, 0, X62377) :- not oplayerwin(X62377), tdom(X62377).
cell(X62370, X62371) :- xindex(X62370), yindex(X62371), domdomain(2, X62370), domdomain(3, X62371).
cellempty(X62370, X62371, X62398) :- cell(X62370, X62371), not true(cell(X62370, X62371, xplayer), X62398), not true(cell(X62370, X62371, oplayer), X62398), tdom(X62398), domdomain(2, X62370), domdomain(3, X62371).
differentcell(X62370, X62371, X62372, X62373) :- cell(X62370, X62371), cell(X62372, X62373), X62370 != X62372, domdomain(2, X62370), domdomain(3, X62371), domdomain(2, X62372), domdomain(3, X62373).
differentcell(X62370, X62371, X62372, X62373) :- cell(X62370, X62371), cell(X62372, X62373), X62371 != X62373, domdomain(2, X62370), domdomain(3, X62371), domdomain(2, X62372), domdomain(3, X62373).
xplayerwin(X62382) :- xindex(X62372), true(cell(X62372, 6, xplayer), X62382), domdomain(2, X62372), tdom(X62382).
oplayerwin(X62382) :- xindex(X62372), true(cell(X62372, 1, oplayer), X62382), domdomain(2, X62372), tdom(X62382).
xplayerwin(X62374) :- not oplayercell(X62374), tdom(X62374).
oplayerwin(X62374) :- not xplayercell(X62374), tdom(X62374).
xplayercell(X62383) :- cell(X62372, X62373), true(cell(X62372, X62373, xplayer), X62383), domdomain(2, X62372), domdomain(3, X62373), tdom(X62383).
oplayercell(X62383) :- cell(X62372, X62373), true(cell(X62372, X62373, oplayer), X62383), domdomain(2, X62372), domdomain(3, X62373), tdom(X62383).
xindex(1).
xindex(2).
yindex(1).
yindex(2).
yindex(3).
yindex(4).
yindex(5).
yindex(6).
plusplusx(1, 2).
plusplusy(1, 2).
plusplusy(2, 3).
plusplusy(3, 4).
plusplusy(4, 5).
plusplusy(5, 6).
base(cell(X62372, X62373, X62374)) :- xindex(X62372), yindex(X62373), role(X62374), domdomain(2, X62372), domdomain(3, X62373), domdomain(4, X62374).
base(control(X62372)) :- role(X62372), domdomain(4, X62372).
input(xplayer, move(X62373, X62374, X62373, X62376)) :- xindex(X62373), plusplusy(X62374, X62376), domdomain(9, X62374), domdomain(10, X62376), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62373), domdomain(3, X62376).
input(xplayer, move(X62373, X62374, X62375, X62376)) :- plusplusy(X62374, X62376), plusplusx(X62373, X62375), domdomain(7, X62373), domdomain(8, X62375), domdomain(9, X62374), domdomain(10, X62376), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62375), domdomain(3, X62376).
input(xplayer, move(X62373, X62374, X62375, X62376)) :- plusplusy(X62374, X62376), plusplusx(X62375, X62373), domdomain(7, X62375), domdomain(8, X62373), domdomain(9, X62374), domdomain(10, X62376), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62375), domdomain(3, X62376).
input(oplayer, move(X62373, X62374, X62373, X62376)) :- xindex(X62373), plusplusy(X62376, X62374), domdomain(9, X62376), domdomain(10, X62374), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62373), domdomain(3, X62376).
input(oplayer, move(X62373, X62374, X62375, X62376)) :- plusplusy(X62376, X62374), plusplusx(X62373, X62375), domdomain(7, X62373), domdomain(8, X62375), domdomain(9, X62376), domdomain(10, X62374), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62375), domdomain(3, X62376).
input(oplayer, move(X62373, X62374, X62375, X62376)) :- plusplusy(X62376, X62374), plusplusx(X62375, X62373), domdomain(7, X62375), domdomain(8, X62373), domdomain(9, X62376), domdomain(10, X62374), domdomain(2, X62373), domdomain(3, X62374), domdomain(2, X62375), domdomain(3, X62376).
input(X62369, noop) :- role(X62369), domdomain(4, X62369).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(3, 1).
domdomain(3, 2).
domdomain(3, 3).
domdomain(3, 4).
domdomain(3, 5).
domdomain(3, 6).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 100).
domdomain(6, move).
domdomain(6, noop).
domdomain(7, 1).
domdomain(8, 2).
domdomain(9, 1).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
domdomain(9, 5).
domdomain(10, 2).
domdomain(10, 3).
domdomain(10, 4).
domdomain(10, 5).
domdomain(10, 6).
