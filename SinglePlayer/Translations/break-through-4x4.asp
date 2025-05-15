mtdom(1..25).
role(xplayer).
role(oplayer).
true(cell(1, 1, xplayer), 1).
true(cell(2, 1, xplayer), 1).
true(cell(3, 1, xplayer), 1).
true(cell(4, 1, xplayer), 1).
true(cell(1, 2, xplayer), 1).
true(cell(2, 2, xplayer), 1).
true(cell(3, 2, xplayer), 1).
true(cell(4, 2, xplayer), 1).
true(cell(1, 4, oplayer), 1).
true(cell(2, 4, oplayer), 1).
true(cell(3, 4, oplayer), 1).
true(cell(4, 4, oplayer), 1).
true(cell(1, 3, oplayer), 1).
true(cell(2, 3, oplayer), 1).
true(cell(3, 3, oplayer), 1).
true(cell(4, 3, oplayer), 1).
true(control(xplayer), 1).
legal(xplayer, move(X65228, X65229, X65228, X65231), X65257) :- true(control(xplayer), X65257), true(cell(X65228, X65229, xplayer), X65257), plusplusy(X65229, X65231), cellempty(X65228, X65231, X65257), domdomain(6, X65229), domdomain(7, X65231), tdom(X65257), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65228), domdomain(2, X65231).
legal(xplayer, move(X65228, X65229, X65230, X65231), X65267) :- true(control(xplayer), X65267), true(cell(X65228, X65229, xplayer), X65267), plusplusy(X65229, X65231), plusplusx(X65228, X65230), not true(cell(X65230, X65231, xplayer), X65267), domdomain(6, X65228), domdomain(7, X65230), domdomain(6, X65229), domdomain(7, X65231), tdom(X65267), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65230), domdomain(2, X65231).
legal(xplayer, move(X65228, X65229, X65230, X65231), X65267) :- true(control(xplayer), X65267), true(cell(X65228, X65229, xplayer), X65267), plusplusy(X65229, X65231), plusplusx(X65230, X65228), not true(cell(X65230, X65231, xplayer), X65267), domdomain(6, X65230), domdomain(7, X65228), domdomain(6, X65229), domdomain(7, X65231), tdom(X65267), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65230), domdomain(2, X65231).
legal(oplayer, move(X65228, X65229, X65228, X65231), X65257) :- true(control(oplayer), X65257), true(cell(X65228, X65229, oplayer), X65257), plusplusy(X65231, X65229), cellempty(X65228, X65231, X65257), domdomain(6, X65231), domdomain(7, X65229), tdom(X65257), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65228), domdomain(2, X65231).
legal(oplayer, move(X65228, X65229, X65230, X65231), X65267) :- true(control(oplayer), X65267), true(cell(X65228, X65229, oplayer), X65267), plusplusy(X65231, X65229), plusplusx(X65228, X65230), not true(cell(X65230, X65231, oplayer), X65267), domdomain(6, X65228), domdomain(7, X65230), domdomain(6, X65231), domdomain(7, X65229), tdom(X65267), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65230), domdomain(2, X65231).
legal(oplayer, move(X65228, X65229, X65230, X65231), X65267) :- true(control(oplayer), X65267), true(cell(X65228, X65229, oplayer), X65267), plusplusy(X65231, X65229), plusplusx(X65230, X65228), not true(cell(X65230, X65231, oplayer), X65267), domdomain(6, X65230), domdomain(7, X65228), domdomain(6, X65231), domdomain(7, X65229), tdom(X65267), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65230), domdomain(2, X65231).
legal(xplayer, noop, X65234) :- true(control(oplayer), X65234), tdom(X65234).
legal(oplayer, noop, X65234) :- true(control(xplayer), X65234), tdom(X65234).
true(cell(X65227, X65228, X65229), X65245 + 1) :- role(X65229), does(X65229, move(X65240, X65241, X65227, X65228), X65245), domdomain(2, X65240), domdomain(2, X65241), mtdom(X65245), domdomain(2, X65227), domdomain(2, X65228), domdomain(3, X65229).
true(cell(X65227, X65228, X65229), X65267 + 1) :- true(cell(X65227, X65228, X65229), X65267), role(X65241), does(X65241, move(X65248, X65249, X65250, X65251), X65267), differentcell(X65248, X65249, X65227, X65228), differentcell(X65250, X65251, X65227, X65228), domdomain(2, X65248), domdomain(2, X65249), domdomain(2, X65250), domdomain(2, X65251), domdomain(3, X65241), mtdom(X65267), domdomain(2, X65227), domdomain(2, X65228), domdomain(3, X65229).
true(control(xplayer), X65235 + 1) :- true(control(oplayer), X65235), mtdom(X65235).
true(control(oplayer), X65235 + 1) :- true(control(xplayer), X65235), mtdom(X65235).
terminal(X65227) :- xplayerwin(X65227), tdom(X65227).
terminal(X65227) :- oplayerwin(X65227), tdom(X65227).
goal(xplayer, 100, X65230) :- xplayerwin(X65230), tdom(X65230).
goal(xplayer, 0, X65232) :- not xplayerwin(X65232), tdom(X65232).
goal(oplayer, 100, X65230) :- oplayerwin(X65230), tdom(X65230).
goal(oplayer, 0, X65232) :- not oplayerwin(X65232), tdom(X65232).
cell(X65225, X65226) :- xindex(X65225), yindex(X65226), domdomain(2, X65225), domdomain(2, X65226).
cellempty(X65225, X65226, X65253) :- cell(X65225, X65226), not true(cell(X65225, X65226, xplayer), X65253), not true(cell(X65225, X65226, oplayer), X65253), tdom(X65253), domdomain(2, X65225), domdomain(2, X65226).
differentcell(X65225, X65226, X65227, X65228) :- cell(X65225, X65226), cell(X65227, X65228), X65225 != X65227, domdomain(2, X65225), domdomain(2, X65226), domdomain(2, X65227), domdomain(2, X65228).
differentcell(X65225, X65226, X65227, X65228) :- cell(X65225, X65226), cell(X65227, X65228), X65226 != X65228, domdomain(2, X65225), domdomain(2, X65226), domdomain(2, X65227), domdomain(2, X65228).
xplayerwin(X65237) :- xindex(X65227), true(cell(X65227, 4, xplayer), X65237), domdomain(2, X65227), tdom(X65237).
oplayerwin(X65237) :- xindex(X65227), true(cell(X65227, 1, oplayer), X65237), domdomain(2, X65227), tdom(X65237).
xplayerwin(X65229) :- not oplayercell(X65229), tdom(X65229).
oplayerwin(X65229) :- not xplayercell(X65229), tdom(X65229).
xplayercell(X65238) :- cell(X65227, X65228), true(cell(X65227, X65228, xplayer), X65238), domdomain(2, X65227), domdomain(2, X65228), tdom(X65238).
oplayercell(X65238) :- cell(X65227, X65228), true(cell(X65227, X65228, oplayer), X65238), domdomain(2, X65227), domdomain(2, X65228), tdom(X65238).
xindex(1).
xindex(2).
xindex(3).
xindex(4).
yindex(1).
yindex(2).
yindex(3).
yindex(4).
plusplusx(1, 2).
plusplusx(2, 3).
plusplusx(3, 4).
plusplusy(1, 2).
plusplusy(2, 3).
plusplusy(3, 4).
base(cell(X65227, X65228, X65229)) :- xindex(X65227), yindex(X65228), role(X65229), domdomain(2, X65227), domdomain(2, X65228), domdomain(3, X65229).
base(control(X65227)) :- role(X65227), domdomain(3, X65227).
input(xplayer, move(X65228, X65229, X65228, X65231)) :- xindex(X65228), plusplusy(X65229, X65231), domdomain(6, X65229), domdomain(7, X65231), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65228), domdomain(2, X65231).
input(xplayer, move(X65228, X65229, X65230, X65231)) :- plusplusy(X65229, X65231), plusplusx(X65228, X65230), domdomain(6, X65228), domdomain(7, X65230), domdomain(6, X65229), domdomain(7, X65231), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65230), domdomain(2, X65231).
input(xplayer, move(X65228, X65229, X65230, X65231)) :- plusplusy(X65229, X65231), plusplusx(X65230, X65228), domdomain(6, X65230), domdomain(7, X65228), domdomain(6, X65229), domdomain(7, X65231), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65230), domdomain(2, X65231).
input(oplayer, move(X65228, X65229, X65228, X65231)) :- xindex(X65228), plusplusy(X65231, X65229), domdomain(6, X65231), domdomain(7, X65229), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65228), domdomain(2, X65231).
input(oplayer, move(X65228, X65229, X65230, X65231)) :- plusplusy(X65231, X65229), plusplusx(X65228, X65230), domdomain(6, X65228), domdomain(7, X65230), domdomain(6, X65231), domdomain(7, X65229), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65230), domdomain(2, X65231).
input(oplayer, move(X65228, X65229, X65230, X65231)) :- plusplusy(X65231, X65229), plusplusx(X65230, X65228), domdomain(6, X65230), domdomain(7, X65228), domdomain(6, X65231), domdomain(7, X65229), domdomain(2, X65228), domdomain(2, X65229), domdomain(2, X65230), domdomain(2, X65231).
input(X65224, noop) :- role(X65224), domdomain(3, X65224).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, oplayer).
domdomain(3, xplayer).
domdomain(4, 0).
domdomain(4, 100).
domdomain(5, move).
domdomain(5, noop).
domdomain(6, 1).
domdomain(6, 2).
domdomain(6, 3).
domdomain(7, 2).
domdomain(7, 3).
domdomain(7, 4).
