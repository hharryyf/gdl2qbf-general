mtdom(1..36).
role(xplayer).
role(oplayer).
role(zplayer).
base(cell(X49103, X49104, X49105)) :- x(X49103), y(X49104), role(X49105), domdomain(2, X49103), domdomain(2, X49104), domdomain(3, X49105).
base(control(xplayer)).
base(control(oplayer)).
base(control(zplayer)).
input(X49101, drop(X49104)) :- role(X49101), x(X49104), domdomain(3, X49101), domdomain(2, X49104).
input(X49101, noop) :- role(X49101), domdomain(3, X49101).
true(control(xplayer), 1).
legal(X49101, noop, X49116) :- role(X49101), not true(control(X49101), X49116), tdom(X49116), domdomain(3, X49101).
legal(X49101, drop(X49104), X49116) :- true(control(X49101), X49116), columnopen(X49104, X49116), tdom(X49116), domdomain(3, X49101), domdomain(2, X49104).
true(cell(X49103, 1, X49105), X49118 + 1) :- does(X49105, drop(X49103), X49118), columnempty(X49103, X49118), tdom(X49118), mtdom(X49118), domdomain(2, X49103), domdomain(3, X49105).
true(cell(X49103, X49104, X49105), X49131 + 1) :- does(X49105, drop(X49103), X49131), cellopen(X49103, X49104, X49131), succ(X49121, X49104), not cellopen(X49103, X49121, X49131), domdomain(2, X49121), domdomain(7, X49121), domdomain(8, X49104), tdom(X49131), mtdom(X49131), domdomain(2, X49103), domdomain(2, X49104), domdomain(3, X49105).
true(cell(X49103, X49104, X49105), X49115 + 1) :- true(cell(X49103, X49104, X49105), X49115), mtdom(X49115), domdomain(2, X49103), domdomain(2, X49104), domdomain(3, X49105).
true(control(xplayer), X49111 + 1) :- true(control(zplayer), X49111), mtdom(X49111).
true(control(zplayer), X49111 + 1) :- true(control(oplayer), X49111), mtdom(X49111).
true(control(oplayer), X49111 + 1) :- true(control(xplayer), X49111), mtdom(X49111).
terminal(X49105) :- line(xplayer, X49105), tdom(X49105).
terminal(X49105) :- line(oplayer, X49105), tdom(X49105).
terminal(X49105) :- line(zplayer, X49105), tdom(X49105).
terminal(X49105) :- not boardopen(X49105), tdom(X49105).
goal(X49101, 100, X49112) :- line(X49101, X49112), role(X49101), tdom(X49112), domdomain(3, X49101).
goal(xplayer, 100, X49126) :- not line(xplayer, X49126), not line(oplayer, X49126), not line(zplayer, X49126), not boardopen(X49126), tdom(X49126).
goal(oplayer, 0, X49126) :- not line(xplayer, X49126), not line(oplayer, X49126), not line(zplayer, X49126), not boardopen(X49126), tdom(X49126).
goal(zplayer, 0, X49126) :- not line(xplayer, X49126), not line(oplayer, X49126), not line(zplayer, X49126), not boardopen(X49126), tdom(X49126).
goal(xplayer, 0, X49108) :- line(oplayer, X49108), tdom(X49108).
goal(xplayer, 0, X49108) :- line(zplayer, X49108), tdom(X49108).
goal(oplayer, 0, X49108) :- line(xplayer, X49108), tdom(X49108).
goal(oplayer, 0, X49108) :- line(zplayer, X49108), tdom(X49108).
goal(zplayer, 0, X49108) :- line(xplayer, X49108), tdom(X49108).
goal(zplayer, 0, X49108) :- line(oplayer, X49108), tdom(X49108).
cellopen(X49101, X49102, X49142) :- x(X49101), y(X49102), not true(cell(X49101, X49102, xplayer), X49142), not true(cell(X49101, X49102, oplayer), X49142), not true(cell(X49101, X49102, zplayer), X49142), tdom(X49142), domdomain(2, X49101), domdomain(2, X49102).
columnopen(X49101, X49108) :- cellopen(X49101, 6, X49108), tdom(X49108), domdomain(2, X49101).
columnempty(X49101, X49108) :- cellopen(X49101, 1, X49108), tdom(X49108), domdomain(2, X49101).
boardopen(X49109) :- x(X49103), columnopen(X49103, X49109), domdomain(2, X49103), tdom(X49109).
line(X49101, X49137) :- true(cell(X49107, X49108, X49101), X49137), succ(X49107, X49114), succ(X49114, X49119), true(cell(X49114, X49108, X49101), X49137), true(cell(X49119, X49108, X49101), X49137), domdomain(2, X49119), domdomain(2, X49114), domdomain(7, X49114), domdomain(8, X49119), domdomain(7, X49107), domdomain(8, X49114), domdomain(2, X49107), domdomain(2, X49108), tdom(X49137), domdomain(3, X49101).
line(X49101, X49137) :- true(cell(X49107, X49108, X49101), X49137), succ(X49108, X49114), succ(X49114, X49119), true(cell(X49107, X49114, X49101), X49137), true(cell(X49107, X49119, X49101), X49137), domdomain(2, X49119), domdomain(2, X49114), domdomain(7, X49114), domdomain(8, X49119), domdomain(7, X49108), domdomain(8, X49114), domdomain(2, X49107), domdomain(2, X49108), tdom(X49137), domdomain(3, X49101).
line(X49101, X49147) :- true(cell(X49107, X49108, X49101), X49147), succ(X49107, X49114), succ(X49114, X49119), succ(X49108, X49124), succ(X49124, X49129), true(cell(X49114, X49124, X49101), X49147), true(cell(X49119, X49129, X49101), X49147), domdomain(2, X49119), domdomain(2, X49129), domdomain(2, X49114), domdomain(2, X49124), domdomain(7, X49124), domdomain(8, X49129), domdomain(7, X49108), domdomain(8, X49124), domdomain(7, X49114), domdomain(8, X49119), domdomain(7, X49107), domdomain(8, X49114), domdomain(2, X49107), domdomain(2, X49108), tdom(X49147), domdomain(3, X49101).
line(X49101, X49147) :- true(cell(X49107, X49108, X49101), X49147), succ(X49107, X49114), succ(X49114, X49119), succ(X49123, X49108), succ(X49128, X49123), true(cell(X49114, X49123, X49101), X49147), true(cell(X49119, X49128, X49101), X49147), domdomain(2, X49119), domdomain(2, X49128), domdomain(2, X49114), domdomain(2, X49123), domdomain(7, X49128), domdomain(8, X49123), domdomain(7, X49123), domdomain(8, X49108), domdomain(7, X49114), domdomain(8, X49119), domdomain(7, X49107), domdomain(8, X49114), domdomain(2, X49107), domdomain(2, X49108), tdom(X49147), domdomain(3, X49101).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
succ(5, 6).
x(1).
x(2).
x(3).
x(4).
x(5).
x(6).
y(1).
y(2).
y(3).
y(4).
y(5).
y(6).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(2, 5).
domdomain(2, 6).
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
domdomain(7, 4).
domdomain(7, 5).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(8, 5).
domdomain(8, 6).
