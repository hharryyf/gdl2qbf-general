mtdom(1..16).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X40044, X40045, x)) :- index(X40044), index(X40045), domdomain(2, X40044), domdomain(2, X40045).
base(cell(X40044, X40045, o)) :- index(X40044), index(X40045), domdomain(2, X40044), domdomain(2, X40045).
base(control1(X40044)) :- role(X40044), domdomain(4, X40044).
base(control2(X40044)) :- role(X40044), domdomain(4, X40044).
input(X40042, mark(X40045, X40046)) :- index(X40045), index(X40046), role(X40042), domdomain(4, X40042), domdomain(2, X40045), domdomain(2, X40046).
input(X40042, noop) :- role(X40042), domdomain(4, X40042).
true(control1(xplayer), 1).
true(cell(X40044, X40045, x), X40056 + 1) :- does(xplayer, mark(X40044, X40045), X40056), mtdom(X40056), domdomain(2, X40044), domdomain(2, X40045).
true(cell(X40044, X40045, o), X40056 + 1) :- does(oplayer, mark(X40044, X40045), X40056), mtdom(X40056), domdomain(2, X40044), domdomain(2, X40045).
true(cell(X40044, X40045, X40046), X40056 + 1) :- true(cell(X40044, X40045, X40046), X40056), mtdom(X40056), domdomain(2, X40044), domdomain(2, X40045), domdomain(3, X40046).
true(control1(xplayer), X40052 + 1) :- true(control2(oplayer), X40052), mtdom(X40052).
true(control1(oplayer), X40052 + 1) :- true(control2(xplayer), X40052), mtdom(X40052).
true(control2(xplayer), X40052 + 1) :- true(control1(xplayer), X40052), mtdom(X40052).
true(control2(oplayer), X40052 + 1) :- true(control1(oplayer), X40052), mtdom(X40052).
open(X40070) :- not true(cell(X40048, X40049, x), X40070), not true(cell(X40048, X40049, o), X40070), index(X40048), index(X40049), domdomain(2, X40048), domdomain(2, X40049), tdom(X40070).
legal(X40042, mark(X40045, X40046), X40082) :- not true(cell(X40045, X40046, x), X40082), not true(cell(X40045, X40046, o), X40082), true(control1(X40042), X40082), index(X40045), index(X40046), tdom(X40082), domdomain(4, X40042), domdomain(2, X40045), domdomain(2, X40046).
legal(xplayer, noop, X40051) :- true(control1(oplayer), X40051), tdom(X40051).
legal(oplayer, noop, X40051) :- true(control1(xplayer), X40051), tdom(X40051).
legal(X40042, mark(X40045, X40046), X40082) :- not true(cell(X40045, X40046, x), X40082), not true(cell(X40045, X40046, o), X40082), true(control2(X40042), X40082), index(X40045), index(X40046), tdom(X40082), domdomain(4, X40042), domdomain(2, X40045), domdomain(2, X40046).
legal(xplayer, noop, X40051) :- true(control2(oplayer), X40051), tdom(X40051).
legal(oplayer, noop, X40051) :- true(control2(xplayer), X40051), tdom(X40051).
goal(xplayer, 100, X40049) :- line(x, X40049), tdom(X40049).
goal(xplayer, 50, X40061) :- not line(x, X40061), not line(o, X40061), not open(X40061), tdom(X40061).
goal(xplayer, 0, X40049) :- line(o, X40049), tdom(X40049).
goal(oplayer, 100, X40049) :- line(o, X40049), tdom(X40049).
goal(oplayer, 50, X40061) :- not line(x, X40061), not line(o, X40061), not open(X40061), tdom(X40061).
goal(oplayer, 0, X40049) :- line(x, X40049), tdom(X40049).
terminal(X40046) :- line(x, X40046), tdom(X40046).
terminal(X40046) :- line(o, X40046), tdom(X40046).
terminal(X40046) :- not open(X40046), tdom(X40046).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X40042, X40091) :- true(cell(X40048, X40049, X40042), X40091), true(cell(X40048, X40057, X40042), X40091), true(cell(X40064, X40057, X40042), X40091), true(cell(X40064, X40073, X40042), X40091), succ(X40049, X40057), succ(X40048, X40064), succ(X40057, X40073), domdomain(8, X40057), domdomain(9, X40073), domdomain(8, X40048), domdomain(9, X40064), domdomain(8, X40049), domdomain(9, X40057), domdomain(2, X40073), domdomain(2, X40064), domdomain(2, X40057), domdomain(2, X40048), domdomain(2, X40049), tdom(X40091), domdomain(3, X40042).
line(X40042, X40091) :- true(cell(X40048, X40049, X40042), X40091), true(cell(X40048, X40057, X40042), X40091), true(cell(X40064, X40065, X40042), X40091), true(cell(X40064, X40049, X40042), X40091), succ(X40065, X40049), succ(X40048, X40064), succ(X40049, X40057), domdomain(8, X40049), domdomain(9, X40057), domdomain(8, X40048), domdomain(9, X40064), domdomain(8, X40065), domdomain(9, X40049), domdomain(2, X40064), domdomain(2, X40065), domdomain(2, X40057), domdomain(2, X40048), domdomain(2, X40049), tdom(X40091), domdomain(3, X40042).
line(X40042, X40091) :- true(cell(X40048, X40049, X40042), X40091), true(cell(X40056, X40049, X40042), X40091), true(cell(X40056, X40065, X40042), X40091), true(cell(X40072, X40065, X40042), X40091), succ(X40049, X40065), succ(X40048, X40056), succ(X40056, X40072), domdomain(8, X40056), domdomain(9, X40072), domdomain(8, X40048), domdomain(9, X40056), domdomain(8, X40049), domdomain(9, X40065), domdomain(2, X40072), domdomain(2, X40065), domdomain(2, X40056), domdomain(2, X40048), domdomain(2, X40049), tdom(X40091), domdomain(3, X40042).
line(X40041, X40090) :- true(cell(X40047, X40048, X40041), X40090), true(cell(X40055, X40056, X40041), X40090), true(cell(X40055, X40048, X40041), X40090), true(cell(X40071, X40056, X40041), X40090), succ(X40056, X40048), succ(X40047, X40055), succ(X40055, X40071), domdomain(8, X40055), domdomain(9, X40071), domdomain(8, X40047), domdomain(9, X40055), domdomain(8, X40056), domdomain(9, X40048), domdomain(2, X40071), domdomain(2, X40055), domdomain(2, X40056), domdomain(2, X40047), domdomain(2, X40048), tdom(X40090), domdomain(3, X40041).
domdomain(1, cell).
domdomain(1, control1).
domdomain(1, control2).
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
domdomain(6, control1).
domdomain(7, mark).
domdomain(7, noop).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
