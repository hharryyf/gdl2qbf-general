_player_turn(oplayer, 2) :- mtdom(2).
_player_turn(oplayer, T+2) :- mtdom(T+2), _player_turn(oplayer, T).
