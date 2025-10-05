% note that eta must hold at any terminal state
% this encodes xplayer must achieve 100 points at terminal states

eta(T) :- goal(xplayer, 100, T), terminal(T).
