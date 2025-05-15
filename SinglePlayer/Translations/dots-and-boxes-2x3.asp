mtdom(1..17).
role(xplayer).
role(oplayer).
xindex(1).
xindex(2).
xindex(3).
xindex(4).
yindex(1).
yindex(2).
yindex(3).
nextXindexXx(1, 2).
nextXindexXx(2, 3).
nextXindexXx(3, 4).
nextXindexXy(1, 2).
nextXindexXy(2, 3).
true(boxXcount(xplayer, 0), 1).
true(boxXcount(oplayer, 0), 1).
true(control(xplayer), 1).
undrawn(X52516, X52517, X52516, X52519, X52541) :- xindex(X52516), nextXindexXy(X52517, X52519), not true(line(X52516, X52517, X52516, X52519), X52541), domdomain(13, X52517), domdomain(14, X52519), tdom(X52541), domdomain(1, X52516), domdomain(2, X52517), domdomain(1, X52516), domdomain(2, X52519).
undrawn(X52516, X52517, X52518, X52517, X52541) :- nextXindexXx(X52516, X52518), yindex(X52517), not true(line(X52516, X52517, X52518, X52517), X52541), domdomain(2, X52516), domdomain(12, X52518), tdom(X52541), domdomain(1, X52516), domdomain(2, X52517), domdomain(1, X52518), domdomain(2, X52517).
anyXundrawn(X52523) :- undrawn(X52518, X52519, X52520, X52521, X52523), domdomain(1, X52518), domdomain(2, X52519), domdomain(1, X52520), domdomain(2, X52521), tdom(X52523).
legal(X52516, draw(X52519, X52520, X52521, X52522), X52537) :- true(control(X52516), X52537), undrawn(X52519, X52520, X52521, X52522, X52537), tdom(X52537), domdomain(4, X52516), domdomain(1, X52519), domdomain(2, X52520), domdomain(1, X52521), domdomain(2, X52522).
true(line(X52518, X52519, X52520, X52521), X52533 + 1) :- does(X52525, draw(X52518, X52519, X52520, X52521), X52533), domdomain(4, X52525), mtdom(X52533), domdomain(1, X52518), domdomain(2, X52519), domdomain(1, X52520), domdomain(2, X52521).
true(line(X52518, X52519, X52520, X52521), X52532 + 1) :- true(line(X52518, X52519, X52520, X52521), X52532), mtdom(X52532), domdomain(1, X52518), domdomain(2, X52519), domdomain(1, X52520), domdomain(2, X52521).
legal(X52516, noop, X52531) :- role(X52516), not true(control(X52516), X52531), tdom(X52531), domdomain(4, X52516).
vXdrawn(X52516, X52517, X52516, X52519, X52531) :- does(X52523, draw(X52516, X52517, X52516, X52519), X52531), domdomain(4, X52523), tdom(X52531), domdomain(1, X52516), domdomain(2, X52517), domdomain(1, X52516), domdomain(2, X52519).
hXdrawn(X52516, X52517, X52518, X52517, X52531) :- does(X52523, draw(X52516, X52517, X52518, X52517), X52531), domdomain(4, X52523), tdom(X52531), domdomain(1, X52516), domdomain(2, X52517), domdomain(1, X52518), domdomain(2, X52517).
boxXformed(X52516, X52517, X52553) :- vXdrawn(X52516, X52517, X52516, X52524, X52553), true(line(X52516, X52524, X52532, X52524), X52553), true(line(X52516, X52517, X52532, X52517), X52553), true(line(X52532, X52517, X52532, X52524), X52553), domdomain(1, X52532), domdomain(2, X52524), tdom(X52553), domdomain(1, X52516), domdomain(2, X52517).
boxXformed(X52516, X52517, X52553) :- vXdrawn(X52521, X52517, X52521, X52524, X52553), true(line(X52516, X52517, X52521, X52517), X52553), true(line(X52516, X52517, X52516, X52524), X52553), true(line(X52516, X52524, X52521, X52524), X52553), domdomain(1, X52521), domdomain(1, X52521), domdomain(2, X52524), tdom(X52553), domdomain(1, X52516), domdomain(2, X52517).
boxXformed(X52516, X52517, X52553) :- hXdrawn(X52516, X52517, X52523, X52517, X52553), true(line(X52523, X52517, X52523, X52533), X52553), true(line(X52516, X52517, X52516, X52533), X52553), true(line(X52516, X52533, X52523, X52533), X52553), domdomain(2, X52533), domdomain(1, X52523), tdom(X52553), domdomain(1, X52516), domdomain(2, X52517).
boxXformed(X52516, X52517, X52553) :- hXdrawn(X52516, X52522, X52523, X52522, X52553), true(line(X52516, X52517, X52516, X52522), X52553), true(line(X52516, X52517, X52523, X52517), X52553), true(line(X52523, X52517, X52523, X52522), X52553), domdomain(2, X52522), domdomain(1, X52523), domdomain(2, X52522), tdom(X52553), domdomain(1, X52516), domdomain(2, X52517).
anyXboxXformed(X52521) :- boxXformed(X52518, X52519, X52521), domdomain(1, X52518), domdomain(2, X52519), tdom(X52521).
twoXboxesXformed(X52531) :- boxXformed(X52518, X52519, X52531), boxXformed(X52523, X52524, X52531), X52518 != X52523, domdomain(1, X52523), domdomain(2, X52524), domdomain(1, X52518), domdomain(2, X52519), tdom(X52531).
twoXboxesXformed(X52531) :- boxXformed(X52518, X52519, X52531), boxXformed(X52523, X52524, X52531), X52519 != X52524, domdomain(1, X52523), domdomain(2, X52524), domdomain(1, X52518), domdomain(2, X52519), tdom(X52531).
true(boxXcount(X52518, X52519), X52536 + 1) :- true(boxXcount(X52518, X52519), X52536), not true(control(X52518), X52536), mtdom(X52536), domdomain(4, X52518), domdomain(5, X52519).
true(boxXcount(X52518, X52519), X52538 + 1) :- true(boxXcount(X52518, X52519), X52538), true(control(X52518), X52538), not anyXboxXformed(X52538), tdom(X52538), mtdom(X52538), domdomain(4, X52518), domdomain(5, X52519).
true(boxXcount(X52518, X52519), X52545 + 1) :- true(boxXcount(X52518, X52526), X52545), true(control(X52518), X52545), anyXboxXformed(X52545), not twoXboxesXformed(X52545), succ(X52526, X52519), domdomain(8, X52526), domdomain(7, X52519), tdom(X52545), domdomain(5, X52526), mtdom(X52545), domdomain(4, X52518), domdomain(5, X52519).
true(boxXcount(X52518, X52519), X52546 + 1) :- true(boxXcount(X52518, X52526), X52546), true(control(X52518), X52546), twoXboxesXformed(X52546), succ(X52526, X52539), succ(X52539, X52519), domdomain(8, X52539), domdomain(7, X52519), domdomain(8, X52526), domdomain(7, X52539), tdom(X52546), domdomain(5, X52526), mtdom(X52546), domdomain(4, X52518), domdomain(5, X52519).
true(control(X52518), X52528 + 1) :- true(control(X52518), X52528), anyXboxXformed(X52528), tdom(X52528), mtdom(X52528), domdomain(4, X52518).
true(control(xplayer), X52530 + 1) :- true(control(oplayer), X52530), not anyXboxXformed(X52530), tdom(X52530), mtdom(X52530).
true(control(oplayer), X52530 + 1) :- true(control(xplayer), X52530), not anyXboxXformed(X52530), tdom(X52530), mtdom(X52530).
true(box(X52518, X52519, x), X52533 + 1) :- boxXformed(X52518, X52519, X52533), true(control(xplayer), X52533), tdom(X52533), mtdom(X52533), domdomain(1, X52518), domdomain(2, X52519).
true(box(X52518, X52519, o), X52533 + 1) :- boxXformed(X52518, X52519, X52533), true(control(oplayer), X52533), tdom(X52533), mtdom(X52533), domdomain(1, X52518), domdomain(2, X52519).
true(box(X52518, X52519, X52520), X52530 + 1) :- true(box(X52518, X52519, X52520), X52530), mtdom(X52530), domdomain(1, X52518), domdomain(2, X52519), domdomain(3, X52520).
terminal(X52520) :- not anyXundrawn(X52520), tdom(X52520).
xXwins(X52535) :- true(boxXcount(xplayer, X52521), X52535), true(boxXcount(oplayer, X52528), X52535), gt(X52521, X52528), domdomain(7, X52521), domdomain(8, X52528), domdomain(5, X52528), domdomain(5, X52521), tdom(X52535).
oXwins(X52535) :- true(boxXcount(xplayer, X52521), X52535), true(boxXcount(oplayer, X52528), X52535), gt(X52528, X52521), domdomain(7, X52528), domdomain(8, X52521), domdomain(5, X52528), domdomain(5, X52521), tdom(X52535).
oXwins(X52530) :- true(boxXcount(xplayer, X52521), X52530), true(boxXcount(oplayer, X52521), X52530), domdomain(5, X52521), tdom(X52530).
goal(xplayer, 100, X52521) :- xXwins(X52521), tdom(X52521).
goal(xplayer, 0, X52523) :- not xXwins(X52523), tdom(X52523).
goal(oplayer, 100, X52521) :- oXwins(X52521), tdom(X52521).
goal(oplayer, 0, X52523) :- not oXwins(X52523), tdom(X52523).
gt(X52516, X52517) :- succ(X52517, X52516), domdomain(7, X52516), domdomain(8, X52517).
gt(X52516, X52517) :- succ(X52521, X52516), gt(X52521, X52517), succ(X52517, X52532), domdomain(7, X52532), domdomain(7, X52521), domdomain(8, X52521), domdomain(7, X52516), domdomain(8, X52517).
succ(0, 1).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
succ(5, 6).
domdomain(1, 1).
domdomain(1, 2).
domdomain(1, 3).
domdomain(1, 4).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
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
domdomain(6, 0).
domdomain(6, 100).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(7, 4).
domdomain(7, 5).
domdomain(7, 6).
domdomain(8, 0).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(8, 5).
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
domdomain(13, 1).
domdomain(13, 2).
domdomain(14, 2).
domdomain(14, 3).
