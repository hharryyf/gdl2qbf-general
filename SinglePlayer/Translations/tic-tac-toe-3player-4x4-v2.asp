mtdom(1..16).
role(xplayer).
role(oplayer).
role(zplayer).
true(control(xplayer), 1).
succ(1, 2).
succ(2, 3).
succ(3, 4).
true(cell(X38961, X38962, X38963), X38978 + 1) :- does(X38967, mark(X38961, X38962), X38978), sign(X38967, X38963), domdomain(4, X38967), mtdom(X38978), domdomain(2, X38961), domdomain(2, X38962), domdomain(3, X38963).
true(cell(X38961, X38962, X38963), X38973 + 1) :- true(cell(X38961, X38962, X38963), X38973), mtdom(X38973), domdomain(2, X38961), domdomain(2, X38962), domdomain(3, X38963).
true(control(zplayer), X38969 + 1) :- true(control(oplayer), X38969), mtdom(X38969).
true(control(oplayer), X38969 + 1) :- true(control(xplayer), X38969), mtdom(X38969).
true(control(xplayer), X38969 + 1) :- true(control(zplayer), X38969), mtdom(X38969).
row3(X38959, X38960, X38996) :- true(cell(X38959, X38967, X38960), X38996), succ(X38967, X38973), true(cell(X38959, X38973, X38960), X38996), succ(X38973, X38986), true(cell(X38959, X38986, X38960), X38996), domdomain(2, X38986), domdomain(8, X38973), domdomain(9, X38986), domdomain(2, X38973), domdomain(8, X38967), domdomain(9, X38973), domdomain(2, X38967), tdom(X38996), domdomain(2, X38959), domdomain(3, X38960).
column3(X38959, X38960, X38996) :- true(cell(X38966, X38959, X38960), X38996), succ(X38966, X38973), true(cell(X38973, X38959, X38960), X38996), succ(X38973, X38986), true(cell(X38986, X38959, X38960), X38996), domdomain(2, X38986), domdomain(8, X38973), domdomain(9, X38986), domdomain(2, X38973), domdomain(8, X38966), domdomain(9, X38973), domdomain(2, X38966), tdom(X38996), domdomain(2, X38959), domdomain(3, X38960).
diagonal3(X38959, X39005) :- true(cell(X38965, X38966, X38959), X39005), succ(X38965, X38972), succ(X38966, X38977), true(cell(X38972, X38977, X38959), X39005), succ(X38972, X38990), succ(X38977, X38995), true(cell(X38990, X38995, X38959), X39005), domdomain(2, X38990), domdomain(2, X38995), domdomain(8, X38977), domdomain(9, X38995), domdomain(8, X38972), domdomain(9, X38990), domdomain(2, X38972), domdomain(2, X38977), domdomain(8, X38966), domdomain(9, X38977), domdomain(8, X38965), domdomain(9, X38972), domdomain(2, X38965), domdomain(2, X38966), tdom(X39005), domdomain(3, X38959).
diagonal3(X38959, X39005) :- true(cell(X38965, X38966, X38959), X39005), succ(X38971, X38965), succ(X38966, X38977), true(cell(X38971, X38977, X38959), X39005), succ(X38989, X38971), succ(X38977, X38995), true(cell(X38989, X38995, X38959), X39005), domdomain(2, X38989), domdomain(2, X38995), domdomain(8, X38977), domdomain(9, X38995), domdomain(8, X38989), domdomain(9, X38971), domdomain(2, X38971), domdomain(2, X38977), domdomain(8, X38966), domdomain(9, X38977), domdomain(8, X38971), domdomain(9, X38965), domdomain(2, X38965), domdomain(2, X38966), tdom(X39005), domdomain(3, X38959).
line3(X38959, X38966) :- row3(X38963, X38959, X38966), domdomain(2, X38963), tdom(X38966), domdomain(3, X38959).
line3(X38959, X38966) :- column3(X38963, X38959, X38966), domdomain(2, X38963), tdom(X38966), domdomain(3, X38959).
line3(X38959, X38965) :- diagonal3(X38959, X38965), tdom(X38965), domdomain(3, X38959).
open(X38997) :- not true(cell(X38965, X38966, x), X38997), not true(cell(X38965, X38966, o), X38997), not true(cell(X38965, X38966, z), X38997), index(X38965), index(X38966), domdomain(2, X38965), domdomain(2, X38966), tdom(X38997).
legal(X38959, mark(X38962, X38963), X39009) :- not true(cell(X38962, X38963, x), X39009), not true(cell(X38962, X38963, o), X39009), not true(cell(X38962, X38963, z), X39009), true(control(X38959), X39009), index(X38962), index(X38963), tdom(X39009), domdomain(4, X38959), domdomain(2, X38962), domdomain(2, X38963).
legal(X38959, noop, X38974) :- role(X38959), not true(control(X38959), X38974), tdom(X38974), domdomain(4, X38959).
goal(X38959, 100, X38975) :- role(X38959), sign(X38959, X38969), line3(X38969, X38975), domdomain(3, X38969), tdom(X38975), domdomain(4, X38959).
goal(xplayer, 100, X38984) :- not line3(x, X38984), not line3(o, X38984), not line3(z, X38984), not open(X38984), tdom(X38984).
goal(oplayer, 0, X38984) :- not line3(x, X38984), not line3(o, X38984), not line3(z, X38984), not open(X38984), tdom(X38984).
goal(zplayer, 0, X38984) :- not line3(x, X38984), not line3(o, X38984), not line3(z, X38984), not open(X38984), tdom(X38984).
goal(X38959, 0, X38985) :- role(X38959), sign(X38959, X38969), sign(X38973, X38974), X38973 != X38959, line3(X38974, X38985), domdomain(4, X38973), domdomain(3, X38974), domdomain(3, X38969), tdom(X38985), domdomain(4, X38959).
terminal(X38968) :- sign(X38961, X38962), line3(X38962, X38968), domdomain(4, X38961), domdomain(3, X38962), tdom(X38968).
terminal(X38963) :- not open(X38963), tdom(X38963).
sign(xplayer, x).
sign(oplayer, o).
sign(zplayer, z).
index(X38959) :- succ(X38959, X38964), domdomain(8, X38959), domdomain(9, X38964), domdomain(2, X38959).
index(X38959) :- succ(X38963, X38959), domdomain(8, X38963), domdomain(9, X38959), domdomain(2, X38959).
base(cell(X38961, X38962, X38963)) :- index(X38961), index(X38962), sign(X38975, X38963), domdomain(4, X38975), domdomain(2, X38961), domdomain(2, X38962), domdomain(3, X38963).
base(control(X38961)) :- role(X38961), domdomain(4, X38961).
input(X38959, mark(X38962, X38963)) :- role(X38959), index(X38962), index(X38963), domdomain(4, X38959), domdomain(2, X38962), domdomain(2, X38963).
input(X38958, noop) :- role(X38958), domdomain(4, X38958).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(3, o).
domdomain(3, x).
domdomain(3, z).
domdomain(4, oplayer).
domdomain(4, xplayer).
domdomain(4, zplayer).
domdomain(5, 0).
domdomain(5, 100).
domdomain(6, control).
domdomain(7, mark).
domdomain(7, noop).
domdomain(8, 1).
domdomain(8, 2).
domdomain(8, 3).
domdomain(9, 2).
domdomain(9, 3).
domdomain(9, 4).
