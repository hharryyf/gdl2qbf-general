% this is used for 2-player strictly turn-taking games
% such that xplayer takes turn at rounds 1, 2, 5, 6, 9, 10...
% oplayer takes turn at rounds 3, 4, 7, 8, 11, 12, ...
% _player_turn(P, T) should be specified for player o because it is universal

_player_turn(oplayer, 3) :- mtdom(3).
_player_turn(oplayer, 4) :- mtdom(4).
_player_turn(oplayer, T+4) :- mtdom(T+4), _player_turn(oplayer, T).
