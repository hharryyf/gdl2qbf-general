tdom(T+1) :- mtdom(T).
tdom(1).

1 {does(R, A, T) : input(R, A)} 1 :- not terminated(T), mtdom(T).

terminated(T) :- terminal(T).
terminated(T+1) :- terminated(T), mtdom(T).



:- does(R, A, T), not legal(R, A, T).

:- 1 {terminated(T) : tdom(T)}.
