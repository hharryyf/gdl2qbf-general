mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X34931, X34932, b)) :- index(X34931), index(X34932), domdomain(2, X34931), domdomain(2, X34932).
base(cell(X34931, X34932, x)) :- index(X34931), index(X34932), domdomain(2, X34931), domdomain(2, X34932).
base(cell(X34931, X34932, o)) :- index(X34931), index(X34932), domdomain(2, X34931), domdomain(2, X34932).
base(control(X34931)) :- role(X34931), domdomain(4, X34931).
input(X34929, mark(X34932, X34933)) :- index(X34932), index(X34933), role(X34929), domdomain(4, X34929), domdomain(2, X34932), domdomain(2, X34933).
input(X34929, noop) :- role(X34929), domdomain(4, X34929).
true(cell(1, 1, b), 1).
true(cell(1, 2, b), 1).
true(cell(1, 3, b), 1).
true(cell(1, 4, b), 1).
true(cell(2, 1, b), 1).
true(cell(2, 2, b), 1).
true(cell(2, 3, b), 1).
true(cell(2, 4, b), 1).
true(cell(3, 1, b), 1).
true(cell(3, 2, b), 1).
true(cell(3, 3, b), 1).
true(cell(3, 4, b), 1).
true(cell(4, 1, b), 1).
true(cell(4, 2, b), 1).
true(cell(4, 3, b), 1).
true(cell(4, 4, b), 1).
true(control(xplayer), 1).
true(cell(X34931, X34932, x), X34951 + 1) :- does(xplayer, mark(X34931, X34932), X34951), true(cell(X34931, X34932, b), X34951), mtdom(X34951), domdomain(2, X34931), domdomain(2, X34932).
true(cell(X34931, X34932, o), X34951 + 1) :- does(oplayer, mark(X34931, X34932), X34951), true(cell(X34931, X34932, b), X34951), mtdom(X34951), domdomain(2, X34931), domdomain(2, X34932).
true(cell(X34931, X34932, X34933), X34948 + 1) :- true(cell(X34931, X34932, X34933), X34948), X34933 != b, mtdom(X34948), domdomain(2, X34931), domdomain(2, X34932), domdomain(3, X34933).
true(cell(X34931, X34932, b), X34956 + 1) :- does(X34937, mark(X34940, X34941), X34956), true(cell(X34931, X34932, b), X34956), X34931 != X34940, domdomain(4, X34937), domdomain(2, X34940), domdomain(2, X34941), mtdom(X34956), domdomain(2, X34931), domdomain(2, X34932).
true(cell(X34931, X34932, b), X34956 + 1) :- does(X34937, mark(X34940, X34941), X34956), true(cell(X34931, X34932, b), X34956), X34932 != X34941, domdomain(4, X34937), domdomain(2, X34940), domdomain(2, X34941), mtdom(X34956), domdomain(2, X34931), domdomain(2, X34932).
true(control(xplayer), X34939 + 1) :- true(control(oplayer), X34939), mtdom(X34939).
true(control(oplayer), X34939 + 1) :- true(control(xplayer), X34939), mtdom(X34939).
open(X34937) :- true(cell(X34933, X34934, b), X34937), domdomain(2, X34933), domdomain(2, X34934), tdom(X34937).
legal(X34929, mark(X34932, X34933), X34949) :- true(cell(X34932, X34933, b), X34949), true(control(X34929), X34949), tdom(X34949), domdomain(4, X34929), domdomain(2, X34932), domdomain(2, X34933).
legal(xplayer, noop, X34938) :- true(control(oplayer), X34938), tdom(X34938).
legal(oplayer, noop, X34938) :- true(control(xplayer), X34938), tdom(X34938).
goal(xplayer, 100, X34936) :- line(x, X34936), tdom(X34936).
goal(xplayer, 50, X34948) :- not line(x, X34948), not line(o, X34948), not open(X34948), tdom(X34948).
goal(xplayer, 0, X34936) :- line(o, X34936), tdom(X34936).
goal(oplayer, 100, X34936) :- line(o, X34936), tdom(X34936).
goal(oplayer, 50, X34948) :- not line(x, X34948), not line(o, X34948), not open(X34948), tdom(X34948).
goal(oplayer, 0, X34936) :- line(x, X34936), tdom(X34936).
terminal(X34933) :- line(x, X34933), tdom(X34933).
terminal(X34933) :- line(o, X34933), tdom(X34933).
terminal(X34933) :- not open(X34933), tdom(X34933).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X34928, X34972) :- true(cell(X34934, X34935, X34928), X34972), true(cell(X34934, X34943, X34928), X34972), true(cell(X34950, X34935, X34928), X34972), true(cell(X34950, X34943, X34928), X34972), succ(X34934, X34950), succ(X34935, X34943), domdomain(7, X34935), domdomain(8, X34943), domdomain(7, X34934), domdomain(8, X34950), domdomain(2, X34950), domdomain(2, X34943), domdomain(2, X34934), domdomain(2, X34935), tdom(X34972), domdomain(3, X34928).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, b).
domdomain(3, o).
domdomain(3, x).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 50).
domdomain(5, 100).
domdomain(6, mark).
domdomain(6, noop).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
