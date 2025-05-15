mtdom(1..9).
role(odd).
role(even).
true(cell(1, 1, b), 1).
true(cell(1, 2, b), 1).
true(cell(1, 3, b), 1).
true(cell(2, 1, b), 1).
true(cell(2, 2, b), 1).
true(cell(2, 3, b), 1).
true(cell(3, 1, b), 1).
true(cell(3, 2, b), 1).
true(cell(3, 3, b), 1).
true(control(odd), 1).
numberof(odd, 1).
numberof(even, 2).
numberof(odd, 3).
numberof(even, 4).
numberof(odd, 5).
numberof(even, 6).
numberof(odd, 7).
numberof(even, 8).
numberof(odd, 9).
iswinline(X32577, X32578, X32579) :- isrightsum(X32577, X32578, X32579), domdomain(6, X32577), domdomain(7, X32578), domdomain(8, X32579), domdomain(9, X32577), domdomain(9, X32578), domdomain(9, X32579).
iswinline(X32577, X32578, X32579) :- isrightsum(X32577, X32579, X32578), domdomain(6, X32577), domdomain(7, X32579), domdomain(8, X32578), domdomain(9, X32577), domdomain(9, X32578), domdomain(9, X32579).
iswinline(X32577, X32578, X32579) :- isrightsum(X32578, X32577, X32579), domdomain(6, X32578), domdomain(7, X32577), domdomain(8, X32579), domdomain(9, X32577), domdomain(9, X32578), domdomain(9, X32579).
iswinline(X32577, X32578, X32579) :- isrightsum(X32578, X32579, X32577), domdomain(6, X32578), domdomain(7, X32579), domdomain(8, X32577), domdomain(9, X32577), domdomain(9, X32578), domdomain(9, X32579).
iswinline(X32577, X32578, X32579) :- isrightsum(X32579, X32577, X32578), domdomain(6, X32579), domdomain(7, X32577), domdomain(8, X32578), domdomain(9, X32577), domdomain(9, X32578), domdomain(9, X32579).
iswinline(X32577, X32578, X32579) :- isrightsum(X32579, X32578, X32577), domdomain(6, X32579), domdomain(7, X32578), domdomain(8, X32577), domdomain(9, X32577), domdomain(9, X32578), domdomain(9, X32579).
isrightsum(1, 5, 9).
isrightsum(1, 6, 8).
isrightsum(2, 4, 9).
isrightsum(2, 5, 8).
isrightsum(2, 6, 7).
isrightsum(3, 4, 8).
isrightsum(3, 5, 7).
isrightsum(4, 5, 6).
true(cell(X32579, X32580, X32581), X32600 + 1) :- does(X32585, mark(X32579, X32580, X32581), X32600), true(cell(X32579, X32580, b), X32600), domdomain(3, X32585), mtdom(X32600), domdomain(1, X32579), domdomain(1, X32580), domdomain(2, X32581).
true(cell(X32579, X32580, X32581), X32596 + 1) :- true(cell(X32579, X32580, X32581), X32596), X32581 != b, mtdom(X32596), domdomain(1, X32579), domdomain(1, X32580), domdomain(2, X32581).
true(cell(X32579, X32580, b), X32611 + 1) :- does(X32585, mark(X32588, X32589, X32590), X32611), true(cell(X32579, X32580, b), X32611), 1 { X32579 != X32588 ; X32580 != X32589 }, domdomain(3, X32585), domdomain(1, X32588), domdomain(1, X32589), domdomain(2, X32590), mtdom(X32611), domdomain(1, X32579), domdomain(1, X32580).
true(control(even), X32587 + 1) :- true(control(odd), X32587), mtdom(X32587).
true(control(odd), X32587 + 1) :- true(control(even), X32587), mtdom(X32587).
row(X32577, X32609) :- true(cell(X32577, 1, X32585), X32609), true(cell(X32577, 2, X32593), X32609), true(cell(X32577, 3, X32601), X32609), iswinline(X32585, X32593, X32601), domdomain(9, X32585), domdomain(9, X32593), domdomain(9, X32601), domdomain(2, X32601), domdomain(2, X32593), domdomain(2, X32585), tdom(X32609), domdomain(1, X32577).
column(X32577, X32609) :- true(cell(1, X32577, X32585), X32609), true(cell(2, X32577, X32593), X32609), true(cell(3, X32577, X32601), X32609), iswinline(X32585, X32593, X32601), domdomain(9, X32585), domdomain(9, X32593), domdomain(9, X32601), domdomain(2, X32601), domdomain(2, X32593), domdomain(2, X32585), tdom(X32609), domdomain(1, X32577).
diagonal(X32607) :- true(cell(1, 1, X32583), X32607), true(cell(2, 2, X32591), X32607), true(cell(3, 3, X32599), X32607), iswinline(X32583, X32591, X32599), domdomain(9, X32583), domdomain(9, X32591), domdomain(9, X32599), domdomain(2, X32599), domdomain(2, X32591), domdomain(2, X32583), tdom(X32607).
diagonal(X32607) :- true(cell(1, 3, X32583), X32607), true(cell(2, 2, X32591), X32607), true(cell(3, 1, X32599), X32607), iswinline(X32583, X32591, X32599), domdomain(9, X32583), domdomain(9, X32591), domdomain(9, X32599), domdomain(2, X32599), domdomain(2, X32591), domdomain(2, X32583), tdom(X32607).
line(X32581) :- row(X32579, X32581), domdomain(1, X32579), tdom(X32581).
line(X32581) :- column(X32579, X32581), domdomain(1, X32579), tdom(X32581).
line(X32579) :- diagonal(X32579), tdom(X32579).
open(X32585) :- true(cell(X32581, X32582, b), X32585), domdomain(1, X32581), domdomain(1, X32582), tdom(X32585).
legal(X32577, mark(X32580, X32581, X32582), X32609) :- numberof(X32577, X32582), not cellwith(X32582, X32609), true(cell(X32580, X32581, b), X32609), true(control(X32577), X32609), domdomain(9, X32582), tdom(X32609), domdomain(3, X32577), domdomain(1, X32580), domdomain(1, X32581), domdomain(2, X32582).
cellwith(X32577, X32587) :- true(cell(X32583, X32584, X32577), X32587), domdomain(1, X32583), domdomain(1, X32584), tdom(X32587), domdomain(2, X32577).
legal(odd, noop, X32594) :- true(cell(X32584, X32585, b), X32594), true(control(even), X32594), domdomain(1, X32584), domdomain(1, X32585), tdom(X32594).
legal(even, noop, X32594) :- true(cell(X32584, X32585, b), X32594), true(control(odd), X32594), domdomain(1, X32584), domdomain(1, X32585), tdom(X32594).
goal(X32577, 100, X32597) :- line(X32597), role(X32577), true(control(X32590), X32597), X32577 != X32590, domdomain(3, X32590), tdom(X32597), domdomain(3, X32577).
goal(X32577, 50, X32588) :- role(X32577), not line(X32588), tdom(X32588), domdomain(3, X32577).
goal(X32577, 0, X32588) :- line(X32588), true(control(X32577), X32588), tdom(X32588), domdomain(3, X32577).
terminal(X32579) :- line(X32579), tdom(X32579).
terminal(X32580) :- not open(X32580), tdom(X32580).
domdomain(1, 1).
domdomain(1, 2).
domdomain(1, 3).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(2, 5).
domdomain(2, 6).
domdomain(2, 7).
domdomain(2, 8).
domdomain(2, 9).
domdomain(2, b).
domdomain(3, even).
domdomain(3, odd).
domdomain(4, 0).
domdomain(4, 50).
domdomain(4, 100).
domdomain(5, cell).
domdomain(5, control).
domdomain(6, 1).
domdomain(6, 2).
domdomain(6, 3).
domdomain(6, 4).
domdomain(7, 4).
domdomain(7, 5).
domdomain(7, 6).
domdomain(8, 6).
domdomain(8, 7).
domdomain(8, 8).
domdomain(8, 9).
domdomain(9, 1).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
domdomain(9, 5).
domdomain(9, 6).
domdomain(9, 7).
domdomain(9, 8).
domdomain(9, 9).
domdomain(10, mark).
domdomain(10, noop).
