mtdom(1..17).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
base(cell(X46952, X46953, blank)) :- index(X46952), index(X46953), domdomain(2, X46952), domdomain(2, X46953).
base(cell(X46952, X46953, red)) :- index(X46952), index(X46953), domdomain(2, X46952), domdomain(2, X46953).
base(cell(X46952, X46953, yellow)) :- index(X46952), index(X46953), domdomain(2, X46952), domdomain(2, X46953).
base(cell(X46952, X46953, green)) :- index(X46952), index(X46953), domdomain(2, X46952), domdomain(2, X46953).
base(control(X46952)) :- role(X46952), domdomain(4, X46952).
input(X46950, mark(X46953, X46954, red)) :- index(X46953), index(X46954), role(X46950), domdomain(4, X46950), domdomain(2, X46953), domdomain(2, X46954).
input(X46950, mark(X46953, X46954, yellow)) :- index(X46953), index(X46954), role(X46950), domdomain(4, X46950), domdomain(2, X46953), domdomain(2, X46954).
input(X46950, mark(X46953, X46954, green)) :- index(X46953), index(X46954), role(X46950), domdomain(4, X46950), domdomain(2, X46953), domdomain(2, X46954).
input(X46950, noop) :- role(X46950), domdomain(4, X46950).
true(cell(1, 1, blank), 1).
true(cell(1, 2, blank), 1).
true(cell(1, 3, blank), 1).
true(cell(2, 1, blank), 1).
true(cell(2, 2, blank), 1).
true(cell(2, 3, blank), 1).
true(cell(3, 1, blank), 1).
true(cell(3, 2, blank), 1).
true(cell(3, 3, blank), 1).
true(control(xplayer), 1).
true(cell(X46952, X46953, red), X46973 + 1) :- does(X46958, mark(X46952, X46953, red), X46973), true(cell(X46952, X46953, blank), X46973), domdomain(4, X46958), mtdom(X46973), domdomain(2, X46952), domdomain(2, X46953).
true(cell(X46952, X46953, yellow), X46973 + 1) :- does(X46958, mark(X46952, X46953, yellow), X46973), true(cell(X46952, X46953, red), X46973), domdomain(4, X46958), mtdom(X46973), domdomain(2, X46952), domdomain(2, X46953).
true(cell(X46952, X46953, green), X46973 + 1) :- does(X46958, mark(X46952, X46953, green), X46973), true(cell(X46952, X46953, yellow), X46973), domdomain(4, X46958), mtdom(X46973), domdomain(2, X46952), domdomain(2, X46953).
true(cell(X46952, X46953, X46954), X46978 + 1) :- does(X46958, mark(X46961, X46962, X46963), X46978), true(cell(X46952, X46953, X46954), X46978), X46952 != X46961, domdomain(4, X46958), domdomain(2, X46961), domdomain(2, X46962), domdomain(7, X46963), mtdom(X46978), domdomain(2, X46952), domdomain(2, X46953), domdomain(3, X46954).
true(cell(X46952, X46953, X46954), X46978 + 1) :- does(X46958, mark(X46961, X46962, X46963), X46978), true(cell(X46952, X46953, X46954), X46978), X46953 != X46962, domdomain(4, X46958), domdomain(2, X46961), domdomain(2, X46962), domdomain(7, X46963), mtdom(X46978), domdomain(2, X46952), domdomain(2, X46953), domdomain(3, X46954).
true(control(xplayer), X46960 + 1) :- true(control(oplayer), X46960), mtdom(X46960).
true(control(oplayer), X46960 + 1) :- true(control(xplayer), X46960), mtdom(X46960).
legal(X46950, mark(X46953, X46954, red), X46971) :- true(cell(X46953, X46954, blank), X46971), true(control(X46950), X46971), tdom(X46971), domdomain(4, X46950), domdomain(2, X46953), domdomain(2, X46954).
legal(X46950, mark(X46953, X46954, yellow), X46971) :- true(cell(X46953, X46954, red), X46971), true(control(X46950), X46971), tdom(X46971), domdomain(4, X46950), domdomain(2, X46953), domdomain(2, X46954).
legal(X46950, mark(X46953, X46954, green), X46971) :- true(cell(X46953, X46954, yellow), X46971), true(control(X46950), X46971), tdom(X46971), domdomain(4, X46950), domdomain(2, X46953), domdomain(2, X46954).
legal(xplayer, noop, X46959) :- true(control(oplayer), X46959), tdom(X46959).
legal(oplayer, noop, X46959) :- true(control(xplayer), X46959), tdom(X46959).
terminal(X46952) :- aline(X46952), tdom(X46952).
terminal(X46954) :- not open(X46954), tdom(X46954).
goal(xplayer, 100, X46961) :- aline(X46961), true(control(oplayer), X46961), tdom(X46961).
goal(xplayer, 50, X46961) :- not aline(X46961), not open(X46961), tdom(X46961).
goal(xplayer, 0, X46961) :- aline(X46961), true(control(xplayer), X46961), tdom(X46961).
goal(oplayer, 100, X46961) :- aline(X46961), true(control(xplayer), X46961), tdom(X46961).
goal(oplayer, 50, X46961) :- not aline(X46961), not open(X46961), tdom(X46961).
goal(oplayer, 0, X46961) :- aline(X46961), true(control(oplayer), X46961), tdom(X46961).
row(X46950, X46951, X46977) :- true(cell(X46950, 1, X46951), X46977), true(cell(X46950, 2, X46951), X46977), true(cell(X46950, 3, X46951), X46977), tdom(X46977), domdomain(2, X46950), domdomain(3, X46951).
column(X46950, X46951, X46977) :- true(cell(1, X46950, X46951), X46977), true(cell(2, X46950, X46951), X46977), true(cell(3, X46950, X46951), X46977), tdom(X46977), domdomain(2, X46950), domdomain(3, X46951).
diagonal(X46950, X46976) :- true(cell(1, 1, X46950), X46976), true(cell(2, 2, X46950), X46976), true(cell(3, 3, X46950), X46976), tdom(X46976), domdomain(3, X46950).
diagonal(X46950, X46976) :- true(cell(1, 3, X46950), X46976), true(cell(2, 2, X46950), X46976), true(cell(3, 1, X46950), X46976), tdom(X46976), domdomain(3, X46950).
line(X46950, X46957) :- row(X46954, X46950, X46957), domdomain(2, X46954), tdom(X46957), domdomain(3, X46950).
line(X46950, X46957) :- column(X46954, X46950, X46957), domdomain(2, X46954), tdom(X46957), domdomain(3, X46950).
line(X46950, X46956) :- diagonal(X46950, X46956), tdom(X46956), domdomain(3, X46950).
aline(X46954) :- line(red, X46954), tdom(X46954).
aline(X46954) :- line(yellow, X46954), tdom(X46954).
aline(X46954) :- line(green, X46954), tdom(X46954).
open(X46958) :- true(cell(X46954, X46955, blank), X46958), domdomain(2, X46954), domdomain(2, X46955), tdom(X46958).
open(X46958) :- true(cell(X46954, X46955, red), X46958), domdomain(2, X46954), domdomain(2, X46955), tdom(X46958).
open(X46957) :- true(cell(X46953, X46954, yellow), X46957), domdomain(2, X46953), domdomain(2, X46954), tdom(X46957).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(3, blank).
domdomain(3, green).
domdomain(3, red).
domdomain(3, yellow).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 50).
domdomain(5, 100).
domdomain(6, mark).
domdomain(6, noop).
domdomain(7, green).
domdomain(7, red).
domdomain(7, yellow).
