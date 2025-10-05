% note that eta must hold at any terminal state
% this encodes xplayer must achieve 100 points or 50 points at terminal states


eta(T) :- goal(xplayer, 50, T), terminal(T).
eta(T) :- goal(xplayer, 100, T), terminal(T).
