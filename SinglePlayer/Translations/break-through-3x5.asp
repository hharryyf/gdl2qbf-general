mtdom(1..18).
role(xplayer).
role(oplayer).
true(cell(1, 1, xplayer), 1).
true(cell(2, 1, xplayer), 1).
true(cell(3, 1, xplayer), 1).
true(cell(1, 2, xplayer), 1).
true(cell(2, 2, xplayer), 1).
true(cell(3, 2, xplayer), 1).
true(cell(1, 4, oplayer), 1).
true(cell(2, 4, oplayer), 1).
true(cell(3, 4, oplayer), 1).
true(cell(1, 5, oplayer), 1).
true(cell(2, 5, oplayer), 1).
true(cell(3, 5, oplayer), 1).
true(control(xplayer), 1).
legal(xplayer, move(X63818, X63819, X63818, X63821), X63847) :- true(control(xplayer), X63847), true(cell(X63818, X63819, xplayer), X63847), plusplusy(X63819, X63821), cellempty(X63818, X63821, X63847), domdomain(9, X63819), domdomain(10, X63821), tdom(X63847), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63818), domdomain(3, X63821).
legal(xplayer, move(X63818, X63819, X63820, X63821), X63857) :- true(control(xplayer), X63857), true(cell(X63818, X63819, xplayer), X63857), plusplusy(X63819, X63821), plusplusx(X63818, X63820), not true(cell(X63820, X63821, xplayer), X63857), domdomain(7, X63818), domdomain(8, X63820), domdomain(9, X63819), domdomain(10, X63821), tdom(X63857), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63820), domdomain(3, X63821).
legal(xplayer, move(X63818, X63819, X63820, X63821), X63857) :- true(control(xplayer), X63857), true(cell(X63818, X63819, xplayer), X63857), plusplusy(X63819, X63821), plusplusx(X63820, X63818), not true(cell(X63820, X63821, xplayer), X63857), domdomain(7, X63820), domdomain(8, X63818), domdomain(9, X63819), domdomain(10, X63821), tdom(X63857), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63820), domdomain(3, X63821).
legal(oplayer, move(X63818, X63819, X63818, X63821), X63847) :- true(control(oplayer), X63847), true(cell(X63818, X63819, oplayer), X63847), plusplusy(X63821, X63819), cellempty(X63818, X63821, X63847), domdomain(9, X63821), domdomain(10, X63819), tdom(X63847), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63818), domdomain(3, X63821).
legal(oplayer, move(X63818, X63819, X63820, X63821), X63857) :- true(control(oplayer), X63857), true(cell(X63818, X63819, oplayer), X63857), plusplusy(X63821, X63819), plusplusx(X63818, X63820), not true(cell(X63820, X63821, oplayer), X63857), domdomain(7, X63818), domdomain(8, X63820), domdomain(9, X63821), domdomain(10, X63819), tdom(X63857), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63820), domdomain(3, X63821).
legal(oplayer, move(X63818, X63819, X63820, X63821), X63857) :- true(control(oplayer), X63857), true(cell(X63818, X63819, oplayer), X63857), plusplusy(X63821, X63819), plusplusx(X63820, X63818), not true(cell(X63820, X63821, oplayer), X63857), domdomain(7, X63820), domdomain(8, X63818), domdomain(9, X63821), domdomain(10, X63819), tdom(X63857), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63820), domdomain(3, X63821).
legal(xplayer, noop, X63824) :- true(control(oplayer), X63824), tdom(X63824).
legal(oplayer, noop, X63824) :- true(control(xplayer), X63824), tdom(X63824).
true(cell(X63817, X63818, X63819), X63835 + 1) :- role(X63819), does(X63819, move(X63830, X63831, X63817, X63818), X63835), domdomain(2, X63830), domdomain(3, X63831), mtdom(X63835), domdomain(2, X63817), domdomain(3, X63818), domdomain(4, X63819).
true(cell(X63817, X63818, X63819), X63857 + 1) :- true(cell(X63817, X63818, X63819), X63857), role(X63831), does(X63831, move(X63838, X63839, X63840, X63841), X63857), differentcell(X63838, X63839, X63817, X63818), differentcell(X63840, X63841, X63817, X63818), domdomain(2, X63838), domdomain(3, X63839), domdomain(2, X63840), domdomain(3, X63841), domdomain(4, X63831), mtdom(X63857), domdomain(2, X63817), domdomain(3, X63818), domdomain(4, X63819).
true(control(xplayer), X63825 + 1) :- true(control(oplayer), X63825), mtdom(X63825).
true(control(oplayer), X63825 + 1) :- true(control(xplayer), X63825), mtdom(X63825).
terminal(X63817) :- xplayerwin(X63817), tdom(X63817).
terminal(X63817) :- oplayerwin(X63817), tdom(X63817).
goal(xplayer, 100, X63820) :- xplayerwin(X63820), tdom(X63820).
goal(xplayer, 0, X63822) :- not xplayerwin(X63822), tdom(X63822).
goal(oplayer, 100, X63820) :- oplayerwin(X63820), tdom(X63820).
goal(oplayer, 0, X63822) :- not oplayerwin(X63822), tdom(X63822).
cell(X63815, X63816) :- xindex(X63815), yindex(X63816), domdomain(2, X63815), domdomain(3, X63816).
cellempty(X63815, X63816, X63843) :- cell(X63815, X63816), not true(cell(X63815, X63816, xplayer), X63843), not true(cell(X63815, X63816, oplayer), X63843), tdom(X63843), domdomain(2, X63815), domdomain(3, X63816).
differentcell(X63815, X63816, X63817, X63818) :- cell(X63815, X63816), cell(X63817, X63818), X63815 != X63817, domdomain(2, X63815), domdomain(3, X63816), domdomain(2, X63817), domdomain(3, X63818).
differentcell(X63815, X63816, X63817, X63818) :- cell(X63815, X63816), cell(X63817, X63818), X63816 != X63818, domdomain(2, X63815), domdomain(3, X63816), domdomain(2, X63817), domdomain(3, X63818).
xplayerwin(X63827) :- xindex(X63817), true(cell(X63817, 5, xplayer), X63827), domdomain(2, X63817), tdom(X63827).
oplayerwin(X63827) :- xindex(X63817), true(cell(X63817, 1, oplayer), X63827), domdomain(2, X63817), tdom(X63827).
xplayerwin(X63819) :- not oplayercell(X63819), tdom(X63819).
oplayerwin(X63819) :- not xplayercell(X63819), tdom(X63819).
xplayercell(X63828) :- cell(X63817, X63818), true(cell(X63817, X63818, xplayer), X63828), domdomain(2, X63817), domdomain(3, X63818), tdom(X63828).
oplayercell(X63828) :- cell(X63817, X63818), true(cell(X63817, X63818, oplayer), X63828), domdomain(2, X63817), domdomain(3, X63818), tdom(X63828).
xindex(1).
xindex(2).
xindex(3).
yindex(1).
yindex(2).
yindex(3).
yindex(4).
yindex(5).
plusplusx(1, 2).
plusplusx(2, 3).
plusplusy(1, 2).
plusplusy(2, 3).
plusplusy(3, 4).
plusplusy(4, 5).
base(cell(X63817, X63818, X63819)) :- xindex(X63817), yindex(X63818), role(X63819), domdomain(2, X63817), domdomain(3, X63818), domdomain(4, X63819).
base(control(X63817)) :- role(X63817), domdomain(4, X63817).
input(xplayer, move(X63818, X63819, X63818, X63821)) :- xindex(X63818), plusplusy(X63819, X63821), domdomain(9, X63819), domdomain(10, X63821), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63818), domdomain(3, X63821).
input(xplayer, move(X63818, X63819, X63820, X63821)) :- plusplusy(X63819, X63821), plusplusx(X63818, X63820), domdomain(7, X63818), domdomain(8, X63820), domdomain(9, X63819), domdomain(10, X63821), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63820), domdomain(3, X63821).
input(xplayer, move(X63818, X63819, X63820, X63821)) :- plusplusy(X63819, X63821), plusplusx(X63820, X63818), domdomain(7, X63820), domdomain(8, X63818), domdomain(9, X63819), domdomain(10, X63821), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63820), domdomain(3, X63821).
input(oplayer, move(X63818, X63819, X63818, X63821)) :- xindex(X63818), plusplusy(X63821, X63819), domdomain(9, X63821), domdomain(10, X63819), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63818), domdomain(3, X63821).
input(oplayer, move(X63818, X63819, X63820, X63821)) :- plusplusy(X63821, X63819), plusplusx(X63818, X63820), domdomain(7, X63818), domdomain(8, X63820), domdomain(9, X63821), domdomain(10, X63819), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63820), domdomain(3, X63821).
input(oplayer, move(X63818, X63819, X63820, X63821)) :- plusplusy(X63821, X63819), plusplusx(X63820, X63818), domdomain(7, X63820), domdomain(8, X63818), domdomain(9, X63821), domdomain(10, X63819), domdomain(2, X63818), domdomain(3, X63819), domdomain(2, X63820), domdomain(3, X63821).
input(X63814, noop) :- role(X63814), domdomain(4, X63814).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(3, 1).
domdomain(3, 2).
domdomain(3, 3).
domdomain(3, 4).
domdomain(3, 5).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 100).
domdomain(6, move).
domdomain(6, noop).
domdomain(7, 1).
domdomain(7, 2).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 1).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
domdomain(10, 2).
domdomain(10, 3).
domdomain(10, 4).
domdomain(10, 5).
