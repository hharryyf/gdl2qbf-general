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
undrawn(X55865, X55866, X55865, X55868, X55890) :- xindex(X55865), nextXindexXy(X55866, X55868), not true(line(X55865, X55866, X55865, X55868), X55890), domdomain(13, X55866), domdomain(14, X55868), tdom(X55890), domdomain(1, X55865), domdomain(2, X55866), domdomain(1, X55865), domdomain(2, X55868).
undrawn(X55865, X55866, X55867, X55866, X55890) :- nextXindexXx(X55865, X55867), yindex(X55866), not true(line(X55865, X55866, X55867, X55866), X55890), domdomain(2, X55865), domdomain(12, X55867), tdom(X55890), domdomain(1, X55865), domdomain(2, X55866), domdomain(1, X55867), domdomain(2, X55866).
anyXundrawn(X55872) :- undrawn(X55867, X55868, X55869, X55870, X55872), domdomain(1, X55867), domdomain(2, X55868), domdomain(1, X55869), domdomain(2, X55870), tdom(X55872).
legal(X55865, draw(X55868, X55869, X55870, X55871), X55886) :- true(control(X55865), X55886), undrawn(X55868, X55869, X55870, X55871, X55886), tdom(X55886), domdomain(4, X55865), domdomain(1, X55868), domdomain(2, X55869), domdomain(1, X55870), domdomain(2, X55871).
true(line(X55867, X55868, X55869, X55870), X55882 + 1) :- does(X55874, draw(X55867, X55868, X55869, X55870), X55882), domdomain(4, X55874), mtdom(X55882), domdomain(1, X55867), domdomain(2, X55868), domdomain(1, X55869), domdomain(2, X55870).
true(line(X55867, X55868, X55869, X55870), X55881 + 1) :- true(line(X55867, X55868, X55869, X55870), X55881), mtdom(X55881), domdomain(1, X55867), domdomain(2, X55868), domdomain(1, X55869), domdomain(2, X55870).
legal(X55865, noop, X55880) :- role(X55865), not true(control(X55865), X55880), tdom(X55880), domdomain(4, X55865).
vXdrawn(X55865, X55866, X55865, X55868, X55880) :- does(X55872, draw(X55865, X55866, X55865, X55868), X55880), domdomain(4, X55872), tdom(X55880), domdomain(1, X55865), domdomain(2, X55866), domdomain(1, X55865), domdomain(2, X55868).
hXdrawn(X55865, X55866, X55867, X55866, X55880) :- does(X55872, draw(X55865, X55866, X55867, X55866), X55880), domdomain(4, X55872), tdom(X55880), domdomain(1, X55865), domdomain(2, X55866), domdomain(1, X55867), domdomain(2, X55866).
boxXformed(X55865, X55866, X55902) :- vXdrawn(X55865, X55866, X55865, X55873, X55902), true(line(X55865, X55873, X55881, X55873), X55902), true(line(X55865, X55866, X55881, X55866), X55902), true(line(X55881, X55866, X55881, X55873), X55902), domdomain(1, X55881), domdomain(2, X55873), tdom(X55902), domdomain(1, X55865), domdomain(2, X55866).
boxXformed(X55865, X55866, X55902) :- vXdrawn(X55870, X55866, X55870, X55873, X55902), true(line(X55865, X55866, X55870, X55866), X55902), true(line(X55865, X55866, X55865, X55873), X55902), true(line(X55865, X55873, X55870, X55873), X55902), domdomain(1, X55870), domdomain(1, X55870), domdomain(2, X55873), tdom(X55902), domdomain(1, X55865), domdomain(2, X55866).
boxXformed(X55865, X55866, X55902) :- hXdrawn(X55865, X55866, X55872, X55866, X55902), true(line(X55872, X55866, X55872, X55882), X55902), true(line(X55865, X55866, X55865, X55882), X55902), true(line(X55865, X55882, X55872, X55882), X55902), domdomain(2, X55882), domdomain(1, X55872), tdom(X55902), domdomain(1, X55865), domdomain(2, X55866).
boxXformed(X55865, X55866, X55902) :- hXdrawn(X55865, X55871, X55872, X55871, X55902), true(line(X55865, X55866, X55865, X55871), X55902), true(line(X55865, X55866, X55872, X55866), X55902), true(line(X55872, X55866, X55872, X55871), X55902), domdomain(2, X55871), domdomain(1, X55872), domdomain(2, X55871), tdom(X55902), domdomain(1, X55865), domdomain(2, X55866).
anyXboxXformed(X55870) :- boxXformed(X55867, X55868, X55870), domdomain(1, X55867), domdomain(2, X55868), tdom(X55870).
twoXboxesXformed(X55880) :- boxXformed(X55867, X55868, X55880), boxXformed(X55872, X55873, X55880), X55867 != X55872, domdomain(1, X55872), domdomain(2, X55873), domdomain(1, X55867), domdomain(2, X55868), tdom(X55880).
twoXboxesXformed(X55880) :- boxXformed(X55867, X55868, X55880), boxXformed(X55872, X55873, X55880), X55868 != X55873, domdomain(1, X55872), domdomain(2, X55873), domdomain(1, X55867), domdomain(2, X55868), tdom(X55880).
true(boxXcount(X55867, X55868), X55885 + 1) :- true(boxXcount(X55867, X55868), X55885), not true(control(X55867), X55885), mtdom(X55885), domdomain(4, X55867), domdomain(5, X55868).
true(boxXcount(X55867, X55868), X55887 + 1) :- true(boxXcount(X55867, X55868), X55887), true(control(X55867), X55887), not anyXboxXformed(X55887), tdom(X55887), mtdom(X55887), domdomain(4, X55867), domdomain(5, X55868).
true(boxXcount(X55867, X55868), X55894 + 1) :- true(boxXcount(X55867, X55875), X55894), true(control(X55867), X55894), anyXboxXformed(X55894), not twoXboxesXformed(X55894), succ(X55875, X55868), domdomain(8, X55875), domdomain(7, X55868), tdom(X55894), domdomain(5, X55875), mtdom(X55894), domdomain(4, X55867), domdomain(5, X55868).
true(boxXcount(X55867, X55868), X55895 + 1) :- true(boxXcount(X55867, X55875), X55895), true(control(X55867), X55895), twoXboxesXformed(X55895), succ(X55875, X55888), succ(X55888, X55868), domdomain(8, X55888), domdomain(7, X55868), domdomain(8, X55875), domdomain(7, X55888), tdom(X55895), domdomain(5, X55875), mtdom(X55895), domdomain(4, X55867), domdomain(5, X55868).
true(control(X55867), X55877 + 1) :- true(control(X55867), X55877), anyXboxXformed(X55877), tdom(X55877), mtdom(X55877), domdomain(4, X55867).
true(control(xplayer), X55879 + 1) :- true(control(oplayer), X55879), not anyXboxXformed(X55879), tdom(X55879), mtdom(X55879).
true(control(oplayer), X55879 + 1) :- true(control(xplayer), X55879), not anyXboxXformed(X55879), tdom(X55879), mtdom(X55879).
true(box(X55867, X55868, x), X55882 + 1) :- boxXformed(X55867, X55868, X55882), true(control(xplayer), X55882), tdom(X55882), mtdom(X55882), domdomain(1, X55867), domdomain(2, X55868).
true(box(X55867, X55868, o), X55882 + 1) :- boxXformed(X55867, X55868, X55882), true(control(oplayer), X55882), tdom(X55882), mtdom(X55882), domdomain(1, X55867), domdomain(2, X55868).
true(box(X55867, X55868, X55869), X55879 + 1) :- true(box(X55867, X55868, X55869), X55879), mtdom(X55879), domdomain(1, X55867), domdomain(2, X55868), domdomain(3, X55869).
terminal(X55869) :- not anyXundrawn(X55869), tdom(X55869).
xXwins(X55884) :- true(boxXcount(xplayer, X55870), X55884), true(boxXcount(oplayer, X55877), X55884), gt(X55870, X55877), domdomain(7, X55870), domdomain(8, X55877), domdomain(5, X55877), domdomain(5, X55870), tdom(X55884).
oXwins(X55884) :- true(boxXcount(xplayer, X55870), X55884), true(boxXcount(oplayer, X55877), X55884), gt(X55877, X55870), domdomain(7, X55877), domdomain(8, X55870), domdomain(5, X55877), domdomain(5, X55870), tdom(X55884).
oXwins(X55879) :- true(boxXcount(xplayer, X55870), X55879), true(boxXcount(oplayer, X55870), X55879), domdomain(5, X55870), tdom(X55879).
goal(xplayer, 100, X55870) :- xXwins(X55870), tdom(X55870).
goal(xplayer, 0, X55872) :- not xXwins(X55872), tdom(X55872).
goal(oplayer, 100, X55870) :- oXwins(X55870), tdom(X55870).
goal(oplayer, 0, X55872) :- not oXwins(X55872), tdom(X55872).
gt(X55865, X55866) :- succ(X55866, X55865), domdomain(7, X55865), domdomain(8, X55866).
gt(X55865, X55866) :- succ(X55870, X55865), gt(X55870, X55866), succ(X55866, X55881), domdomain(7, X55881), domdomain(7, X55870), domdomain(8, X55870), domdomain(7, X55865), domdomain(8, X55866).
succ(0, 1).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
succ(5, 6).
input(X55865, draw(X55868, X55869, X55868, X55871)) :- role(X55865), xindex(X55868), nextXindexXy(X55869, X55871), domdomain(13, X55869), domdomain(14, X55871), domdomain(4, X55865), domdomain(1, X55868), domdomain(2, X55869), domdomain(1, X55868), domdomain(2, X55871).
input(X55865, draw(X55868, X55869, X55870, X55869)) :- role(X55865), nextXindexXx(X55868, X55870), yindex(X55869), domdomain(2, X55868), domdomain(12, X55870), domdomain(4, X55865), domdomain(1, X55868), domdomain(2, X55869), domdomain(1, X55870), domdomain(2, X55869).
input(X55864, noop) :- role(X55864), domdomain(4, X55864).
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
