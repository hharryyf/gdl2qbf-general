% this is used for 2-player strictly turn-taking games
% such that xplayer takes turn at rounds 1, 3, 5, ...
% oplayer takes turn at rounds 2, 4, 6, ...
% _player_turn(P, T) should be specified for player o because it is universal

_player_turn(oplayer, 2) :- mtdom(2).
_player_turn(oplayer, T+2) :- mtdom(T+2), _player_turn(oplayer, T).
