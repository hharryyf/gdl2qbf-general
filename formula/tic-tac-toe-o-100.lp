% note that eta must hold at any terminal state
% this encodes oplayer must achieve 100 points at terminal states


eta(T) :- goal(oplayer, 100, T), terminal(T).
