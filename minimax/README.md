# AAMAS paper supplementary material

This folder contains all the 23 game instances used in the experimental results section of our AAMAS paper. The code in this directory can only be used to reproduce all the experimental results in the AAMAS paper. If you want to create the QBF instance of new games, please use the tool in the parent directory. One thing to note is the GDL to temporal-extended ASP process in this folder was done by hand following definition 2 of the AAMAS paper. In other words, by the time the paper was submitted, we had not included/used the GDL->Ext(G) converter for anonymity purposes. Hence, there might be some **slight differences** between the temporal-extended ASP created by hand and the temporal-extended ASP created by the GDL->Ext(G) coverter. But the solver's performance on these instances won't change much.

## Usage

* To solve a game that is strictly turn-taking with quantification method SD

```
python run_test_dependency.py break-through-2x5 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py break-through-2x6 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py break-through-3x4 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py break-through-3x5 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py break-through-4x4 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-3-4x4 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-3-5x5 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-3-6x6 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-4-4x4 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-4-5x5 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-4-6x6 -v7 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py gttt-4x4-1-1 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/skinny.lp

python run_test_dependency.py gttt-4x4-1-1 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/tippy.lp

python run_test_dependency.py gttt-4x4-1-1 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/elly.lp

python run_test_dependency.py gttt-4x4-1-1 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/fatty.lp

python run_test_dependency.py gttt-4x4-1-1 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/knobby.lp

python run_test_dependency.py gttt-4x4-2-2 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/skinny.lp

python run_test_dependency.py gttt-4x4-2-2 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/tippy.lp

python run_test_dependency.py gttt-4x4-2-2 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/elly.lp

python run_test_dependency.py gttt-4x4-2-2 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/fatty.lp

python run_test_dependency.py gttt-4x4-2-2 -v7 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/knobby.lp

```

* To solve a game with quantification method GD

```
python run_test_dependency.py break-through-2x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py break-through-2x6 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py break-through-3x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py break-through-3x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py break-through-4x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-3-4x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-3-5x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-3-6x6 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-4-4x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-4-5x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py connect-4-6x6 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_dependency.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/skinny.lp

python run_test_dependency.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/tippy.lp

python run_test_dependency.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/elly.lp

python run_test_dependency.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/fatty.lp

python run_test_dependency.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/knobby.lp

python run_test_dependency.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/skinny.lp

python run_test_dependency.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/tippy.lp

python run_test_dependency.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/elly.lp

python run_test_dependency.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/fatty.lp

python run_test_dependency.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/knobby.lp

python run_test_dependency.py dots-and-boxes-2x2 -v8 extra-quantifier.lp [caqe|depqbf]

python run_test_dependency.py dots-and-boxes-2x3 -v8 extra-quantifier.lp [caqe|depqbf]

```

* To solve a game with quantification method GN

```
python run_test_action_only.py break-through-2x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py break-through-2x6 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py break-through-3x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py break-through-3x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py break-through-4x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py connect-3-4x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py connect-3-5x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py connect-3-6x6 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py connect-4-4x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py connect-4-5x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py connect-4-6x6 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_action_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/skinny.lp

python run_test_action_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/tippy.lp

python run_test_action_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/elly.lp

python run_test_action_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/fatty.lp

python run_test_action_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/knobby.lp

python run_test_action_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/skinny.lp

python run_test_action_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/tippy.lp

python run_test_action_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/elly.lp

python run_test_action_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/fatty.lp

python run_test_action_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/knobby.lp

python run_test_action_only.py dots-and-boxes-2x2 -v8 extra-quantifier.lp [caqe|depqbf]

python run_test_action_only.py dots-and-boxes-2x3 -v8 extra-quantifier.lp [caqe|depqbf]

```


* To solve a game with quantification method GT

```
python run_test_time_only.py break-through-2x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py break-through-2x6 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py break-through-3x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py break-through-3x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py break-through-4x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py connect-3-4x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py connect-3-5x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py connect-3-6x6 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py connect-4-4x4 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py connect-4-5x5 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py connect-4-6x6 -v8 extra-quantifier.lp [caqe|depqbf] 

python run_test_time_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/skinny.lp

python run_test_time_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/tippy.lp

python run_test_time_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/elly.lp

python run_test_time_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/fatty.lp

python run_test_time_only.py gttt-4x4-1-1 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-1-1/knobby.lp

python run_test_time_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/skinny.lp

python run_test_time_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/tippy.lp

python run_test_time_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/elly.lp

python run_test_time_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/fatty.lp

python run_test_time_only.py gttt-4x4-2-2 -v8 extra-quantifier.lp [caqe|depqbf] gttt-4x4-2-2/knobby.lp

python run_test_time_only.py dots-and-boxes-2x2 -v8 extra-quantifier.lp [caqe|depqbf]

python run_test_time_only.py dots-and-boxes-2x3 -v8 extra-quantifier.lp [caqe|depqbf]

```

* To compile & run the C++ minimax + TT solver (player name is the name of the current player.)

```
swipl-ld -goal true -o minimax_solver -ld g++ -g -O minimax_solver.cpp
    
./minimax_solver [path to the game prolog file] [player name] [depth]
```

## Reference

Note that this piece of work relies on https://github.com/potassco/qasp2qbf for converting QASP to QBF.

It relies on https://github.com/lonsing/depqbf and https://github.com/ltentrup/caqe for QBF solving, and 
https://github.com/lonsing/qratpreplus and https://fmv.jku.at/bloqqer/ for preprocessing.


