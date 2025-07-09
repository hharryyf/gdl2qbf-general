% tdom and mtdom
tdom(1). tdom(T+1) :- tdom(T), mtdom(T).

terminated(T) :- terminal(T).
terminated(T+1) :- terminated(T), mtdom(T).
:- does(P,M,T), not legal(P,M,T).
1 {does(P,M,T) : input(P, M)} 1 :- not terminated(T), mtdom(T), role(P).


phi(I) :- eta(I).
phi(I) :- phi(I+1), not terminal(I), mtdom(I).
:- not phi(1).

