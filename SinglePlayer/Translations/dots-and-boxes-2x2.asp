mtdom(1..12).
role(xplayer).
role(oplayer).
index(1).
index(2).
index(3).
nextXindex(1, 2).
nextXindex(2, 3).
true(boxXcount(xplayer, 0), 1).
true(boxXcount(oplayer, 0), 1).
true(control(xplayer), 1).
undrawn(X58965, X58966, X58965, X58968, X58990) :- index(X58965), nextXindex(X58966, X58968), not true(line(X58965, X58966, X58965, X58968), X58990), domdomain(11, X58966), domdomain(12, X58968), tdom(X58990), domdomain(2, X58965), domdomain(2, X58966), domdomain(2, X58965), domdomain(2, X58968).
undrawn(X58965, X58966, X58967, X58966, X58990) :- nextXindex(X58965, X58967), index(X58966), not true(line(X58965, X58966, X58967, X58966), X58990), domdomain(11, X58965), domdomain(12, X58967), tdom(X58990), domdomain(2, X58965), domdomain(2, X58966), domdomain(2, X58967), domdomain(2, X58966).
anyXundrawn(X58972) :- undrawn(X58967, X58968, X58969, X58970, X58972), domdomain(2, X58967), domdomain(2, X58968), domdomain(2, X58969), domdomain(2, X58970), tdom(X58972).
legal(X58965, draw(X58968, X58969, X58970, X58971), X58986) :- true(control(X58965), X58986), undrawn(X58968, X58969, X58970, X58971, X58986), tdom(X58986), domdomain(4, X58965), domdomain(2, X58968), domdomain(2, X58969), domdomain(2, X58970), domdomain(2, X58971).
true(line(X58967, X58968, X58969, X58970), X58982 + 1) :- does(X58974, draw(X58967, X58968, X58969, X58970), X58982), domdomain(4, X58974), mtdom(X58982), domdomain(2, X58967), domdomain(2, X58968), domdomain(2, X58969), domdomain(2, X58970).
true(line(X58967, X58968, X58969, X58970), X58981 + 1) :- true(line(X58967, X58968, X58969, X58970), X58981), mtdom(X58981), domdomain(2, X58967), domdomain(2, X58968), domdomain(2, X58969), domdomain(2, X58970).
legal(X58965, noop, X58980) :- role(X58965), not true(control(X58965), X58980), tdom(X58980), domdomain(4, X58965).
vXdrawn(X58965, X58966, X58965, X58968, X58980) :- does(X58972, draw(X58965, X58966, X58965, X58968), X58980), domdomain(4, X58972), tdom(X58980), domdomain(2, X58965), domdomain(2, X58966), domdomain(2, X58965), domdomain(2, X58968).
hXdrawn(X58965, X58966, X58967, X58966, X58980) :- does(X58972, draw(X58965, X58966, X58967, X58966), X58980), domdomain(4, X58972), tdom(X58980), domdomain(2, X58965), domdomain(2, X58966), domdomain(2, X58967), domdomain(2, X58966).
boxXformed(X58965, X58966, X59002) :- vXdrawn(X58965, X58966, X58965, X58973, X59002), true(line(X58965, X58973, X58981, X58973), X59002), true(line(X58965, X58966, X58981, X58966), X59002), true(line(X58981, X58966, X58981, X58973), X59002), domdomain(2, X58981), domdomain(2, X58973), tdom(X59002), domdomain(2, X58965), domdomain(2, X58966).
boxXformed(X58965, X58966, X59002) :- vXdrawn(X58970, X58966, X58970, X58973, X59002), true(line(X58965, X58966, X58970, X58966), X59002), true(line(X58965, X58966, X58965, X58973), X59002), true(line(X58965, X58973, X58970, X58973), X59002), domdomain(2, X58970), domdomain(2, X58970), domdomain(2, X58973), tdom(X59002), domdomain(2, X58965), domdomain(2, X58966).
boxXformed(X58965, X58966, X59002) :- hXdrawn(X58965, X58966, X58972, X58966, X59002), true(line(X58972, X58966, X58972, X58982), X59002), true(line(X58965, X58966, X58965, X58982), X59002), true(line(X58965, X58982, X58972, X58982), X59002), domdomain(2, X58982), domdomain(2, X58972), tdom(X59002), domdomain(2, X58965), domdomain(2, X58966).
boxXformed(X58965, X58966, X59002) :- hXdrawn(X58965, X58971, X58972, X58971, X59002), true(line(X58965, X58966, X58965, X58971), X59002), true(line(X58965, X58966, X58972, X58966), X59002), true(line(X58972, X58966, X58972, X58971), X59002), domdomain(2, X58971), domdomain(2, X58972), domdomain(2, X58971), tdom(X59002), domdomain(2, X58965), domdomain(2, X58966).
anyXboxXformed(X58970) :- boxXformed(X58967, X58968, X58970), domdomain(2, X58967), domdomain(2, X58968), tdom(X58970).
twoXboxesXformed(X58986) :- boxXformed(X58967, X58968, X58986), boxXformed(X58972, X58973, X58986), 1 { X58967 != X58972 ; X58968 != X58973 }, domdomain(2, X58972), domdomain(2, X58973), domdomain(2, X58967), domdomain(2, X58968), tdom(X58986).
true(boxXcount(X58967, X58968), X58985 + 1) :- true(boxXcount(X58967, X58968), X58985), not true(control(X58967), X58985), mtdom(X58985), domdomain(4, X58967), domdomain(5, X58968).
true(boxXcount(X58967, X58968), X58987 + 1) :- true(boxXcount(X58967, X58968), X58987), true(control(X58967), X58987), not anyXboxXformed(X58987), tdom(X58987), mtdom(X58987), domdomain(4, X58967), domdomain(5, X58968).
true(boxXcount(X58967, X58968), X58994 + 1) :- true(boxXcount(X58967, X58975), X58994), true(control(X58967), X58994), anyXboxXformed(X58994), not twoXboxesXformed(X58994), succ(X58975, X58968), domdomain(8, X58975), domdomain(7, X58968), tdom(X58994), domdomain(5, X58975), mtdom(X58994), domdomain(4, X58967), domdomain(5, X58968).
true(boxXcount(X58967, X58968), X58995 + 1) :- true(boxXcount(X58967, X58975), X58995), true(control(X58967), X58995), twoXboxesXformed(X58995), succ(X58975, X58988), succ(X58988, X58968), domdomain(8, X58988), domdomain(7, X58968), domdomain(8, X58975), domdomain(7, X58988), tdom(X58995), domdomain(5, X58975), mtdom(X58995), domdomain(4, X58967), domdomain(5, X58968).
true(control(X58967), X58977 + 1) :- true(control(X58967), X58977), anyXboxXformed(X58977), tdom(X58977), mtdom(X58977), domdomain(4, X58967).
true(control(xplayer), X58979 + 1) :- true(control(oplayer), X58979), not anyXboxXformed(X58979), tdom(X58979), mtdom(X58979).
true(control(oplayer), X58979 + 1) :- true(control(xplayer), X58979), not anyXboxXformed(X58979), tdom(X58979), mtdom(X58979).
true(box(X58967, X58968, x), X58982 + 1) :- boxXformed(X58967, X58968, X58982), true(control(xplayer), X58982), tdom(X58982), mtdom(X58982), domdomain(2, X58967), domdomain(2, X58968).
true(box(X58967, X58968, o), X58982 + 1) :- boxXformed(X58967, X58968, X58982), true(control(oplayer), X58982), tdom(X58982), mtdom(X58982), domdomain(2, X58967), domdomain(2, X58968).
true(box(X58967, X58968, X58969), X58979 + 1) :- true(box(X58967, X58968, X58969), X58979), mtdom(X58979), domdomain(2, X58967), domdomain(2, X58968), domdomain(3, X58969).
terminal(X58969) :- not anyXundrawn(X58969), tdom(X58969).
xXwins(X58984) :- true(boxXcount(xplayer, X58970), X58984), true(boxXcount(oplayer, X58977), X58984), gt(X58970, X58977), domdomain(7, X58970), domdomain(8, X58977), domdomain(5, X58977), domdomain(5, X58970), tdom(X58984).
oXwins(X58984) :- true(boxXcount(xplayer, X58970), X58984), true(boxXcount(oplayer, X58977), X58984), gt(X58977, X58970), domdomain(7, X58977), domdomain(8, X58970), domdomain(5, X58977), domdomain(5, X58970), tdom(X58984).
oXwins(X58979) :- true(boxXcount(xplayer, X58970), X58979), true(boxXcount(oplayer, X58970), X58979), domdomain(5, X58970), tdom(X58979).
goal(xplayer, 100, X58970) :- xXwins(X58970), tdom(X58970).
goal(xplayer, 0, X58972) :- not xXwins(X58972), tdom(X58972).
goal(oplayer, 100, X58970) :- oXwins(X58970), tdom(X58970).
goal(oplayer, 0, X58972) :- not oXwins(X58972), tdom(X58972).
gt(X58965, X58966) :- succ(X58966, X58965), domdomain(7, X58965), domdomain(8, X58966).
gt(X58965, X58966) :- succ(X58970, X58965), gt(X58970, X58966), succ(X58966, X58981), domdomain(7, X58981), domdomain(7, X58970), domdomain(8, X58970), domdomain(7, X58965), domdomain(8, X58966).
succ(0, 1).
succ(1, 2).
succ(2, 3).
succ(3, 4).
base(boxXcount(X58967, 0)) :- role(X58967), domdomain(4, X58967).
base(boxXcount(X58967, X58968)) :- role(X58967), succ(X58976, X58968), domdomain(8, X58976), domdomain(7, X58968), domdomain(4, X58967), domdomain(5, X58968).
base(control(X58967)) :- role(X58967), domdomain(4, X58967).
base(line(X58967, X58968, X58967, X58970)) :- index(X58967), nextXindex(X58968, X58970), domdomain(11, X58968), domdomain(12, X58970), domdomain(2, X58967), domdomain(2, X58968), domdomain(2, X58967), domdomain(2, X58970).
base(line(X58967, X58968, X58969, X58968)) :- nextXindex(X58967, X58969), index(X58968), domdomain(11, X58967), domdomain(12, X58969), domdomain(2, X58967), domdomain(2, X58968), domdomain(2, X58969), domdomain(2, X58968).
base(box(X58967, X58968, x)) :- index(X58967), X58967 != 3, index(X58968), X58968 != 3, domdomain(2, X58967), domdomain(2, X58968).
base(box(X58967, X58968, o)) :- index(X58967), X58967 != 3, index(X58968), X58968 != 3, domdomain(2, X58967), domdomain(2, X58968).
input(X58965, draw(X58968, X58969, X58968, X58971)) :- role(X58965), index(X58968), nextXindex(X58969, X58971), domdomain(11, X58969), domdomain(12, X58971), domdomain(4, X58965), domdomain(2, X58968), domdomain(2, X58969), domdomain(2, X58968), domdomain(2, X58971).
input(X58965, draw(X58968, X58969, X58970, X58969)) :- role(X58965), nextXindex(X58968, X58970), index(X58969), domdomain(11, X58968), domdomain(12, X58970), domdomain(4, X58965), domdomain(2, X58968), domdomain(2, X58969), domdomain(2, X58970), domdomain(2, X58969).
input(X58964, noop) :- role(X58964), domdomain(4, X58964).
domdomain(1, box).
domdomain(1, boxXcount).
domdomain(1, control).
domdomain(1, line).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(3, o).
domdomain(3, x).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(5, 0).
domdomain(5, 1).
domdomain(5, 2).
domdomain(5, 3).
domdomain(5, 4).
domdomain(6, 0).
domdomain(6, 100).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(7, 4).
domdomain(8, 0).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, boxXcount).
domdomain(9, control).
domdomain(10, draw).
domdomain(10, noop).
domdomain(11, 1).
domdomain(11, 2).
domdomain(12, 2).
domdomain(12, 3).
