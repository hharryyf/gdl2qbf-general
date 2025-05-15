mtdom(1..6).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
index(4).
base(cell(X54958, X54959, b)) :- index(X54958), index(X54959), domdomain(2, X54958), domdomain(2, X54959).
base(cell(X54958, X54959, x)) :- index(X54958), index(X54959), domdomain(2, X54958), domdomain(2, X54959).
base(cell(X54958, X54959, o)) :- index(X54958), index(X54959), domdomain(2, X54958), domdomain(2, X54959).
base(control1(X54958)) :- role(X54958), domdomain(4, X54958).
base(control2(X54958)) :- role(X54958), domdomain(4, X54958).
input(X54956, mark(X54959, X54960)) :- index(X54959), index(X54960), role(X54956), domdomain(4, X54956), domdomain(2, X54959), domdomain(2, X54960).
input(X54956, noop) :- role(X54956), domdomain(4, X54956).
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
true(control1(xplayer), 1).
true(cell(X54958, X54959, x), X54978 + 1) :- does(xplayer, mark(X54958, X54959), X54978), true(cell(X54958, X54959, b), X54978), mtdom(X54978), domdomain(2, X54958), domdomain(2, X54959).
true(cell(X54958, X54959, o), X54978 + 1) :- does(oplayer, mark(X54958, X54959), X54978), true(cell(X54958, X54959, b), X54978), mtdom(X54978), domdomain(2, X54958), domdomain(2, X54959).
true(cell(X54958, X54959, X54960), X54975 + 1) :- true(cell(X54958, X54959, X54960), X54975), X54960 != b, mtdom(X54975), domdomain(2, X54958), domdomain(2, X54959), domdomain(3, X54960).
true(cell(X54958, X54959, b), X54983 + 1) :- does(X54964, mark(X54967, X54968), X54983), true(cell(X54958, X54959, b), X54983), X54958 != X54967, domdomain(4, X54964), domdomain(2, X54967), domdomain(2, X54968), mtdom(X54983), domdomain(2, X54958), domdomain(2, X54959).
true(cell(X54958, X54959, b), X54983 + 1) :- does(X54964, mark(X54967, X54968), X54983), true(cell(X54958, X54959, b), X54983), X54959 != X54968, domdomain(4, X54964), domdomain(2, X54967), domdomain(2, X54968), mtdom(X54983), domdomain(2, X54958), domdomain(2, X54959).
true(control1(xplayer), X54966 + 1) :- true(control2(oplayer), X54966), mtdom(X54966).
true(control1(oplayer), X54966 + 1) :- true(control2(xplayer), X54966), mtdom(X54966).
true(control2(xplayer), X54966 + 1) :- true(control1(xplayer), X54966), mtdom(X54966).
true(control2(oplayer), X54966 + 1) :- true(control1(oplayer), X54966), mtdom(X54966).
open(X54964) :- true(cell(X54960, X54961, b), X54964), domdomain(2, X54960), domdomain(2, X54961), tdom(X54964).
legal(X54956, mark(X54959, X54960), X54976) :- true(cell(X54959, X54960, b), X54976), true(control1(X54956), X54976), tdom(X54976), domdomain(4, X54956), domdomain(2, X54959), domdomain(2, X54960).
legal(xplayer, noop, X54965) :- true(control1(oplayer), X54965), tdom(X54965).
legal(oplayer, noop, X54965) :- true(control1(xplayer), X54965), tdom(X54965).
legal(X54956, mark(X54959, X54960), X54976) :- true(cell(X54959, X54960, b), X54976), true(control2(X54956), X54976), tdom(X54976), domdomain(4, X54956), domdomain(2, X54959), domdomain(2, X54960).
legal(xplayer, noop, X54965) :- true(control2(oplayer), X54965), tdom(X54965).
legal(oplayer, noop, X54965) :- true(control2(xplayer), X54965), tdom(X54965).
goal(xplayer, 100, X54963) :- line(x, X54963), tdom(X54963).
goal(xplayer, 50, X54975) :- not line(x, X54975), not line(o, X54975), not open(X54975), tdom(X54975).
goal(xplayer, 0, X54963) :- line(o, X54963), tdom(X54963).
goal(oplayer, 100, X54963) :- line(o, X54963), tdom(X54963).
goal(oplayer, 50, X54975) :- not line(x, X54975), not line(o, X54975), not open(X54975), tdom(X54975).
goal(oplayer, 0, X54963) :- line(x, X54963), tdom(X54963).
terminal(X54960) :- line(x, X54960), tdom(X54960).
terminal(X54960) :- line(o, X54960), tdom(X54960).
terminal(X54960) :- not open(X54960), tdom(X54960).
succ(1, 2).
succ(2, 3).
succ(3, 4).
line(X54956, X55005) :- true(cell(X54962, X54963, X54956), X55005), true(cell(X54962, X54971, X54956), X55005), true(cell(X54962, X54979, X54956), X55005), true(cell(X54986, X54963, X54956), X55005), succ(X54963, X54971), succ(X54962, X54986), succ(X54971, X54979), domdomain(8, X54971), domdomain(9, X54979), domdomain(8, X54962), domdomain(9, X54986), domdomain(8, X54963), domdomain(9, X54971), domdomain(2, X54986), domdomain(2, X54979), domdomain(2, X54971), domdomain(2, X54962), domdomain(2, X54963), tdom(X55005), domdomain(3, X54956).
line(X54956, X55005) :- true(cell(X54962, X54963, X54956), X55005), true(cell(X54962, X54971, X54956), X55005), true(cell(X54962, X54979, X54956), X55005), true(cell(X54986, X54963, X54956), X55005), succ(X54963, X54971), succ(X54986, X54962), succ(X54971, X54979), domdomain(8, X54971), domdomain(9, X54979), domdomain(8, X54986), domdomain(9, X54962), domdomain(8, X54963), domdomain(9, X54971), domdomain(2, X54986), domdomain(2, X54979), domdomain(2, X54971), domdomain(2, X54962), domdomain(2, X54963), tdom(X55005), domdomain(3, X54956).
line(X54956, X55005) :- true(cell(X54962, X54963, X54956), X55005), true(cell(X54962, X54971, X54956), X55005), true(cell(X54962, X54979, X54956), X55005), true(cell(X54986, X54979, X54956), X55005), succ(X54963, X54971), succ(X54962, X54986), succ(X54971, X54979), domdomain(8, X54971), domdomain(9, X54979), domdomain(8, X54962), domdomain(9, X54986), domdomain(8, X54963), domdomain(9, X54971), domdomain(2, X54986), domdomain(2, X54979), domdomain(2, X54971), domdomain(2, X54962), domdomain(2, X54963), tdom(X55005), domdomain(3, X54956).
line(X54956, X55005) :- true(cell(X54962, X54963, X54956), X55005), true(cell(X54962, X54971, X54956), X55005), true(cell(X54962, X54979, X54956), X55005), true(cell(X54986, X54979, X54956), X55005), succ(X54963, X54971), succ(X54986, X54962), succ(X54971, X54979), domdomain(8, X54971), domdomain(9, X54979), domdomain(8, X54986), domdomain(9, X54962), domdomain(8, X54963), domdomain(9, X54971), domdomain(2, X54986), domdomain(2, X54979), domdomain(2, X54971), domdomain(2, X54962), domdomain(2, X54963), tdom(X55005), domdomain(3, X54956).
line(X54956, X55005) :- true(cell(X54962, X54963, X54956), X55005), true(cell(X54970, X54963, X54956), X55005), true(cell(X54978, X54963, X54956), X55005), true(cell(X54962, X54987, X54956), X55005), succ(X54963, X54987), succ(X54962, X54970), succ(X54970, X54978), domdomain(8, X54970), domdomain(9, X54978), domdomain(8, X54962), domdomain(9, X54970), domdomain(8, X54963), domdomain(9, X54987), domdomain(2, X54987), domdomain(2, X54978), domdomain(2, X54970), domdomain(2, X54962), domdomain(2, X54963), tdom(X55005), domdomain(3, X54956).
line(X54956, X55005) :- true(cell(X54962, X54963, X54956), X55005), true(cell(X54970, X54963, X54956), X55005), true(cell(X54978, X54963, X54956), X55005), true(cell(X54962, X54987, X54956), X55005), succ(X54987, X54963), succ(X54962, X54970), succ(X54970, X54978), domdomain(8, X54970), domdomain(9, X54978), domdomain(8, X54962), domdomain(9, X54970), domdomain(8, X54987), domdomain(9, X54963), domdomain(2, X54987), domdomain(2, X54978), domdomain(2, X54970), domdomain(2, X54962), domdomain(2, X54963), tdom(X55005), domdomain(3, X54956).
line(X54956, X55005) :- true(cell(X54962, X54963, X54956), X55005), true(cell(X54970, X54963, X54956), X55005), true(cell(X54978, X54963, X54956), X55005), true(cell(X54978, X54987, X54956), X55005), succ(X54963, X54987), succ(X54962, X54970), succ(X54970, X54978), domdomain(8, X54970), domdomain(9, X54978), domdomain(8, X54962), domdomain(9, X54970), domdomain(8, X54963), domdomain(9, X54987), domdomain(2, X54987), domdomain(2, X54978), domdomain(2, X54970), domdomain(2, X54962), domdomain(2, X54963), tdom(X55005), domdomain(3, X54956).
line(X54955, X55004) :- true(cell(X54961, X54962, X54955), X55004), true(cell(X54969, X54962, X54955), X55004), true(cell(X54977, X54962, X54955), X55004), true(cell(X54977, X54986, X54955), X55004), succ(X54986, X54962), succ(X54961, X54969), succ(X54969, X54977), domdomain(8, X54969), domdomain(9, X54977), domdomain(8, X54961), domdomain(9, X54969), domdomain(8, X54986), domdomain(9, X54962), domdomain(2, X54986), domdomain(2, X54977), domdomain(2, X54969), domdomain(2, X54961), domdomain(2, X54962), tdom(X55004), domdomain(3, X54955).
domdomain(1, cell).
domdomain(1, control1).
domdomain(1, control2).
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
domdomain(6, cell).
domdomain(6, control1).
domdomain(7, mark).
domdomain(7, noop).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
