% tdom and mtdom
tdom(1). tdom(T+1) :- tdom(T), mtdom(T).

terminated(T) :- terminal(T).
terminated(T+1) :- terminated(T), mtdom(T).
:- does(P,M,T), not legal(P,M,T).
1 {does(P,M,T) : input(P, M)} 1 :- not terminated(T), mtdom(T), role(P).
:- 0 {terminated(T) : tdom(T)} 0.
:- terminated(T), not terminated(T-1), not eta(T), positive.
:- terminated(1), not eta(1), positive.
:- terminated(T), not terminated(T-1), eta(T), not positive.
:- terminated(1), eta(1), not positive.
