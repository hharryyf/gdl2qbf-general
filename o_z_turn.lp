% this is used for 3-player strictly turn-taking games
% such that xplayer takes turn at rounds 1, 4, 7, ...
% oplayer takes turn at rounds 2, 5, 8, ...
% zplayer takes turn at rounds 3, 6, 9, ...
% _player_turn(P, T) should be specified for players o and z because they are universal

_player_turn(oplayer, 2) :- mtdom(2).
_player_turn(zplayer, 3) :- mtdom(3).
_player_turn(oplayer, T+3) :- mtdom(T+3), _player_turn(oplayer, T).
_player_turn(zplayer, T+3) :- mtdom(T+3), _player_turn(zplayer, T).
