# gdl2qbf-general

A generalized encoding compared to our two-player zero-sum turn-taking game encoding https://github.com/hharryyf/gdl2qbf

Details of the conversion can be found in extg2qbf.py and action-generator-2.lp, the directory minimax/ contains the code for the minimax solvers, minimax_slow is the solver without transposition table, minimax is the solver with the transposition table.

To reproduce the experiments, just run:

```
python extg2qbf.py config/[the name of the game.json]

```

Then, run

```
caqe bloq_[the name of the game].qdimacs

```

The proof is available [here](https://github.com/hharryyf/gdl2qbf-general/blob/main/NMR_25_QBF-15-16.pdf)


