mtdom(1..16).
role(xplayer).
role(oplayer).
role(zplayer).
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
succ(1, 2).
succ(2, 3).
succ(3, 4).
true(cell(X45008, X45009, X45010), X45025 + 1) :- does(X45014, mark(X45008, X45009), X45025), sign(X45014, X45010), domdomain(7, X45010), domdomain(4, X45014), mtdom(X45025), domdomain(2, X45008), domdomain(2, X45009), domdomain(3, X45010).
true(cell(X45008, X45009, X45010), X45025 + 1) :- true(cell(X45008, X45009, X45010), X45025), X45010 != b, mtdom(X45025), domdomain(2, X45008), domdomain(2, X45009), domdomain(3, X45010).
true(cell(X45008, X45009, b), X45033 + 1) :- does(X45014, mark(X45017, X45018), X45033), true(cell(X45008, X45009, b), X45033), X45009 != X45018, domdomain(4, X45014), domdomain(2, X45017), domdomain(2, X45018), mtdom(X45033), domdomain(2, X45008), domdomain(2, X45009).
true(cell(X45008, X45009, b), X45033 + 1) :- does(X45014, mark(X45017, X45018), X45033), true(cell(X45008, X45009, b), X45033), X45008 != X45017, domdomain(4, X45014), domdomain(2, X45017), domdomain(2, X45018), mtdom(X45033), domdomain(2, X45008), domdomain(2, X45009).
true(control(zplayer), X45016 + 1) :- true(control(oplayer), X45016), mtdom(X45016).
true(control(oplayer), X45016 + 1) :- true(control(xplayer), X45016), mtdom(X45016).
true(control(xplayer), X45016 + 1) :- true(control(zplayer), X45016), mtdom(X45016).
row3(X45006, X45007, X45043) :- true(cell(X45006, X45014, X45007), X45043), succ(X45014, X45020), true(cell(X45006, X45020, X45007), X45043), succ(X45020, X45033), true(cell(X45006, X45033, X45007), X45043), domdomain(2, X45033), domdomain(8, X45020), domdomain(9, X45033), domdomain(2, X45020), domdomain(8, X45014), domdomain(9, X45020), domdomain(2, X45014), tdom(X45043), domdomain(2, X45006), domdomain(3, X45007).
column3(X45006, X45007, X45043) :- true(cell(X45013, X45006, X45007), X45043), succ(X45013, X45020), true(cell(X45020, X45006, X45007), X45043), succ(X45020, X45033), true(cell(X45033, X45006, X45007), X45043), domdomain(2, X45033), domdomain(8, X45020), domdomain(9, X45033), domdomain(2, X45020), domdomain(8, X45013), domdomain(9, X45020), domdomain(2, X45013), tdom(X45043), domdomain(2, X45006), domdomain(3, X45007).
diagonal3(X45006, X45052) :- true(cell(X45012, X45013, X45006), X45052), succ(X45012, X45019), succ(X45013, X45024), true(cell(X45019, X45024, X45006), X45052), succ(X45019, X45037), succ(X45024, X45042), true(cell(X45037, X45042, X45006), X45052), domdomain(2, X45037), domdomain(2, X45042), domdomain(8, X45024), domdomain(9, X45042), domdomain(8, X45019), domdomain(9, X45037), domdomain(2, X45019), domdomain(2, X45024), domdomain(8, X45013), domdomain(9, X45024), domdomain(8, X45012), domdomain(9, X45019), domdomain(2, X45012), domdomain(2, X45013), tdom(X45052), domdomain(3, X45006).
diagonal3(X45006, X45052) :- true(cell(X45012, X45013, X45006), X45052), succ(X45018, X45012), succ(X45013, X45024), true(cell(X45018, X45024, X45006), X45052), succ(X45036, X45018), succ(X45024, X45042), true(cell(X45036, X45042, X45006), X45052), domdomain(2, X45036), domdomain(2, X45042), domdomain(8, X45024), domdomain(9, X45042), domdomain(8, X45036), domdomain(9, X45018), domdomain(2, X45018), domdomain(2, X45024), domdomain(8, X45013), domdomain(9, X45024), domdomain(8, X45018), domdomain(9, X45012), domdomain(2, X45012), domdomain(2, X45013), tdom(X45052), domdomain(3, X45006).
line3(X45006, X45013) :- row3(X45010, X45006, X45013), domdomain(2, X45010), tdom(X45013), domdomain(3, X45006).
line3(X45006, X45013) :- column3(X45010, X45006, X45013), domdomain(2, X45010), tdom(X45013), domdomain(3, X45006).
line3(X45006, X45012) :- diagonal3(X45006, X45012), tdom(X45012), domdomain(3, X45006).
open(X45014) :- true(cell(X45010, X45011, b), X45014), domdomain(2, X45010), domdomain(2, X45011), tdom(X45014).
legal(X45006, mark(X45009, X45010), X45026) :- true(cell(X45009, X45010, b), X45026), true(control(X45006), X45026), tdom(X45026), domdomain(4, X45006), domdomain(2, X45009), domdomain(2, X45010).
legal(X45006, noop, X45021) :- role(X45006), not true(control(X45006), X45021), tdom(X45021), domdomain(4, X45006).
goal(X45006, 100, X45022) :- role(X45006), sign(X45006, X45016), line3(X45016, X45022), domdomain(3, X45016), domdomain(7, X45016), tdom(X45022), domdomain(4, X45006).
goal(xplayer, 100, X45031) :- not line3(x, X45031), not line3(o, X45031), not line3(z, X45031), not open(X45031), tdom(X45031).
goal(oplayer, 0, X45031) :- not line3(x, X45031), not line3(o, X45031), not line3(z, X45031), not open(X45031), tdom(X45031).
goal(zplayer, 0, X45031) :- not line3(x, X45031), not line3(o, X45031), not line3(z, X45031), not open(X45031), tdom(X45031).
goal(X45006, 0, X45032) :- role(X45006), sign(X45006, X45016), sign(X45020, X45021), X45020 != X45006, line3(X45021, X45032), domdomain(3, X45021), domdomain(4, X45020), domdomain(7, X45021), domdomain(7, X45016), tdom(X45032), domdomain(4, X45006).
terminal(X45015) :- sign(X45008, X45009), line3(X45009, X45015), domdomain(3, X45009), domdomain(4, X45008), domdomain(7, X45009), tdom(X45015).
terminal(X45010) :- not open(X45010), tdom(X45010).
sign(xplayer, x).
sign(oplayer, o).
sign(zplayer, z).
index(X45006) :- succ(X45006, X45011), domdomain(8, X45006), domdomain(9, X45011), domdomain(2, X45006).
index(X45006) :- succ(X45010, X45006), domdomain(8, X45010), domdomain(9, X45006), domdomain(2, X45006).
base(cell(X45008, X45009, b)) :- index(X45008), index(X45009), domdomain(2, X45008), domdomain(2, X45009).
base(cell(X45008, X45009, X45010)) :- index(X45008), index(X45009), sign(X45022, X45010), domdomain(4, X45022), domdomain(7, X45010), domdomain(2, X45008), domdomain(2, X45009), domdomain(3, X45010).
base(control(X45008)) :- role(X45008), domdomain(4, X45008).
input(X45006, mark(X45009, X45010)) :- role(X45006), index(X45009), index(X45010), domdomain(4, X45006), domdomain(2, X45009), domdomain(2, X45010).
input(X45005, noop) :- role(X45005), domdomain(4, X45005).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, b).
domdomain(3, o).
domdomain(3, x).
domdomain(3, z).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(4, zplayer).
domdomain(5, 0).
domdomain(5, 100).
domdomain(6, mark).
domdomain(6, noop).
domdomain(7, o).
domdomain(7, x).
domdomain(7, z).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
