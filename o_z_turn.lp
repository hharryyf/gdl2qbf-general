_player_turn(oplayer, 2) :- mtdom(2).
_player_turn(zplayer, 3) :- mtdom(3).
_player_turn(oplayer, T+3) :- mtdom(T+3), _player_turn(oplayer, T).
_player_turn(zplayer, T+3) :- mtdom(T+3), _player_turn(zplayer, T).
