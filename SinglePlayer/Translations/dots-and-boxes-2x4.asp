mtdom(1..22).
role(xplayer).
role(oplayer).
xindex(1).
xindex(2).
xindex(3).
xindex(4).
xindex(5).
yindex(1).
yindex(2).
yindex(3).
yindex(4).
nextXindexXx(1, 2).
nextXindexXx(2, 3).
nextXindexXx(3, 4).
nextXindexXx(4, 5).
nextXindexXy(1, 2).
nextXindexXy(2, 3).
nextXindexXy(3, 4).
true(boxXcount(xplayer, 0), 1).
true(boxXcount(oplayer, 0), 1).
true(control(xplayer), 1).
undrawn(X57196, X57197, X57196, X57199, X57221) :- xindex(X57196), nextXindexXy(X57197, X57199), not true(line(X57196, X57197, X57196, X57199), X57221), domdomain(13, X57197), domdomain(14, X57199), tdom(X57221), domdomain(1, X57196), domdomain(2, X57197), domdomain(1, X57196), domdomain(2, X57199).
undrawn(X57196, X57197, X57198, X57197, X57221) :- nextXindexXx(X57196, X57198), yindex(X57197), not true(line(X57196, X57197, X57198, X57197), X57221), domdomain(2, X57196), domdomain(12, X57198), tdom(X57221), domdomain(1, X57196), domdomain(2, X57197), domdomain(1, X57198), domdomain(2, X57197).
anyXundrawn(X57203) :- undrawn(X57198, X57199, X57200, X57201, X57203), domdomain(1, X57198), domdomain(2, X57199), domdomain(1, X57200), domdomain(2, X57201), tdom(X57203).
legal(X57196, draw(X57199, X57200, X57201, X57202), X57217) :- true(control(X57196), X57217), undrawn(X57199, X57200, X57201, X57202, X57217), tdom(X57217), domdomain(4, X57196), domdomain(1, X57199), domdomain(2, X57200), domdomain(1, X57201), domdomain(2, X57202).
true(line(X57198, X57199, X57200, X57201), X57213 + 1) :- does(X57205, draw(X57198, X57199, X57200, X57201), X57213), domdomain(4, X57205), mtdom(X57213), domdomain(1, X57198), domdomain(2, X57199), domdomain(1, X57200), domdomain(2, X57201).
true(line(X57198, X57199, X57200, X57201), X57212 + 1) :- true(line(X57198, X57199, X57200, X57201), X57212), mtdom(X57212), domdomain(1, X57198), domdomain(2, X57199), domdomain(1, X57200), domdomain(2, X57201).
legal(X57196, noop, X57211) :- role(X57196), not true(control(X57196), X57211), tdom(X57211), domdomain(4, X57196).
vXdrawn(X57196, X57197, X57196, X57199, X57211) :- does(X57203, draw(X57196, X57197, X57196, X57199), X57211), domdomain(4, X57203), tdom(X57211), domdomain(1, X57196), domdomain(2, X57197), domdomain(1, X57196), domdomain(2, X57199).
hXdrawn(X57196, X57197, X57198, X57197, X57211) :- does(X57203, draw(X57196, X57197, X57198, X57197), X57211), domdomain(4, X57203), tdom(X57211), domdomain(1, X57196), domdomain(2, X57197), domdomain(1, X57198), domdomain(2, X57197).
boxXformed(X57196, X57197, X57233) :- vXdrawn(X57196, X57197, X57196, X57204, X57233), true(line(X57196, X57204, X57212, X57204), X57233), true(line(X57196, X57197, X57212, X57197), X57233), true(line(X57212, X57197, X57212, X57204), X57233), domdomain(1, X57212), domdomain(2, X57204), tdom(X57233), domdomain(1, X57196), domdomain(2, X57197).
boxXformed(X57196, X57197, X57233) :- vXdrawn(X57201, X57197, X57201, X57204, X57233), true(line(X57196, X57197, X57201, X57197), X57233), true(line(X57196, X57197, X57196, X57204), X57233), true(line(X57196, X57204, X57201, X57204), X57233), domdomain(1, X57201), domdomain(1, X57201), domdomain(2, X57204), tdom(X57233), domdomain(1, X57196), domdomain(2, X57197).
boxXformed(X57196, X57197, X57233) :- hXdrawn(X57196, X57197, X57203, X57197, X57233), true(line(X57203, X57197, X57203, X57213), X57233), true(line(X57196, X57197, X57196, X57213), X57233), true(line(X57196, X57213, X57203, X57213), X57233), domdomain(2, X57213), domdomain(1, X57203), tdom(X57233), domdomain(1, X57196), domdomain(2, X57197).
boxXformed(X57196, X57197, X57233) :- hXdrawn(X57196, X57202, X57203, X57202, X57233), true(line(X57196, X57197, X57196, X57202), X57233), true(line(X57196, X57197, X57203, X57197), X57233), true(line(X57203, X57197, X57203, X57202), X57233), domdomain(2, X57202), domdomain(1, X57203), domdomain(2, X57202), tdom(X57233), domdomain(1, X57196), domdomain(2, X57197).
anyXboxXformed(X57201) :- boxXformed(X57198, X57199, X57201), domdomain(1, X57198), domdomain(2, X57199), tdom(X57201).
twoXboxesXformed(X57211) :- boxXformed(X57198, X57199, X57211), boxXformed(X57203, X57204, X57211), X57198 != X57203, domdomain(1, X57203), domdomain(2, X57204), domdomain(1, X57198), domdomain(2, X57199), tdom(X57211).
twoXboxesXformed(X57211) :- boxXformed(X57198, X57199, X57211), boxXformed(X57203, X57204, X57211), X57199 != X57204, domdomain(1, X57203), domdomain(2, X57204), domdomain(1, X57198), domdomain(2, X57199), tdom(X57211).
true(boxXcount(X57198, X57199), X57216 + 1) :- true(boxXcount(X57198, X57199), X57216), not true(control(X57198), X57216), mtdom(X57216), domdomain(4, X57198), domdomain(5, X57199).
true(boxXcount(X57198, X57199), X57218 + 1) :- true(boxXcount(X57198, X57199), X57218), true(control(X57198), X57218), not anyXboxXformed(X57218), tdom(X57218), mtdom(X57218), domdomain(4, X57198), domdomain(5, X57199).
true(boxXcount(X57198, X57199), X57225 + 1) :- true(boxXcount(X57198, X57206), X57225), true(control(X57198), X57225), anyXboxXformed(X57225), not twoXboxesXformed(X57225), succ(X57206, X57199), domdomain(8, X57206), domdomain(7, X57199), tdom(X57225), domdomain(5, X57206), mtdom(X57225), domdomain(4, X57198), domdomain(5, X57199).
true(boxXcount(X57198, X57199), X57226 + 1) :- true(boxXcount(X57198, X57206), X57226), true(control(X57198), X57226), twoXboxesXformed(X57226), succ(X57206, X57219), succ(X57219, X57199), domdomain(8, X57219), domdomain(7, X57199), domdomain(8, X57206), domdomain(7, X57219), tdom(X57226), domdomain(5, X57206), mtdom(X57226), domdomain(4, X57198), domdomain(5, X57199).
true(control(X57198), X57208 + 1) :- true(control(X57198), X57208), anyXboxXformed(X57208), tdom(X57208), mtdom(X57208), domdomain(4, X57198).
true(control(xplayer), X57210 + 1) :- true(control(oplayer), X57210), not anyXboxXformed(X57210), tdom(X57210), mtdom(X57210).
true(control(oplayer), X57210 + 1) :- true(control(xplayer), X57210), not anyXboxXformed(X57210), tdom(X57210), mtdom(X57210).
true(box(X57198, X57199, x), X57213 + 1) :- boxXformed(X57198, X57199, X57213), true(control(xplayer), X57213), tdom(X57213), mtdom(X57213), domdomain(1, X57198), domdomain(2, X57199).
true(box(X57198, X57199, o), X57213 + 1) :- boxXformed(X57198, X57199, X57213), true(control(oplayer), X57213), tdom(X57213), mtdom(X57213), domdomain(1, X57198), domdomain(2, X57199).
true(box(X57198, X57199, X57200), X57210 + 1) :- true(box(X57198, X57199, X57200), X57210), mtdom(X57210), domdomain(1, X57198), domdomain(2, X57199), domdomain(3, X57200).
terminal(X57200) :- not anyXundrawn(X57200), tdom(X57200).
xXwins(X57215) :- true(boxXcount(xplayer, X57201), X57215), true(boxXcount(oplayer, X57208), X57215), gt(X57201, X57208), domdomain(7, X57201), domdomain(8, X57208), domdomain(5, X57208), domdomain(5, X57201), tdom(X57215).
oXwins(X57215) :- true(boxXcount(xplayer, X57201), X57215), true(boxXcount(oplayer, X57208), X57215), gt(X57208, X57201), domdomain(7, X57208), domdomain(8, X57201), domdomain(5, X57208), domdomain(5, X57201), tdom(X57215).
oXwins(X57210) :- true(boxXcount(xplayer, X57201), X57210), true(boxXcount(oplayer, X57201), X57210), domdomain(5, X57201), tdom(X57210).
goal(xplayer, 100, X57201) :- xXwins(X57201), tdom(X57201).
goal(xplayer, 0, X57203) :- not xXwins(X57203), tdom(X57203).
goal(oplayer, 100, X57201) :- oXwins(X57201), tdom(X57201).
goal(oplayer, 0, X57203) :- not oXwins(X57203), tdom(X57203).
gt(X57196, X57197) :- succ(X57197, X57196), domdomain(7, X57196), domdomain(8, X57197).
gt(X57196, X57197) :- succ(X57201, X57196), gt(X57201, X57197), succ(X57197, X57212), domdomain(7, X57212), domdomain(7, X57201), domdomain(8, X57201), domdomain(7, X57196), domdomain(8, X57197).
succ(0, 1).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
succ(5, 6).
succ(6, 7).
succ(7, 8).
input(X57196, draw(X57199, X57200, X57199, X57202)) :- role(X57196), xindex(X57199), nextXindexXy(X57200, X57202), domdomain(13, X57200), domdomain(14, X57202), domdomain(4, X57196), domdomain(1, X57199), domdomain(2, X57200), domdomain(1, X57199), domdomain(2, X57202).
input(X57196, draw(X57199, X57200, X57201, X57200)) :- role(X57196), nextXindexXx(X57199, X57201), yindex(X57200), domdomain(2, X57199), domdomain(12, X57201), domdomain(4, X57196), domdomain(1, X57199), domdomain(2, X57200), domdomain(1, X57201), domdomain(2, X57200).
input(X57195, noop) :- role(X57195), domdomain(4, X57195).
domdomain(1, 1).
domdomain(1, 2).
domdomain(1, 3).
domdomain(1, 4).
domdomain(1, 5).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, o).
domdomain(3, x).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 1).
domdomain(5, 2).
domdomain(5, 3).
domdomain(5, 4).
domdomain(5, 5).
domdomain(5, 6).
domdomain(5, 7).
domdomain(5, 8).
domdomain(6, 0).
domdomain(6, 100).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(7, 4).
domdomain(7, 5).
domdomain(7, 6).
domdomain(7, 7).
domdomain(7, 8).
domdomain(8, 0).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(8, 5).
domdomain(8, 6).
domdomain(8, 7).
domdomain(9, boxXcount).
domdomain(9, control).
domdomain(10, draw).
domdomain(10, noop).
domdomain(11, box).
domdomain(11, boxXcount).
domdomain(11, control).
domdomain(11, line).
domdomain(12, 2).
domdomain(12, 3).
domdomain(12, 4).
domdomain(12, 5).
domdomain(13, 1).
domdomain(13, 2).
domdomain(13, 3).
domdomain(14, 2).
domdomain(14, 3).
domdomain(14, 4).
