mtdom(1..16).
role(xplayer).
role(oplayer).
role(zplayer).
base(cell(X51471, X51472, X51473)) :- x(X51471), y(X51472), role(X51473), domdomain(2, X51471), domdomain(2, X51472), domdomain(3, X51473).
base(control(xplayer)).
base(control(oplayer)).
base(control(zplayer)).
input(X51469, drop(X51472)) :- role(X51469), x(X51472), domdomain(3, X51469), domdomain(2, X51472).
input(X51469, noop) :- role(X51469), domdomain(3, X51469).
true(control(xplayer), 1).
legal(X51469, noop, X51484) :- role(X51469), not true(control(X51469), X51484), tdom(X51484), domdomain(3, X51469).
legal(X51469, drop(X51472), X51484) :- true(control(X51469), X51484), columnopen(X51472, X51484), tdom(X51484), domdomain(3, X51469), domdomain(2, X51472).
true(cell(X51471, 1, X51473), X51486 + 1) :- does(X51473, drop(X51471), X51486), columnempty(X51471, X51486), tdom(X51486), mtdom(X51486), domdomain(2, X51471), domdomain(3, X51473).
true(cell(X51471, X51472, X51473), X51499 + 1) :- does(X51473, drop(X51471), X51499), cellopen(X51471, X51472, X51499), succ(X51489, X51472), not cellopen(X51471, X51489, X51499), domdomain(2, X51489), domdomain(7, X51489), domdomain(8, X51472), tdom(X51499), mtdom(X51499), domdomain(2, X51471), domdomain(2, X51472), domdomain(3, X51473).
true(cell(X51471, X51472, X51473), X51483 + 1) :- true(cell(X51471, X51472, X51473), X51483), mtdom(X51483), domdomain(2, X51471), domdomain(2, X51472), domdomain(3, X51473).
true(control(xplayer), X51479 + 1) :- true(control(zplayer), X51479), mtdom(X51479).
true(control(zplayer), X51479 + 1) :- true(control(oplayer), X51479), mtdom(X51479).
true(control(oplayer), X51479 + 1) :- true(control(xplayer), X51479), mtdom(X51479).
terminal(X51473) :- line(xplayer, X51473), tdom(X51473).
terminal(X51473) :- line(oplayer, X51473), tdom(X51473).
terminal(X51473) :- line(zplayer, X51473), tdom(X51473).
terminal(X51473) :- not boardopen(X51473), tdom(X51473).
goal(X51469, 100, X51480) :- line(X51469, X51480), role(X51469), tdom(X51480), domdomain(3, X51469).
goal(xplayer, 100, X51494) :- not line(xplayer, X51494), not line(oplayer, X51494), not line(zplayer, X51494), not boardopen(X51494), tdom(X51494).
goal(oplayer, 0, X51494) :- not line(xplayer, X51494), not line(oplayer, X51494), not line(zplayer, X51494), not boardopen(X51494), tdom(X51494).
goal(zplayer, 0, X51494) :- not line(xplayer, X51494), not line(oplayer, X51494), not line(zplayer, X51494), not boardopen(X51494), tdom(X51494).
goal(xplayer, 0, X51476) :- line(oplayer, X51476), tdom(X51476).
goal(xplayer, 0, X51476) :- line(zplayer, X51476), tdom(X51476).
goal(oplayer, 0, X51476) :- line(xplayer, X51476), tdom(X51476).
goal(oplayer, 0, X51476) :- line(zplayer, X51476), tdom(X51476).
goal(zplayer, 0, X51476) :- line(xplayer, X51476), tdom(X51476).
goal(zplayer, 0, X51476) :- line(oplayer, X51476), tdom(X51476).
cellopen(X51469, X51470, X51510) :- x(X51469), y(X51470), not true(cell(X51469, X51470, xplayer), X51510), not true(cell(X51469, X51470, oplayer), X51510), not true(cell(X51469, X51470, zplayer), X51510), tdom(X51510), domdomain(2, X51469), domdomain(2, X51470).
columnopen(X51469, X51476) :- cellopen(X51469, 4, X51476), tdom(X51476), domdomain(2, X51469).
columnempty(X51469, X51476) :- cellopen(X51469, 1, X51476), tdom(X51476), domdomain(2, X51469).
boardopen(X51477) :- x(X51471), columnopen(X51471, X51477), domdomain(2, X51471), tdom(X51477).
line(X51469, X51518) :- true(cell(X51475, X51476, X51469), X51518), succ(X51475, X51482), succ(X51482, X51487), succ(X51487, X51492), true(cell(X51482, X51476, X51469), X51518), true(cell(X51487, X51476, X51469), X51518), true(cell(X51492, X51476, X51469), X51518), domdomain(2, X51492), domdomain(2, X51487), domdomain(2, X51482), domdomain(7, X51487), domdomain(8, X51492), domdomain(7, X51482), domdomain(8, X51487), domdomain(7, X51475), domdomain(8, X51482), domdomain(2, X51475), domdomain(2, X51476), tdom(X51518), domdomain(3, X51469).
line(X51469, X51518) :- true(cell(X51475, X51476, X51469), X51518), succ(X51476, X51482), succ(X51482, X51487), succ(X51487, X51492), true(cell(X51475, X51482, X51469), X51518), true(cell(X51475, X51487, X51469), X51518), true(cell(X51475, X51492, X51469), X51518), domdomain(2, X51492), domdomain(2, X51487), domdomain(2, X51482), domdomain(7, X51487), domdomain(8, X51492), domdomain(7, X51482), domdomain(8, X51487), domdomain(7, X51476), domdomain(8, X51482), domdomain(2, X51475), domdomain(2, X51476), tdom(X51518), domdomain(3, X51469).
line(X51469, X51533) :- true(cell(X51475, X51476, X51469), X51533), succ(X51475, X51482), succ(X51482, X51487), succ(X51487, X51492), succ(X51476, X51497), succ(X51497, X51502), succ(X51502, X51507), true(cell(X51482, X51497, X51469), X51533), true(cell(X51487, X51502, X51469), X51533), true(cell(X51492, X51507, X51469), X51533), domdomain(2, X51492), domdomain(2, X51507), domdomain(2, X51487), domdomain(2, X51502), domdomain(2, X51482), domdomain(2, X51497), domdomain(7, X51502), domdomain(8, X51507), domdomain(7, X51497), domdomain(8, X51502), domdomain(7, X51476), domdomain(8, X51497), domdomain(7, X51487), domdomain(8, X51492), domdomain(7, X51482), domdomain(8, X51487), domdomain(7, X51475), domdomain(8, X51482), domdomain(2, X51475), domdomain(2, X51476), tdom(X51533), domdomain(3, X51469).
line(X51469, X51533) :- true(cell(X51475, X51476, X51469), X51533), succ(X51475, X51482), succ(X51482, X51487), succ(X51487, X51492), succ(X51496, X51476), succ(X51501, X51496), succ(X51506, X51501), true(cell(X51482, X51496, X51469), X51533), true(cell(X51487, X51501, X51469), X51533), true(cell(X51492, X51506, X51469), X51533), domdomain(2, X51492), domdomain(2, X51506), domdomain(2, X51487), domdomain(2, X51501), domdomain(2, X51482), domdomain(2, X51496), domdomain(7, X51506), domdomain(8, X51501), domdomain(7, X51501), domdomain(8, X51496), domdomain(7, X51496), domdomain(8, X51476), domdomain(7, X51487), domdomain(8, X51492), domdomain(7, X51482), domdomain(8, X51487), domdomain(7, X51475), domdomain(8, X51482), domdomain(2, X51475), domdomain(2, X51476), tdom(X51533), domdomain(3, X51469).
succ(1, 2).
succ(2, 3).
succ(3, 4).
x(1).
x(2).
x(3).
x(4).
y(1).
y(2).
y(3).
y(4).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, oplayer).
domdomain(3, xplayer).
domdomain(3, zplayer).
domdomain(4, 0).
domdomain(4, 100).
domdomain(5, control).
domdomain(6, drop).
domdomain(6, noop).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
