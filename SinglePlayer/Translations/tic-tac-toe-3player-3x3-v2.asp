mtdom(1..9).
role(xplayer).
role(oplayer).
role(zplayer).
true(control(xplayer), 1).
succ(1, 2).
succ(2, 3).
true(cell(X38876, X38877, X38878), X38893 + 1) :- does(X38882, mark(X38876, X38877), X38893), sign(X38882, X38878), domdomain(4, X38882), mtdom(X38893), domdomain(2, X38876), domdomain(2, X38877), domdomain(3, X38878).
true(cell(X38876, X38877, X38878), X38888 + 1) :- true(cell(X38876, X38877, X38878), X38888), mtdom(X38888), domdomain(2, X38876), domdomain(2, X38877), domdomain(3, X38878).
true(control(zplayer), X38884 + 1) :- true(control(oplayer), X38884), mtdom(X38884).
true(control(oplayer), X38884 + 1) :- true(control(xplayer), X38884), mtdom(X38884).
true(control(xplayer), X38884 + 1) :- true(control(zplayer), X38884), mtdom(X38884).
row3(X38874, X38875, X38911) :- true(cell(X38874, X38882, X38875), X38911), succ(X38882, X38888), true(cell(X38874, X38888, X38875), X38911), succ(X38888, X38901), true(cell(X38874, X38901, X38875), X38911), domdomain(2, X38901), domdomain(8, X38888), domdomain(9, X38901), domdomain(2, X38888), domdomain(8, X38882), domdomain(9, X38888), domdomain(2, X38882), tdom(X38911), domdomain(2, X38874), domdomain(3, X38875).
column3(X38874, X38875, X38911) :- true(cell(X38881, X38874, X38875), X38911), succ(X38881, X38888), true(cell(X38888, X38874, X38875), X38911), succ(X38888, X38901), true(cell(X38901, X38874, X38875), X38911), domdomain(2, X38901), domdomain(8, X38888), domdomain(9, X38901), domdomain(2, X38888), domdomain(8, X38881), domdomain(9, X38888), domdomain(2, X38881), tdom(X38911), domdomain(2, X38874), domdomain(3, X38875).
diagonal3(X38874, X38920) :- true(cell(X38880, X38881, X38874), X38920), succ(X38880, X38887), succ(X38881, X38892), true(cell(X38887, X38892, X38874), X38920), succ(X38887, X38905), succ(X38892, X38910), true(cell(X38905, X38910, X38874), X38920), domdomain(2, X38905), domdomain(2, X38910), domdomain(8, X38892), domdomain(9, X38910), domdomain(8, X38887), domdomain(9, X38905), domdomain(2, X38887), domdomain(2, X38892), domdomain(8, X38881), domdomain(9, X38892), domdomain(8, X38880), domdomain(9, X38887), domdomain(2, X38880), domdomain(2, X38881), tdom(X38920), domdomain(3, X38874).
diagonal3(X38874, X38920) :- true(cell(X38880, X38881, X38874), X38920), succ(X38886, X38880), succ(X38881, X38892), true(cell(X38886, X38892, X38874), X38920), succ(X38904, X38886), succ(X38892, X38910), true(cell(X38904, X38910, X38874), X38920), domdomain(2, X38904), domdomain(2, X38910), domdomain(8, X38892), domdomain(9, X38910), domdomain(8, X38904), domdomain(9, X38886), domdomain(2, X38886), domdomain(2, X38892), domdomain(8, X38881), domdomain(9, X38892), domdomain(8, X38886), domdomain(9, X38880), domdomain(2, X38880), domdomain(2, X38881), tdom(X38920), domdomain(3, X38874).
line3(X38874, X38881) :- row3(X38878, X38874, X38881), domdomain(2, X38878), tdom(X38881), domdomain(3, X38874).
line3(X38874, X38881) :- column3(X38878, X38874, X38881), domdomain(2, X38878), tdom(X38881), domdomain(3, X38874).
line3(X38874, X38880) :- diagonal3(X38874, X38880), tdom(X38880), domdomain(3, X38874).
open(X38912) :- not true(cell(X38880, X38881, x), X38912), not true(cell(X38880, X38881, o), X38912), not true(cell(X38880, X38881, z), X38912), index(X38880), index(X38881), domdomain(2, X38880), domdomain(2, X38881), tdom(X38912).
legal(X38874, mark(X38877, X38878), X38924) :- not true(cell(X38877, X38878, x), X38924), not true(cell(X38877, X38878, o), X38924), not true(cell(X38877, X38878, z), X38924), index(X38877), index(X38878), true(control(X38874), X38924), tdom(X38924), domdomain(4, X38874), domdomain(2, X38877), domdomain(2, X38878).
legal(X38874, noop, X38889) :- role(X38874), not true(control(X38874), X38889), tdom(X38889), domdomain(4, X38874).
goal(X38874, 100, X38890) :- role(X38874), sign(X38874, X38884), line3(X38884, X38890), domdomain(3, X38884), tdom(X38890), domdomain(4, X38874).
goal(xplayer, 100, X38899) :- not line3(x, X38899), not line3(o, X38899), not line3(z, X38899), not open(X38899), tdom(X38899).
goal(oplayer, 0, X38899) :- not line3(x, X38899), not line3(o, X38899), not line3(z, X38899), not open(X38899), tdom(X38899).
goal(zplayer, 0, X38899) :- not line3(x, X38899), not line3(o, X38899), not line3(z, X38899), not open(X38899), tdom(X38899).
goal(X38874, 0, X38900) :- role(X38874), sign(X38874, X38884), sign(X38888, X38889), X38888 != X38874, line3(X38889, X38900), domdomain(4, X38888), domdomain(3, X38889), domdomain(3, X38884), tdom(X38900), domdomain(4, X38874).
terminal(X38883) :- sign(X38876, X38877), line3(X38877, X38883), domdomain(4, X38876), domdomain(3, X38877), tdom(X38883).
terminal(X38878) :- not open(X38878), tdom(X38878).
sign(xplayer, x).
sign(oplayer, o).
sign(zplayer, z).
index(X38874) :- succ(X38874, X38879), domdomain(8, X38874), domdomain(9, X38879), domdomain(2, X38874).
index(X38874) :- succ(X38878, X38874), domdomain(8, X38878), domdomain(9, X38874), domdomain(2, X38874).
base(cell(X38876, X38877, X38878)) :- index(X38876), index(X38877), sign(X38890, X38878), domdomain(4, X38890), domdomain(2, X38876), domdomain(2, X38877), domdomain(3, X38878).
base(control(X38876)) :- role(X38876), domdomain(4, X38876).
input(X38874, mark(X38877, X38878)) :- role(X38874), index(X38877), index(X38878), domdomain(4, X38874), domdomain(2, X38877), domdomain(2, X38878).
input(X38873, noop) :- role(X38873), domdomain(4, X38873).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(3, o).
domdomain(3, x).
domdomain(3, z).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(4, zplayer).
domdomain(5, 0).
domdomain(5, 100).
domdomain(6, control).
domdomain(7, mark).
domdomain(7, noop).
domdomain(8, 1).
domdomain(8, 2).
domdomain(9, 2).
domdomain(9, 3).
