mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X34879, X34880, x)) :- index(X34879), index(X34880), domdomain(2, X34879), domdomain(2, X34880).
base(cell(X34879, X34880, o)) :- index(X34879), index(X34880), domdomain(2, X34879), domdomain(2, X34880).
base(control(X34879)) :- role(X34879), domdomain(4, X34879).
input(X34877, mark(X34880, X34881)) :- index(X34880), index(X34881), role(X34877), domdomain(4, X34877), domdomain(2, X34880), domdomain(2, X34881).
input(X34877, noop) :- role(X34877), domdomain(4, X34877).
true(control(xplayer), 1).
true(cell(X34879, X34880, x), X34891 + 1) :- does(xplayer, mark(X34879, X34880), X34891), mtdom(X34891), domdomain(2, X34879), domdomain(2, X34880).
true(cell(X34879, X34880, o), X34891 + 1) :- does(oplayer, mark(X34879, X34880), X34891), mtdom(X34891), domdomain(2, X34879), domdomain(2, X34880).
true(cell(X34879, X34880, X34881), X34891 + 1) :- true(cell(X34879, X34880, X34881), X34891), mtdom(X34891), domdomain(2, X34879), domdomain(2, X34880), domdomain(3, X34881).
true(control(xplayer), X34887 + 1) :- true(control(oplayer), X34887), mtdom(X34887).
true(control(oplayer), X34887 + 1) :- true(control(xplayer), X34887), mtdom(X34887).
open(X34905) :- not true(cell(X34883, X34884, x), X34905), not true(cell(X34883, X34884, o), X34905), index(X34883), index(X34884), domdomain(2, X34883), domdomain(2, X34884), tdom(X34905).
legal(X34877, mark(X34880, X34881), X34917) :- not true(cell(X34880, X34881, x), X34917), not true(cell(X34880, X34881, o), X34917), true(control(X34877), X34917), index(X34880), index(X34881), tdom(X34917), domdomain(4, X34877), domdomain(2, X34880), domdomain(2, X34881).
legal(xplayer, noop, X34886) :- true(control(oplayer), X34886), tdom(X34886).
legal(oplayer, noop, X34886) :- true(control(xplayer), X34886), tdom(X34886).
goal(xplayer, 100, X34884) :- line(x, X34884), tdom(X34884).
goal(xplayer, 50, X34896) :- not line(x, X34896), not line(o, X34896), not open(X34896), tdom(X34896).
goal(xplayer, 0, X34884) :- line(o, X34884), tdom(X34884).
goal(oplayer, 100, X34884) :- line(o, X34884), tdom(X34884).
goal(oplayer, 50, X34896) :- not line(x, X34896), not line(o, X34896), not open(X34896), tdom(X34896).
goal(oplayer, 0, X34884) :- line(x, X34884), tdom(X34884).
terminal(X34881) :- line(x, X34881), tdom(X34881).
terminal(X34881) :- line(o, X34881), tdom(X34881).
terminal(X34881) :- not open(X34881), tdom(X34881).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X34877, X34926) :- true(cell(X34883, X34884, X34877), X34926), true(cell(X34883, X34892, X34877), X34926), true(cell(X34899, X34892, X34877), X34926), true(cell(X34899, X34908, X34877), X34926), succ(X34884, X34892), succ(X34883, X34899), succ(X34892, X34908), domdomain(8, X34892), domdomain(9, X34908), domdomain(8, X34883), domdomain(9, X34899), domdomain(8, X34884), domdomain(9, X34892), domdomain(2, X34908), domdomain(2, X34899), domdomain(2, X34892), domdomain(2, X34883), domdomain(2, X34884), tdom(X34926), domdomain(3, X34877).
line(X34877, X34926) :- true(cell(X34883, X34884, X34877), X34926), true(cell(X34883, X34892, X34877), X34926), true(cell(X34899, X34900, X34877), X34926), true(cell(X34899, X34884, X34877), X34926), succ(X34900, X34884), succ(X34883, X34899), succ(X34884, X34892), domdomain(8, X34884), domdomain(9, X34892), domdomain(8, X34883), domdomain(9, X34899), domdomain(8, X34900), domdomain(9, X34884), domdomain(2, X34899), domdomain(2, X34900), domdomain(2, X34892), domdomain(2, X34883), domdomain(2, X34884), tdom(X34926), domdomain(3, X34877).
line(X34877, X34926) :- true(cell(X34883, X34884, X34877), X34926), true(cell(X34891, X34884, X34877), X34926), true(cell(X34891, X34900, X34877), X34926), true(cell(X34907, X34900, X34877), X34926), succ(X34884, X34900), succ(X34883, X34891), succ(X34891, X34907), domdomain(8, X34891), domdomain(9, X34907), domdomain(8, X34883), domdomain(9, X34891), domdomain(8, X34884), domdomain(9, X34900), domdomain(2, X34907), domdomain(2, X34900), domdomain(2, X34891), domdomain(2, X34883), domdomain(2, X34884), tdom(X34926), domdomain(3, X34877).
line(X34876, X34925) :- true(cell(X34882, X34883, X34876), X34925), true(cell(X34890, X34891, X34876), X34925), true(cell(X34890, X34883, X34876), X34925), true(cell(X34906, X34891, X34876), X34925), succ(X34891, X34883), succ(X34882, X34890), succ(X34890, X34906), domdomain(8, X34890), domdomain(9, X34906), domdomain(8, X34882), domdomain(9, X34890), domdomain(8, X34891), domdomain(9, X34883), domdomain(2, X34906), domdomain(2, X34890), domdomain(2, X34891), domdomain(2, X34882), domdomain(2, X34883), tdom(X34925), domdomain(3, X34876).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, o).
domdomain(3, x).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 50).
domdomain(5, 100).
domdomain(6, control).
domdomain(7, mark).
domdomain(7, noop).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
