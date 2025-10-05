mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X50477, X50478, b)) :- index(X50477), index(X50478), domdomain(2, X50477), domdomain(2, X50478).
base(cell(X50477, X50478, x)) :- index(X50477), index(X50478), domdomain(2, X50477), domdomain(2, X50478).
base(cell(X50477, X50478, o)) :- index(X50477), index(X50478), domdomain(2, X50477), domdomain(2, X50478).
base(control(X50477)) :- role(X50477), domdomain(4, X50477).
input(X50475, mark(X50478, X50479)) :- index(X50478), index(X50479), role(X50475), domdomain(4, X50475), domdomain(2, X50478), domdomain(2, X50479).
input(X50475, noop) :- role(X50475), domdomain(4, X50475).
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
true(cell(X50477, X50478, x), X50497 + 1) :- does(xplayer, mark(X50477, X50478), X50497), true(cell(X50477, X50478, b), X50497), mtdom(X50497), domdomain(2, X50477), domdomain(2, X50478).
true(cell(X50477, X50478, o), X50497 + 1) :- does(oplayer, mark(X50477, X50478), X50497), true(cell(X50477, X50478, b), X50497), mtdom(X50497), domdomain(2, X50477), domdomain(2, X50478).
true(cell(X50477, X50478, X50479), X50494 + 1) :- true(cell(X50477, X50478, X50479), X50494), X50479 != b, mtdom(X50494), domdomain(2, X50477), domdomain(2, X50478), domdomain(3, X50479).
true(cell(X50477, X50478, b), X50502 + 1) :- does(X50483, mark(X50486, X50487), X50502), true(cell(X50477, X50478, b), X50502), X50477 != X50486, domdomain(4, X50483), domdomain(2, X50486), domdomain(2, X50487), mtdom(X50502), domdomain(2, X50477), domdomain(2, X50478).
true(cell(X50477, X50478, b), X50502 + 1) :- does(X50483, mark(X50486, X50487), X50502), true(cell(X50477, X50478, b), X50502), X50478 != X50487, domdomain(4, X50483), domdomain(2, X50486), domdomain(2, X50487), mtdom(X50502), domdomain(2, X50477), domdomain(2, X50478).
true(control(xplayer), X50485 + 1) :- true(control(oplayer), X50485), mtdom(X50485).
true(control(oplayer), X50485 + 1) :- true(control(xplayer), X50485), mtdom(X50485).
open(X50483) :- true(cell(X50479, X50480, b), X50483), domdomain(2, X50479), domdomain(2, X50480), tdom(X50483).
legal(X50475, mark(X50478, X50479), X50495) :- true(cell(X50478, X50479, b), X50495), true(control(X50475), X50495), tdom(X50495), domdomain(4, X50475), domdomain(2, X50478), domdomain(2, X50479).
legal(xplayer, noop, X50484) :- true(control(oplayer), X50484), tdom(X50484).
legal(oplayer, noop, X50484) :- true(control(xplayer), X50484), tdom(X50484).
goal(xplayer, 100, X50482) :- line(x, X50482), tdom(X50482).
goal(xplayer, 50, X50494) :- not line(x, X50494), not line(o, X50494), not open(X50494), tdom(X50494).
goal(xplayer, 0, X50482) :- line(o, X50482), tdom(X50482).
goal(oplayer, 100, X50482) :- line(o, X50482), tdom(X50482).
goal(oplayer, 50, X50494) :- not line(x, X50494), not line(o, X50494), not open(X50494), tdom(X50494).
goal(oplayer, 0, X50482) :- line(x, X50482), tdom(X50482).
terminal(X50479) :- line(x, X50479), tdom(X50479).
terminal(X50479) :- line(o, X50479), tdom(X50479).
terminal(X50479) :- not open(X50479), tdom(X50479).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X50475, X50524) :- true(cell(X50481, X50482, X50475), X50524), true(cell(X50481, X50490, X50475), X50524), true(cell(X50481, X50498, X50475), X50524), true(cell(X50505, X50482, X50475), X50524), succ(X50482, X50490), succ(X50481, X50505), succ(X50490, X50498), domdomain(7, X50490), domdomain(8, X50498), domdomain(7, X50481), domdomain(8, X50505), domdomain(7, X50482), domdomain(8, X50490), domdomain(2, X50505), domdomain(2, X50498), domdomain(2, X50490), domdomain(2, X50481), domdomain(2, X50482), tdom(X50524), domdomain(3, X50475).
line(X50475, X50524) :- true(cell(X50481, X50482, X50475), X50524), true(cell(X50481, X50490, X50475), X50524), true(cell(X50481, X50498, X50475), X50524), true(cell(X50505, X50482, X50475), X50524), succ(X50482, X50490), succ(X50505, X50481), succ(X50490, X50498), domdomain(7, X50490), domdomain(8, X50498), domdomain(7, X50505), domdomain(8, X50481), domdomain(7, X50482), domdomain(8, X50490), domdomain(2, X50505), domdomain(2, X50498), domdomain(2, X50490), domdomain(2, X50481), domdomain(2, X50482), tdom(X50524), domdomain(3, X50475).
line(X50475, X50524) :- true(cell(X50481, X50482, X50475), X50524), true(cell(X50481, X50490, X50475), X50524), true(cell(X50481, X50498, X50475), X50524), true(cell(X50505, X50498, X50475), X50524), succ(X50482, X50490), succ(X50481, X50505), succ(X50490, X50498), domdomain(7, X50490), domdomain(8, X50498), domdomain(7, X50481), domdomain(8, X50505), domdomain(7, X50482), domdomain(8, X50490), domdomain(2, X50505), domdomain(2, X50498), domdomain(2, X50490), domdomain(2, X50481), domdomain(2, X50482), tdom(X50524), domdomain(3, X50475).
line(X50475, X50524) :- true(cell(X50481, X50482, X50475), X50524), true(cell(X50481, X50490, X50475), X50524), true(cell(X50481, X50498, X50475), X50524), true(cell(X50505, X50498, X50475), X50524), succ(X50482, X50490), succ(X50505, X50481), succ(X50490, X50498), domdomain(7, X50490), domdomain(8, X50498), domdomain(7, X50505), domdomain(8, X50481), domdomain(7, X50482), domdomain(8, X50490), domdomain(2, X50505), domdomain(2, X50498), domdomain(2, X50490), domdomain(2, X50481), domdomain(2, X50482), tdom(X50524), domdomain(3, X50475).
line(X50475, X50524) :- true(cell(X50481, X50482, X50475), X50524), true(cell(X50489, X50482, X50475), X50524), true(cell(X50497, X50482, X50475), X50524), true(cell(X50481, X50506, X50475), X50524), succ(X50482, X50506), succ(X50481, X50489), succ(X50489, X50497), domdomain(7, X50489), domdomain(8, X50497), domdomain(7, X50481), domdomain(8, X50489), domdomain(7, X50482), domdomain(8, X50506), domdomain(2, X50506), domdomain(2, X50497), domdomain(2, X50489), domdomain(2, X50481), domdomain(2, X50482), tdom(X50524), domdomain(3, X50475).
line(X50475, X50524) :- true(cell(X50481, X50482, X50475), X50524), true(cell(X50489, X50482, X50475), X50524), true(cell(X50497, X50482, X50475), X50524), true(cell(X50481, X50506, X50475), X50524), succ(X50506, X50482), succ(X50481, X50489), succ(X50489, X50497), domdomain(7, X50489), domdomain(8, X50497), domdomain(7, X50481), domdomain(8, X50489), domdomain(7, X50506), domdomain(8, X50482), domdomain(2, X50506), domdomain(2, X50497), domdomain(2, X50489), domdomain(2, X50481), domdomain(2, X50482), tdom(X50524), domdomain(3, X50475).
line(X50475, X50524) :- true(cell(X50481, X50482, X50475), X50524), true(cell(X50489, X50482, X50475), X50524), true(cell(X50497, X50482, X50475), X50524), true(cell(X50497, X50506, X50475), X50524), succ(X50482, X50506), succ(X50481, X50489), succ(X50489, X50497), domdomain(7, X50489), domdomain(8, X50497), domdomain(7, X50481), domdomain(8, X50489), domdomain(7, X50482), domdomain(8, X50506), domdomain(2, X50506), domdomain(2, X50497), domdomain(2, X50489), domdomain(2, X50481), domdomain(2, X50482), tdom(X50524), domdomain(3, X50475).
line(X50474, X50523) :- true(cell(X50480, X50481, X50474), X50523), true(cell(X50488, X50481, X50474), X50523), true(cell(X50496, X50481, X50474), X50523), true(cell(X50496, X50505, X50474), X50523), succ(X50505, X50481), succ(X50480, X50488), succ(X50488, X50496), domdomain(7, X50488), domdomain(8, X50496), domdomain(7, X50480), domdomain(8, X50488), domdomain(7, X50505), domdomain(8, X50481), domdomain(2, X50505), domdomain(2, X50496), domdomain(2, X50488), domdomain(2, X50480), domdomain(2, X50481), tdom(X50523), domdomain(3, X50474).
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
