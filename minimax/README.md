# Minimax solver for 2-player games


* To compile & run the C++ minimax + TT solver (player name is the name of the current player.)

```
swipl-ld -goal true -o minimax_solver -ld g++ -g -O minimax_solver.cpp
    
./minimax_solver [path to the game prolog file] [player name] [depth]

./minimax_solver_slow [path to the game prolog file] [player name] [depth]

```

## Reference

Note that this piece of work relies on https://github.com/potassco/qasp2qbf for converting QASP to QBF.

It relies on https://github.com/lonsing/depqbf and https://github.com/ltentrup/caqe for QBF solving, and 
https://github.com/lonsing/qratpreplus and https://fmv.jku.at/bloqqer/ for preprocessing.


