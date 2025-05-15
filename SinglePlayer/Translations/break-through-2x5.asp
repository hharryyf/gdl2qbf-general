mtdom(1..21).
role(xplayer).
role(oplayer).
true(cell(1, 1, xplayer), 1).
true(cell(2, 1, xplayer), 1).
true(cell(1, 2, xplayer), 1).
true(cell(2, 2, xplayer), 1).
true(cell(1, 4, oplayer), 1).
true(cell(2, 4, oplayer), 1).
true(cell(1, 5, oplayer), 1).
true(cell(2, 5, oplayer), 1).
true(control(xplayer), 1).
legal(xplayer, move(X61959, X61960, X61959, X61962), X61988) :- true(control(xplayer), X61988), true(cell(X61959, X61960, xplayer), X61988), plusplusy(X61960, X61962), cellempty(X61959, X61962, X61988), domdomain(9, X61960), domdomain(10, X61962), tdom(X61988), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61959), domdomain(3, X61962).
legal(xplayer, move(X61959, X61960, X61961, X61962), X61998) :- true(control(xplayer), X61998), true(cell(X61959, X61960, xplayer), X61998), plusplusy(X61960, X61962), plusplusx(X61959, X61961), not true(cell(X61961, X61962, xplayer), X61998), domdomain(7, X61959), domdomain(8, X61961), domdomain(9, X61960), domdomain(10, X61962), tdom(X61998), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61961), domdomain(3, X61962).
legal(xplayer, move(X61959, X61960, X61961, X61962), X61998) :- true(control(xplayer), X61998), true(cell(X61959, X61960, xplayer), X61998), plusplusy(X61960, X61962), plusplusx(X61961, X61959), not true(cell(X61961, X61962, xplayer), X61998), domdomain(7, X61961), domdomain(8, X61959), domdomain(9, X61960), domdomain(10, X61962), tdom(X61998), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61961), domdomain(3, X61962).
legal(oplayer, move(X61959, X61960, X61959, X61962), X61988) :- true(control(oplayer), X61988), true(cell(X61959, X61960, oplayer), X61988), plusplusy(X61962, X61960), cellempty(X61959, X61962, X61988), domdomain(9, X61962), domdomain(10, X61960), tdom(X61988), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61959), domdomain(3, X61962).
legal(oplayer, move(X61959, X61960, X61961, X61962), X61998) :- true(control(oplayer), X61998), true(cell(X61959, X61960, oplayer), X61998), plusplusy(X61962, X61960), plusplusx(X61959, X61961), not true(cell(X61961, X61962, oplayer), X61998), domdomain(7, X61959), domdomain(8, X61961), domdomain(9, X61962), domdomain(10, X61960), tdom(X61998), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61961), domdomain(3, X61962).
legal(oplayer, move(X61959, X61960, X61961, X61962), X61998) :- true(control(oplayer), X61998), true(cell(X61959, X61960, oplayer), X61998), plusplusy(X61962, X61960), plusplusx(X61961, X61959), not true(cell(X61961, X61962, oplayer), X61998), domdomain(7, X61961), domdomain(8, X61959), domdomain(9, X61962), domdomain(10, X61960), tdom(X61998), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61961), domdomain(3, X61962).
legal(xplayer, noop, X61965) :- true(control(oplayer), X61965), tdom(X61965).
legal(oplayer, noop, X61965) :- true(control(xplayer), X61965), tdom(X61965).
true(cell(X61958, X61959, X61960), X61976 + 1) :- role(X61960), does(X61960, move(X61971, X61972, X61958, X61959), X61976), domdomain(2, X61971), domdomain(3, X61972), mtdom(X61976), domdomain(2, X61958), domdomain(3, X61959), domdomain(4, X61960).
true(cell(X61958, X61959, X61960), X61998 + 1) :- true(cell(X61958, X61959, X61960), X61998), role(X61972), does(X61972, move(X61979, X61980, X61981, X61982), X61998), differentcell(X61979, X61980, X61958, X61959), differentcell(X61981, X61982, X61958, X61959), domdomain(2, X61979), domdomain(3, X61980), domdomain(2, X61981), domdomain(3, X61982), domdomain(4, X61972), mtdom(X61998), domdomain(2, X61958), domdomain(3, X61959), domdomain(4, X61960).
true(control(xplayer), X61966 + 1) :- true(control(oplayer), X61966), mtdom(X61966).
true(control(oplayer), X61966 + 1) :- true(control(xplayer), X61966), mtdom(X61966).
terminal(X61958) :- xplayerwin(X61958), tdom(X61958).
terminal(X61958) :- oplayerwin(X61958), tdom(X61958).
goal(xplayer, 100, X61961) :- xplayerwin(X61961), tdom(X61961).
goal(xplayer, 0, X61963) :- not xplayerwin(X61963), tdom(X61963).
goal(oplayer, 100, X61961) :- oplayerwin(X61961), tdom(X61961).
goal(oplayer, 0, X61963) :- not oplayerwin(X61963), tdom(X61963).
cell(X61956, X61957) :- xindex(X61956), yindex(X61957), domdomain(2, X61956), domdomain(3, X61957).
cellempty(X61956, X61957, X61984) :- cell(X61956, X61957), not true(cell(X61956, X61957, xplayer), X61984), not true(cell(X61956, X61957, oplayer), X61984), tdom(X61984), domdomain(2, X61956), domdomain(3, X61957).
differentcell(X61956, X61957, X61958, X61959) :- cell(X61956, X61957), cell(X61958, X61959), X61956 != X61958, domdomain(2, X61956), domdomain(3, X61957), domdomain(2, X61958), domdomain(3, X61959).
differentcell(X61956, X61957, X61958, X61959) :- cell(X61956, X61957), cell(X61958, X61959), X61957 != X61959, domdomain(2, X61956), domdomain(3, X61957), domdomain(2, X61958), domdomain(3, X61959).
xplayerwin(X61968) :- xindex(X61958), true(cell(X61958, 5, xplayer), X61968), domdomain(2, X61958), tdom(X61968).
oplayerwin(X61968) :- xindex(X61958), true(cell(X61958, 1, oplayer), X61968), domdomain(2, X61958), tdom(X61968).
xplayerwin(X61960) :- not oplayercell(X61960), tdom(X61960).
oplayerwin(X61960) :- not xplayercell(X61960), tdom(X61960).
xplayercell(X61969) :- cell(X61958, X61959), true(cell(X61958, X61959, xplayer), X61969), domdomain(2, X61958), domdomain(3, X61959), tdom(X61969).
oplayercell(X61969) :- cell(X61958, X61959), true(cell(X61958, X61959, oplayer), X61969), domdomain(2, X61958), domdomain(3, X61959), tdom(X61969).
xindex(1).
xindex(2).
yindex(1).
yindex(2).
yindex(3).
yindex(4).
yindex(5).
plusplusx(1, 2).
plusplusy(1, 2).
plusplusy(2, 3).
plusplusy(3, 4).
plusplusy(4, 5).
base(cell(X61958, X61959, X61960)) :- xindex(X61958), yindex(X61959), role(X61960), domdomain(2, X61958), domdomain(3, X61959), domdomain(4, X61960).
base(control(X61958)) :- role(X61958), domdomain(4, X61958).
input(xplayer, move(X61959, X61960, X61959, X61962)) :- xindex(X61959), plusplusy(X61960, X61962), domdomain(9, X61960), domdomain(10, X61962), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61959), domdomain(3, X61962).
input(xplayer, move(X61959, X61960, X61961, X61962)) :- plusplusy(X61960, X61962), plusplusx(X61959, X61961), domdomain(7, X61959), domdomain(8, X61961), domdomain(9, X61960), domdomain(10, X61962), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61961), domdomain(3, X61962).
input(xplayer, move(X61959, X61960, X61961, X61962)) :- plusplusy(X61960, X61962), plusplusx(X61961, X61959), domdomain(7, X61961), domdomain(8, X61959), domdomain(9, X61960), domdomain(10, X61962), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61961), domdomain(3, X61962).
input(oplayer, move(X61959, X61960, X61959, X61962)) :- xindex(X61959), plusplusy(X61962, X61960), domdomain(9, X61962), domdomain(10, X61960), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61959), domdomain(3, X61962).
input(oplayer, move(X61959, X61960, X61961, X61962)) :- plusplusy(X61962, X61960), plusplusx(X61959, X61961), domdomain(7, X61959), domdomain(8, X61961), domdomain(9, X61962), domdomain(10, X61960), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61961), domdomain(3, X61962).
input(oplayer, move(X61959, X61960, X61961, X61962)) :- plusplusy(X61962, X61960), plusplusx(X61961, X61959), domdomain(7, X61961), domdomain(8, X61959), domdomain(9, X61962), domdomain(10, X61960), domdomain(2, X61959), domdomain(3, X61960), domdomain(2, X61961), domdomain(3, X61962).
input(X61955, noop) :- role(X61955), domdomain(4, X61955).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
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
domdomain(8, 2).
domdomain(9, 1).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
domdomain(10, 2).
domdomain(10, 3).
domdomain(10, 4).
domdomain(10, 5).
