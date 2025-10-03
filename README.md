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


Our implementation makes the following assumptions of the clingo grounder. 

- For any stratified GDL description, the grounded program have a stratified structure while
the only non-stratified part of the program are the self-cycles of the choice rules

- The choices in the choice rules cannot be replaced by auxiliary predicates during the grounding phase.

Note that the clingo grounder obeys these 2 requirements in all our experiements. 


The proof is available [here](https://github.com/hharryyf/gdl2qbf-general/blob/main/NMR_25_QBF-15-16.pdf)


