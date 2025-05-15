mtdom(1..21).
role(xplayer).
role(oplayer).
base(cell(X49861, X49862, X49863)) :- x(X49861), y(X49862), role(X49863), domdomain(2, X49861), domdomain(2, X49862), domdomain(3, X49863).
base(control(xplayer)).
base(control(oplayer)).
input(X49859, drop(X49862)) :- role(X49859), x(X49862), domdomain(3, X49859), domdomain(2, X49862).
input(X49859, noop) :- role(X49859), domdomain(3, X49859).
true(control(xplayer), 1).
legal(xplayer, noop, X49868) :- true(control(oplayer), X49868), tdom(X49868).
legal(xplayer, drop(X49862), X49874) :- true(control(xplayer), X49874), columnopen(X49862, X49874), tdom(X49874), domdomain(2, X49862).
legal(oplayer, noop, X49868) :- true(control(xplayer), X49868), tdom(X49868).
legal(oplayer, drop(X49862), X49874) :- true(control(oplayer), X49874), columnopen(X49862, X49874), tdom(X49874), domdomain(2, X49862).
true(cell(X49861, 1, X49863), X49876 + 1) :- does(X49863, drop(X49861), X49876), columnempty(X49861, X49876), tdom(X49876), mtdom(X49876), domdomain(2, X49861), domdomain(3, X49863).
true(cell(X49861, X49862, X49863), X49889 + 1) :- does(X49863, drop(X49861), X49889), cellopen(X49861, X49862, X49889), succ(X49879, X49862), not cellopen(X49861, X49879, X49889), domdomain(2, X49879), domdomain(7, X49879), domdomain(8, X49862), tdom(X49889), mtdom(X49889), domdomain(2, X49861), domdomain(2, X49862), domdomain(3, X49863).
true(cell(X49861, X49862, X49863), X49873 + 1) :- true(cell(X49861, X49862, X49863), X49873), mtdom(X49873), domdomain(2, X49861), domdomain(2, X49862), domdomain(3, X49863).
true(control(xplayer), X49869 + 1) :- true(control(oplayer), X49869), mtdom(X49869).
true(control(oplayer), X49869 + 1) :- true(control(xplayer), X49869), mtdom(X49869).
terminal(X49863) :- line(xplayer, X49863), tdom(X49863).
terminal(X49863) :- line(oplayer, X49863), tdom(X49863).
terminal(X49863) :- not boardopen(X49863), tdom(X49863).
goal(xplayer, 100, X49866) :- line(xplayer, X49866), tdom(X49866).
goal(xplayer, 50, X49878) :- not line(xplayer, X49878), not line(oplayer, X49878), not boardopen(X49878), tdom(X49878).
goal(xplayer, 0, X49866) :- line(oplayer, X49866), tdom(X49866).
goal(xplayer, 0, X49876) :- not line(xplayer, X49876), not line(oplayer, X49876), boardopen(X49876), tdom(X49876).
goal(oplayer, 100, X49866) :- line(oplayer, X49866), tdom(X49866).
goal(oplayer, 50, X49878) :- not line(xplayer, X49878), not line(oplayer, X49878), not boardopen(X49878), tdom(X49878).
goal(oplayer, 0, X49866) :- line(xplayer, X49866), tdom(X49866).
goal(oplayer, 0, X49876) :- not line(xplayer, X49876), not line(oplayer, X49876), boardopen(X49876), tdom(X49876).
cellopen(X49859, X49860, X49890) :- x(X49859), y(X49860), not true(cell(X49859, X49860, xplayer), X49890), not true(cell(X49859, X49860, oplayer), X49890), tdom(X49890), domdomain(2, X49859), domdomain(2, X49860).
columnopen(X49859, X49866) :- cellopen(X49859, 5, X49866), tdom(X49866), domdomain(2, X49859).
columnempty(X49859, X49866) :- cellopen(X49859, 1, X49866), tdom(X49866), domdomain(2, X49859).
boardopen(X49867) :- x(X49861), columnopen(X49861, X49867), domdomain(2, X49861), tdom(X49867).
line(X49859, X49908) :- true(cell(X49865, X49866, X49859), X49908), succ(X49865, X49872), succ(X49872, X49877), succ(X49877, X49882), true(cell(X49872, X49866, X49859), X49908), true(cell(X49877, X49866, X49859), X49908), true(cell(X49882, X49866, X49859), X49908), domdomain(2, X49882), domdomain(2, X49877), domdomain(2, X49872), domdomain(7, X49877), domdomain(8, X49882), domdomain(7, X49872), domdomain(8, X49877), domdomain(7, X49865), domdomain(8, X49872), domdomain(2, X49865), domdomain(2, X49866), tdom(X49908), domdomain(3, X49859).
line(X49859, X49908) :- true(cell(X49865, X49866, X49859), X49908), succ(X49866, X49872), succ(X49872, X49877), succ(X49877, X49882), true(cell(X49865, X49872, X49859), X49908), true(cell(X49865, X49877, X49859), X49908), true(cell(X49865, X49882, X49859), X49908), domdomain(2, X49882), domdomain(2, X49877), domdomain(2, X49872), domdomain(7, X49877), domdomain(8, X49882), domdomain(7, X49872), domdomain(8, X49877), domdomain(7, X49866), domdomain(8, X49872), domdomain(2, X49865), domdomain(2, X49866), tdom(X49908), domdomain(3, X49859).
line(X49859, X49923) :- true(cell(X49865, X49866, X49859), X49923), succ(X49865, X49872), succ(X49872, X49877), succ(X49877, X49882), succ(X49866, X49887), succ(X49887, X49892), succ(X49892, X49897), true(cell(X49872, X49887, X49859), X49923), true(cell(X49877, X49892, X49859), X49923), true(cell(X49882, X49897, X49859), X49923), domdomain(2, X49882), domdomain(2, X49897), domdomain(2, X49877), domdomain(2, X49892), domdomain(2, X49872), domdomain(2, X49887), domdomain(7, X49892), domdomain(8, X49897), domdomain(7, X49887), domdomain(8, X49892), domdomain(7, X49866), domdomain(8, X49887), domdomain(7, X49877), domdomain(8, X49882), domdomain(7, X49872), domdomain(8, X49877), domdomain(7, X49865), domdomain(8, X49872), domdomain(2, X49865), domdomain(2, X49866), tdom(X49923), domdomain(3, X49859).
line(X49859, X49923) :- true(cell(X49865, X49866, X49859), X49923), succ(X49865, X49872), succ(X49872, X49877), succ(X49877, X49882), succ(X49886, X49866), succ(X49891, X49886), succ(X49896, X49891), true(cell(X49872, X49886, X49859), X49923), true(cell(X49877, X49891, X49859), X49923), true(cell(X49882, X49896, X49859), X49923), domdomain(2, X49882), domdomain(2, X49896), domdomain(2, X49877), domdomain(2, X49891), domdomain(2, X49872), domdomain(2, X49886), domdomain(7, X49896), domdomain(8, X49891), domdomain(7, X49891), domdomain(8, X49886), domdomain(7, X49886), domdomain(8, X49866), domdomain(7, X49877), domdomain(8, X49882), domdomain(7, X49872), domdomain(8, X49877), domdomain(7, X49865), domdomain(8, X49872), domdomain(2, X49865), domdomain(2, X49866), tdom(X49923), domdomain(3, X49859).
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
