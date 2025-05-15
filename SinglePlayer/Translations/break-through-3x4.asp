mtdom(1..19).
role(xplayer).
role(oplayer).
true(cell(1, 1, xplayer), 1).
true(cell(2, 1, xplayer), 1).
true(cell(3, 1, xplayer), 1).
true(cell(1, 2, xplayer), 1).
true(cell(2, 2, xplayer), 1).
true(cell(3, 2, xplayer), 1).
true(cell(1, 4, oplayer), 1).
true(cell(2, 4, oplayer), 1).
true(cell(3, 4, oplayer), 1).
true(cell(1, 3, oplayer), 1).
true(cell(2, 3, oplayer), 1).
true(cell(3, 3, oplayer), 1).
true(control(xplayer), 1).
legal(xplayer, move(X63397, X63398, X63397, X63400), X63426) :- true(control(xplayer), X63426), true(cell(X63397, X63398, xplayer), X63426), plusplusy(X63398, X63400), cellempty(X63397, X63400, X63426), domdomain(2, X63398), domdomain(9, X63400), tdom(X63426), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63397), domdomain(3, X63400).
legal(xplayer, move(X63397, X63398, X63399, X63400), X63436) :- true(control(xplayer), X63436), true(cell(X63397, X63398, xplayer), X63436), plusplusy(X63398, X63400), plusplusx(X63397, X63399), not true(cell(X63399, X63400, xplayer), X63436), domdomain(7, X63397), domdomain(8, X63399), domdomain(2, X63398), domdomain(9, X63400), tdom(X63436), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63399), domdomain(3, X63400).
legal(xplayer, move(X63397, X63398, X63399, X63400), X63436) :- true(control(xplayer), X63436), true(cell(X63397, X63398, xplayer), X63436), plusplusy(X63398, X63400), plusplusx(X63399, X63397), not true(cell(X63399, X63400, xplayer), X63436), domdomain(7, X63399), domdomain(8, X63397), domdomain(2, X63398), domdomain(9, X63400), tdom(X63436), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63399), domdomain(3, X63400).
legal(oplayer, move(X63397, X63398, X63397, X63400), X63426) :- true(control(oplayer), X63426), true(cell(X63397, X63398, oplayer), X63426), plusplusy(X63400, X63398), cellempty(X63397, X63400, X63426), domdomain(2, X63400), domdomain(9, X63398), tdom(X63426), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63397), domdomain(3, X63400).
legal(oplayer, move(X63397, X63398, X63399, X63400), X63436) :- true(control(oplayer), X63436), true(cell(X63397, X63398, oplayer), X63436), plusplusy(X63400, X63398), plusplusx(X63397, X63399), not true(cell(X63399, X63400, oplayer), X63436), domdomain(7, X63397), domdomain(8, X63399), domdomain(2, X63400), domdomain(9, X63398), tdom(X63436), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63399), domdomain(3, X63400).
legal(oplayer, move(X63397, X63398, X63399, X63400), X63436) :- true(control(oplayer), X63436), true(cell(X63397, X63398, oplayer), X63436), plusplusy(X63400, X63398), plusplusx(X63399, X63397), not true(cell(X63399, X63400, oplayer), X63436), domdomain(7, X63399), domdomain(8, X63397), domdomain(2, X63400), domdomain(9, X63398), tdom(X63436), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63399), domdomain(3, X63400).
legal(xplayer, noop, X63403) :- true(control(oplayer), X63403), tdom(X63403).
legal(oplayer, noop, X63403) :- true(control(xplayer), X63403), tdom(X63403).
true(cell(X63396, X63397, X63398), X63414 + 1) :- role(X63398), does(X63398, move(X63409, X63410, X63396, X63397), X63414), domdomain(2, X63409), domdomain(3, X63410), mtdom(X63414), domdomain(2, X63396), domdomain(3, X63397), domdomain(4, X63398).
true(cell(X63396, X63397, X63398), X63436 + 1) :- true(cell(X63396, X63397, X63398), X63436), role(X63410), does(X63410, move(X63417, X63418, X63419, X63420), X63436), differentcell(X63417, X63418, X63396, X63397), differentcell(X63419, X63420, X63396, X63397), domdomain(2, X63417), domdomain(3, X63418), domdomain(2, X63419), domdomain(3, X63420), domdomain(4, X63410), mtdom(X63436), domdomain(2, X63396), domdomain(3, X63397), domdomain(4, X63398).
true(control(xplayer), X63404 + 1) :- true(control(oplayer), X63404), mtdom(X63404).
true(control(oplayer), X63404 + 1) :- true(control(xplayer), X63404), mtdom(X63404).
terminal(X63396) :- xplayerwin(X63396), tdom(X63396).
terminal(X63396) :- oplayerwin(X63396), tdom(X63396).
goal(xplayer, 100, X63399) :- xplayerwin(X63399), tdom(X63399).
goal(xplayer, 0, X63401) :- not xplayerwin(X63401), tdom(X63401).
goal(oplayer, 100, X63399) :- oplayerwin(X63399), tdom(X63399).
goal(oplayer, 0, X63401) :- not oplayerwin(X63401), tdom(X63401).
cell(X63394, X63395) :- xindex(X63394), yindex(X63395), domdomain(2, X63394), domdomain(3, X63395).
cellempty(X63394, X63395, X63422) :- cell(X63394, X63395), not true(cell(X63394, X63395, xplayer), X63422), not true(cell(X63394, X63395, oplayer), X63422), tdom(X63422), domdomain(2, X63394), domdomain(3, X63395).
differentcell(X63394, X63395, X63396, X63397) :- cell(X63394, X63395), cell(X63396, X63397), X63394 != X63396, domdomain(2, X63394), domdomain(3, X63395), domdomain(2, X63396), domdomain(3, X63397).
differentcell(X63394, X63395, X63396, X63397) :- cell(X63394, X63395), cell(X63396, X63397), X63395 != X63397, domdomain(2, X63394), domdomain(3, X63395), domdomain(2, X63396), domdomain(3, X63397).
xplayerwin(X63406) :- xindex(X63396), true(cell(X63396, 4, xplayer), X63406), domdomain(2, X63396), tdom(X63406).
oplayerwin(X63406) :- xindex(X63396), true(cell(X63396, 1, oplayer), X63406), domdomain(2, X63396), tdom(X63406).
xplayerwin(X63398) :- not oplayercell(X63398), tdom(X63398).
oplayerwin(X63398) :- not xplayercell(X63398), tdom(X63398).
xplayercell(X63407) :- cell(X63396, X63397), true(cell(X63396, X63397, xplayer), X63407), domdomain(2, X63396), domdomain(3, X63397), tdom(X63407).
oplayercell(X63407) :- cell(X63396, X63397), true(cell(X63396, X63397, oplayer), X63407), domdomain(2, X63396), domdomain(3, X63397), tdom(X63407).
xindex(1).
xindex(2).
xindex(3).
yindex(1).
yindex(2).
yindex(3).
yindex(4).
plusplusx(1, 2).
plusplusx(2, 3).
plusplusy(1, 2).
plusplusy(2, 3).
plusplusy(3, 4).
base(cell(X63396, X63397, X63398)) :- xindex(X63396), yindex(X63397), role(X63398), domdomain(2, X63396), domdomain(3, X63397), domdomain(4, X63398).
base(control(X63396)) :- role(X63396), domdomain(4, X63396).
input(xplayer, move(X63397, X63398, X63397, X63400)) :- xindex(X63397), plusplusy(X63398, X63400), domdomain(2, X63398), domdomain(9, X63400), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63397), domdomain(3, X63400).
input(xplayer, move(X63397, X63398, X63399, X63400)) :- plusplusy(X63398, X63400), plusplusx(X63397, X63399), domdomain(7, X63397), domdomain(8, X63399), domdomain(2, X63398), domdomain(9, X63400), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63399), domdomain(3, X63400).
input(xplayer, move(X63397, X63398, X63399, X63400)) :- plusplusy(X63398, X63400), plusplusx(X63399, X63397), domdomain(7, X63399), domdomain(8, X63397), domdomain(2, X63398), domdomain(9, X63400), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63399), domdomain(3, X63400).
input(oplayer, move(X63397, X63398, X63397, X63400)) :- xindex(X63397), plusplusy(X63400, X63398), domdomain(2, X63400), domdomain(9, X63398), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63397), domdomain(3, X63400).
input(oplayer, move(X63397, X63398, X63399, X63400)) :- plusplusy(X63400, X63398), plusplusx(X63397, X63399), domdomain(7, X63397), domdomain(8, X63399), domdomain(2, X63400), domdomain(9, X63398), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63399), domdomain(3, X63400).
input(oplayer, move(X63397, X63398, X63399, X63400)) :- plusplusy(X63400, X63398), plusplusx(X63399, X63397), domdomain(7, X63399), domdomain(8, X63397), domdomain(2, X63400), domdomain(9, X63398), domdomain(2, X63397), domdomain(3, X63398), domdomain(2, X63399), domdomain(3, X63400).
input(X63393, noop) :- role(X63393), domdomain(4, X63393).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(3, 1).
domdomain(3, 2).
domdomain(3, 3).
domdomain(3, 4).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 100).
domdomain(6, move).
domdomain(6, noop).
domdomain(7, 1).
domdomain(7, 2).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
