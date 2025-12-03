mtdom(1..9).
role(xplayer).
role(oplayer).
role(zplayer).
true(cell(1, 1, b), 1).
true(cell(1, 2, b), 1).
true(cell(1, 3, b), 1).
true(cell(2, 1, b), 1).
true(cell(2, 2, b), 1).
true(cell(2, 3, b), 1).
true(cell(3, 1, b), 1).
true(cell(3, 2, b), 1).
true(cell(3, 3, b), 1).
true(control(xplayer), 1).
succ(1, 2).
succ(2, 3).
true(cell(X42827, X42828, X42829), X42844 + 1) :- does(X42833, mark(X42827, X42828), X42844), sign(X42833, X42829), domdomain(7, X42829), domdomain(4, X42833), mtdom(X42844), domdomain(2, X42827), domdomain(2, X42828), domdomain(3, X42829).
true(cell(X42827, X42828, X42829), X42844 + 1) :- true(cell(X42827, X42828, X42829), X42844), X42829 != b, mtdom(X42844), domdomain(2, X42827), domdomain(2, X42828), domdomain(3, X42829).
true(cell(X42827, X42828, b), X42852 + 1) :- does(X42833, mark(X42836, X42837), X42852), true(cell(X42827, X42828, b), X42852), X42828 != X42837, domdomain(4, X42833), domdomain(2, X42836), domdomain(2, X42837), mtdom(X42852), domdomain(2, X42827), domdomain(2, X42828).
true(cell(X42827, X42828, b), X42852 + 1) :- does(X42833, mark(X42836, X42837), X42852), true(cell(X42827, X42828, b), X42852), X42827 != X42836, domdomain(4, X42833), domdomain(2, X42836), domdomain(2, X42837), mtdom(X42852), domdomain(2, X42827), domdomain(2, X42828).
true(control(zplayer), X42835 + 1) :- true(control(oplayer), X42835), mtdom(X42835).
true(control(oplayer), X42835 + 1) :- true(control(xplayer), X42835), mtdom(X42835).
true(control(xplayer), X42835 + 1) :- true(control(zplayer), X42835), mtdom(X42835).
row3(X42825, X42826, X42862) :- true(cell(X42825, X42833, X42826), X42862), succ(X42833, X42839), true(cell(X42825, X42839, X42826), X42862), succ(X42839, X42852), true(cell(X42825, X42852, X42826), X42862), domdomain(2, X42852), domdomain(8, X42839), domdomain(9, X42852), domdomain(2, X42839), domdomain(8, X42833), domdomain(9, X42839), domdomain(2, X42833), tdom(X42862), domdomain(2, X42825), domdomain(3, X42826).
column3(X42825, X42826, X42862) :- true(cell(X42832, X42825, X42826), X42862), succ(X42832, X42839), true(cell(X42839, X42825, X42826), X42862), succ(X42839, X42852), true(cell(X42852, X42825, X42826), X42862), domdomain(2, X42852), domdomain(8, X42839), domdomain(9, X42852), domdomain(2, X42839), domdomain(8, X42832), domdomain(9, X42839), domdomain(2, X42832), tdom(X42862), domdomain(2, X42825), domdomain(3, X42826).
diagonal3(X42825, X42871) :- true(cell(X42831, X42832, X42825), X42871), succ(X42831, X42838), succ(X42832, X42843), true(cell(X42838, X42843, X42825), X42871), succ(X42838, X42856), succ(X42843, X42861), true(cell(X42856, X42861, X42825), X42871), domdomain(2, X42856), domdomain(2, X42861), domdomain(8, X42843), domdomain(9, X42861), domdomain(8, X42838), domdomain(9, X42856), domdomain(2, X42838), domdomain(2, X42843), domdomain(8, X42832), domdomain(9, X42843), domdomain(8, X42831), domdomain(9, X42838), domdomain(2, X42831), domdomain(2, X42832), tdom(X42871), domdomain(3, X42825).
diagonal3(X42825, X42871) :- true(cell(X42831, X42832, X42825), X42871), succ(X42837, X42831), succ(X42832, X42843), true(cell(X42837, X42843, X42825), X42871), succ(X42855, X42837), succ(X42843, X42861), true(cell(X42855, X42861, X42825), X42871), domdomain(2, X42855), domdomain(2, X42861), domdomain(8, X42843), domdomain(9, X42861), domdomain(8, X42855), domdomain(9, X42837), domdomain(2, X42837), domdomain(2, X42843), domdomain(8, X42832), domdomain(9, X42843), domdomain(8, X42837), domdomain(9, X42831), domdomain(2, X42831), domdomain(2, X42832), tdom(X42871), domdomain(3, X42825).
line3(X42825, X42832) :- row3(X42829, X42825, X42832), domdomain(2, X42829), tdom(X42832), domdomain(3, X42825).
line3(X42825, X42832) :- column3(X42829, X42825, X42832), domdomain(2, X42829), tdom(X42832), domdomain(3, X42825).
line3(X42825, X42831) :- diagonal3(X42825, X42831), tdom(X42831), domdomain(3, X42825).
open(X42833) :- true(cell(X42829, X42830, b), X42833), domdomain(2, X42829), domdomain(2, X42830), tdom(X42833).
legal(X42825, mark(X42828, X42829), X42845) :- true(cell(X42828, X42829, b), X42845), true(control(X42825), X42845), tdom(X42845), domdomain(4, X42825), domdomain(2, X42828), domdomain(2, X42829).
legal(X42825, noop, X42840) :- role(X42825), not true(control(X42825), X42840), tdom(X42840), domdomain(4, X42825).
goal(X42825, 100, X42841) :- role(X42825), sign(X42825, X42835), line3(X42835, X42841), domdomain(3, X42835), domdomain(7, X42835), tdom(X42841), domdomain(4, X42825).
goal(xplayer, 100, X42850) :- not line3(x, X42850), not line3(o, X42850), not line3(z, X42850), not open(X42850), tdom(X42850).
goal(oplayer, 0, X42850) :- not line3(x, X42850), not line3(o, X42850), not line3(z, X42850), not open(X42850), tdom(X42850).
goal(zplayer, 0, X42850) :- not line3(x, X42850), not line3(o, X42850), not line3(z, X42850), not open(X42850), tdom(X42850).
goal(X42825, 0, X42851) :- role(X42825), sign(X42825, X42835), sign(X42839, X42840), X42839 != X42825, line3(X42840, X42851), domdomain(3, X42840), domdomain(4, X42839), domdomain(7, X42840), domdomain(7, X42835), tdom(X42851), domdomain(4, X42825).
terminal(X42834) :- sign(X42827, X42828), line3(X42828, X42834), domdomain(3, X42828), domdomain(4, X42827), domdomain(7, X42828), tdom(X42834).
terminal(X42829) :- not open(X42829), tdom(X42829).
sign(xplayer, x).
sign(oplayer, o).
sign(zplayer, z).
index(X42825) :- succ(X42825, X42830), domdomain(8, X42825), domdomain(9, X42830), domdomain(2, X42825).
index(X42825) :- succ(X42829, X42825), domdomain(8, X42829), domdomain(9, X42825), domdomain(2, X42825).
base(cell(X42827, X42828, b)) :- index(X42827), index(X42828), domdomain(2, X42827), domdomain(2, X42828).
base(cell(X42827, X42828, X42829)) :- index(X42827), index(X42828), sign(X42841, X42829), domdomain(4, X42841), domdomain(7, X42829), domdomain(2, X42827), domdomain(2, X42828), domdomain(3, X42829).
base(control(X42827)) :- role(X42827), domdomain(4, X42827).
input(X42825, mark(X42828, X42829)) :- role(X42825), index(X42828), index(X42829), domdomain(4, X42825), domdomain(2, X42828), domdomain(2, X42829).
input(X42824, noop) :- role(X42824), domdomain(4, X42824).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
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
domdomain(9, 2).
domdomain(9, 3).
