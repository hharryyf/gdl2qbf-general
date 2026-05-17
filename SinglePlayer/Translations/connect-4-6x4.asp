mtdom(1..21).
role(xplayer).
role(oplayer).
base(cell(X50009, X50010, X50011)) :- x(X50009), y(X50010), role(X50011), domdomain(9, X50010), domdomain(2, X50009), domdomain(2, X50010), domdomain(3, X50011).
base(control(xplayer)).
base(control(oplayer)).
input(X50007, drop(X50010)) :- role(X50007), x(X50010), domdomain(3, X50007), domdomain(2, X50010).
input(X50007, noop) :- role(X50007), domdomain(3, X50007).
true(control(xplayer), 1).
legal(xplayer, noop, X50016) :- true(control(oplayer), X50016), tdom(X50016).
legal(xplayer, drop(X50010), X50022) :- true(control(xplayer), X50022), columnopen(X50010, X50022), tdom(X50022), domdomain(2, X50010).
legal(oplayer, noop, X50016) :- true(control(xplayer), X50016), tdom(X50016).
legal(oplayer, drop(X50010), X50022) :- true(control(oplayer), X50022), columnopen(X50010, X50022), tdom(X50022), domdomain(2, X50010).
true(cell(X50009, 1, X50011), X50024 + 1) :- does(X50011, drop(X50009), X50024), columnempty(X50009, X50024), tdom(X50024), mtdom(X50024), domdomain(2, X50009), domdomain(3, X50011).
true(cell(X50009, X50010, X50011), X50037 + 1) :- does(X50011, drop(X50009), X50037), cellopen(X50009, X50010, X50037), succ(X50027, X50010), not cellopen(X50009, X50027, X50037), domdomain(2, X50027), domdomain(7, X50027), domdomain(8, X50010), tdom(X50037), mtdom(X50037), domdomain(2, X50009), domdomain(2, X50010), domdomain(3, X50011).
true(cell(X50009, X50010, X50011), X50021 + 1) :- true(cell(X50009, X50010, X50011), X50021), mtdom(X50021), domdomain(2, X50009), domdomain(2, X50010), domdomain(3, X50011).
true(control(xplayer), X50017 + 1) :- true(control(oplayer), X50017), mtdom(X50017).
true(control(oplayer), X50017 + 1) :- true(control(xplayer), X50017), mtdom(X50017).
terminal(X50011) :- line(xplayer, X50011), tdom(X50011).
terminal(X50011) :- line(oplayer, X50011), tdom(X50011).
terminal(X50011) :- not boardopen(X50011), tdom(X50011).
goal(xplayer, 100, X50014) :- line(xplayer, X50014), tdom(X50014).
goal(xplayer, 50, X50026) :- not line(xplayer, X50026), not line(oplayer, X50026), not boardopen(X50026), tdom(X50026).
goal(xplayer, 0, X50014) :- line(oplayer, X50014), tdom(X50014).
goal(xplayer, 0, X50024) :- not line(xplayer, X50024), not line(oplayer, X50024), boardopen(X50024), tdom(X50024).
goal(oplayer, 100, X50014) :- line(oplayer, X50014), tdom(X50014).
goal(oplayer, 50, X50026) :- not line(xplayer, X50026), not line(oplayer, X50026), not boardopen(X50026), tdom(X50026).
goal(oplayer, 0, X50014) :- line(xplayer, X50014), tdom(X50014).
goal(oplayer, 0, X50024) :- not line(xplayer, X50024), not line(oplayer, X50024), boardopen(X50024), tdom(X50024).
cellopen(X50007, X50008, X50038) :- x(X50007), y(X50008), not true(cell(X50007, X50008, xplayer), X50038), not true(cell(X50007, X50008, oplayer), X50038), domdomain(9, X50008), tdom(X50038), domdomain(2, X50007), domdomain(2, X50008).
columnopen(X50007, X50014) :- cellopen(X50007, 4, X50014), tdom(X50014), domdomain(2, X50007).
columnempty(X50007, X50014) :- cellopen(X50007, 1, X50014), tdom(X50014), domdomain(2, X50007).
boardopen(X50015) :- x(X50009), columnopen(X50009, X50015), domdomain(2, X50009), tdom(X50015).
line(X50007, X50056) :- true(cell(X50013, X50014, X50007), X50056), succ(X50013, X50020), succ(X50020, X50025), succ(X50025, X50030), true(cell(X50020, X50014, X50007), X50056), true(cell(X50025, X50014, X50007), X50056), true(cell(X50030, X50014, X50007), X50056), domdomain(2, X50030), domdomain(2, X50025), domdomain(2, X50020), domdomain(7, X50025), domdomain(8, X50030), domdomain(7, X50020), domdomain(8, X50025), domdomain(7, X50013), domdomain(8, X50020), domdomain(2, X50013), domdomain(2, X50014), tdom(X50056), domdomain(3, X50007).
line(X50007, X50056) :- true(cell(X50013, X50014, X50007), X50056), succ(X50014, X50020), succ(X50020, X50025), succ(X50025, X50030), true(cell(X50013, X50020, X50007), X50056), true(cell(X50013, X50025, X50007), X50056), true(cell(X50013, X50030, X50007), X50056), domdomain(2, X50030), domdomain(2, X50025), domdomain(2, X50020), domdomain(7, X50025), domdomain(8, X50030), domdomain(7, X50020), domdomain(8, X50025), domdomain(7, X50014), domdomain(8, X50020), domdomain(2, X50013), domdomain(2, X50014), tdom(X50056), domdomain(3, X50007).
line(X50007, X50071) :- true(cell(X50013, X50014, X50007), X50071), succ(X50013, X50020), succ(X50020, X50025), succ(X50025, X50030), succ(X50014, X50035), succ(X50035, X50040), succ(X50040, X50045), true(cell(X50020, X50035, X50007), X50071), true(cell(X50025, X50040, X50007), X50071), true(cell(X50030, X50045, X50007), X50071), domdomain(2, X50030), domdomain(2, X50045), domdomain(2, X50025), domdomain(2, X50040), domdomain(2, X50020), domdomain(2, X50035), domdomain(7, X50040), domdomain(8, X50045), domdomain(7, X50035), domdomain(8, X50040), domdomain(7, X50014), domdomain(8, X50035), domdomain(7, X50025), domdomain(8, X50030), domdomain(7, X50020), domdomain(8, X50025), domdomain(7, X50013), domdomain(8, X50020), domdomain(2, X50013), domdomain(2, X50014), tdom(X50071), domdomain(3, X50007).
line(X50007, X50071) :- true(cell(X50013, X50014, X50007), X50071), succ(X50013, X50020), succ(X50020, X50025), succ(X50025, X50030), succ(X50034, X50014), succ(X50039, X50034), succ(X50044, X50039), true(cell(X50020, X50034, X50007), X50071), true(cell(X50025, X50039, X50007), X50071), true(cell(X50030, X50044, X50007), X50071), domdomain(2, X50030), domdomain(2, X50044), domdomain(2, X50025), domdomain(2, X50039), domdomain(2, X50020), domdomain(2, X50034), domdomain(7, X50044), domdomain(8, X50039), domdomain(7, X50039), domdomain(8, X50034), domdomain(7, X50034), domdomain(8, X50014), domdomain(7, X50025), domdomain(8, X50030), domdomain(7, X50020), domdomain(8, X50025), domdomain(7, X50013), domdomain(8, X50020), domdomain(2, X50013), domdomain(2, X50014), tdom(X50071), domdomain(3, X50007).
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
domdomain(7, 5).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(8, 5).
domdomain(8, 6).
domdomain(9, 1).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
