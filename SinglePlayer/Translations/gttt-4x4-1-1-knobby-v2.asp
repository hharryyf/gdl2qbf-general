mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X34877, X34878, x)) :- index(X34877), index(X34878), domdomain(2, X34877), domdomain(2, X34878).
base(cell(X34877, X34878, o)) :- index(X34877), index(X34878), domdomain(2, X34877), domdomain(2, X34878).
base(control(X34877)) :- role(X34877), domdomain(4, X34877).
input(X34875, mark(X34878, X34879)) :- index(X34878), index(X34879), role(X34875), domdomain(4, X34875), domdomain(2, X34878), domdomain(2, X34879).
input(X34875, noop) :- role(X34875), domdomain(4, X34875).
true(control(xplayer), 1).
true(cell(X34877, X34878, x), X34889 + 1) :- does(xplayer, mark(X34877, X34878), X34889), mtdom(X34889), domdomain(2, X34877), domdomain(2, X34878).
true(cell(X34877, X34878, o), X34889 + 1) :- does(oplayer, mark(X34877, X34878), X34889), mtdom(X34889), domdomain(2, X34877), domdomain(2, X34878).
true(cell(X34877, X34878, X34879), X34889 + 1) :- true(cell(X34877, X34878, X34879), X34889), mtdom(X34889), domdomain(2, X34877), domdomain(2, X34878), domdomain(3, X34879).
true(control(xplayer), X34885 + 1) :- true(control(oplayer), X34885), mtdom(X34885).
true(control(oplayer), X34885 + 1) :- true(control(xplayer), X34885), mtdom(X34885).
open(X34903) :- not true(cell(X34881, X34882, x), X34903), not true(cell(X34881, X34882, o), X34903), index(X34881), index(X34882), domdomain(2, X34881), domdomain(2, X34882), tdom(X34903).
legal(X34875, mark(X34878, X34879), X34915) :- not true(cell(X34878, X34879, x), X34915), not true(cell(X34878, X34879, o), X34915), true(control(X34875), X34915), index(X34878), index(X34879), tdom(X34915), domdomain(4, X34875), domdomain(2, X34878), domdomain(2, X34879).
legal(xplayer, noop, X34884) :- true(control(oplayer), X34884), tdom(X34884).
legal(oplayer, noop, X34884) :- true(control(xplayer), X34884), tdom(X34884).
goal(xplayer, 100, X34882) :- line(x, X34882), tdom(X34882).
goal(xplayer, 50, X34894) :- not line(x, X34894), not line(o, X34894), not open(X34894), tdom(X34894).
goal(xplayer, 0, X34882) :- line(o, X34882), tdom(X34882).
goal(oplayer, 100, X34882) :- line(o, X34882), tdom(X34882).
goal(oplayer, 50, X34894) :- not line(x, X34894), not line(o, X34894), not open(X34894), tdom(X34894).
goal(oplayer, 0, X34882) :- line(x, X34882), tdom(X34882).
terminal(X34879) :- line(x, X34879), tdom(X34879).
terminal(X34879) :- line(o, X34879), tdom(X34879).
terminal(X34879) :- not open(X34879), tdom(X34879).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X34875, X34924) :- true(cell(X34881, X34882, X34875), X34924), true(cell(X34881, X34890, X34875), X34924), true(cell(X34881, X34898, X34875), X34924), true(cell(X34905, X34890, X34875), X34924), succ(X34882, X34890), succ(X34881, X34905), succ(X34890, X34898), domdomain(8, X34890), domdomain(9, X34898), domdomain(8, X34881), domdomain(9, X34905), domdomain(8, X34882), domdomain(9, X34890), domdomain(2, X34905), domdomain(2, X34898), domdomain(2, X34890), domdomain(2, X34881), domdomain(2, X34882), tdom(X34924), domdomain(3, X34875).
line(X34875, X34924) :- true(cell(X34881, X34882, X34875), X34924), true(cell(X34881, X34890, X34875), X34924), true(cell(X34881, X34898, X34875), X34924), true(cell(X34905, X34890, X34875), X34924), succ(X34882, X34890), succ(X34905, X34881), succ(X34890, X34898), domdomain(8, X34890), domdomain(9, X34898), domdomain(8, X34905), domdomain(9, X34881), domdomain(8, X34882), domdomain(9, X34890), domdomain(2, X34905), domdomain(2, X34898), domdomain(2, X34890), domdomain(2, X34881), domdomain(2, X34882), tdom(X34924), domdomain(3, X34875).
line(X34875, X34924) :- true(cell(X34881, X34882, X34875), X34924), true(cell(X34889, X34882, X34875), X34924), true(cell(X34897, X34882, X34875), X34924), true(cell(X34889, X34906, X34875), X34924), succ(X34881, X34889), succ(X34889, X34897), succ(X34882, X34906), domdomain(8, X34882), domdomain(9, X34906), domdomain(8, X34889), domdomain(9, X34897), domdomain(8, X34881), domdomain(9, X34889), domdomain(2, X34906), domdomain(2, X34897), domdomain(2, X34889), domdomain(2, X34881), domdomain(2, X34882), tdom(X34924), domdomain(3, X34875).
line(X34874, X34923) :- true(cell(X34880, X34881, X34874), X34923), true(cell(X34888, X34881, X34874), X34923), true(cell(X34896, X34881, X34874), X34923), true(cell(X34888, X34905, X34874), X34923), succ(X34880, X34888), succ(X34888, X34896), succ(X34905, X34881), domdomain(8, X34905), domdomain(9, X34881), domdomain(8, X34888), domdomain(9, X34896), domdomain(8, X34880), domdomain(9, X34888), domdomain(2, X34905), domdomain(2, X34896), domdomain(2, X34888), domdomain(2, X34880), domdomain(2, X34881), tdom(X34923), domdomain(3, X34874).
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
