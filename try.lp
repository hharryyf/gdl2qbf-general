input(1..3).
{a(I)} :- input(I).
:- {a(I) : input(I)} 0.
:- 2 {a(I) : input(I)}.


{b(1);b(2)}.
a(1) :- b(1), not b(2).
a(2) :- b(2), not b(1).