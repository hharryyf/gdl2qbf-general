# gdl2qbf-general

A converter from multi-player GDL games to QBF, [the paper](https://www.ifaamas.org/Proceedings/aamas2024/pdfs/p807.pdf) is attached. 

The proof and experiments of the NMR paper are available in the NMR branch https://github.com/hharryyf/gdl2qbf-general/tree/NMR.


**The experients in the AAMAS paper were based on an old and less generic implementation that can only handle games with exactly 2 players https://github.com/hharryyf/gdl2qbf while the current implementation is more general than that. We can now deal with the bounded-depth strong winnability against arbitarily many players.**

## Description

The converter will translate any GDL (in KIF format) to a QBF instance, the QBF instance is true if and only if the current player can achieve 100 points within N moves in the GDL game no matter what the other players perform.

Although the papers/thesis focus on the case when the GDL description is grounded, we can easily generalize it to cases when the GDL is non-grounded. We can simply use the grounder gringo to ground the overall encoding and do the same analysis.


## Contribution

In our paper, we designed the framework of converting a GDL game G to a QBF instance.
The framework is as follows:

```
G -> Ext(G, N) -> QASP(G, N) -> QBF

```

In this framework, ```G -> Ext(G, N)``` was done by Michael Thielscher in the single-player game paper (check the referenced tool in ```SinglePlayer/```, and run the eclipse prolog file ```EXTTranslator.ecl```), ```QASP(G, N) -> QBF``` was done by Fandinno et al. in their qasp2qbf tool https://github.com/potassco/qasp2qbf

More specifically, ```EXTTranslator.ecl``` can convert a GDL decription in KIF format without **nested** "or" operator and a depth N to Ext(G, N). For simplicity, the author didn't handle the nested "or" operator automatically. Check the difference between ```GameDescriptions/tic-tac-toe.gdl``` and ```Translations/tic-tac-toe.asp``` to see how the tool works. Note that, even if ```EXTranslator.ecl``` can handle descriptions with 1-level "or" operator, for performance reasons, it is recommended that all the "or" operators in the KIF input are removed manually.

Our contributions are:

* We designed the correct algorithm of converting an arbitrary GDL game to a QBF instance.

* We designed and implemented an efficient encoding and quantification method that converts Ext(G, N) to QASP(G, N).


## Dependencies

* Clingo (version 5.8.0) https://github.com/potassco/clingo (clingo must be put into PATH)

* QBF solver Caqe https://github.com/ltentrup/caqe and DepQBF  https://github.com/lonsing/depqbf 

* Python 3+

* QBF preprocessor bloqqer  https://fmv.jku.at/bloqqer/ (bloqqer must be put into PATH)

* the dependencies of qasp2qbf (i.e., lp2normal2, lp2acyc, lp2sat) https://github.com/potassco/qasp2qbf https://research.ics.aalto.fi/software/asp/download/ (lp2normal2, lp2acyc, lp2sat must be put into PATH)

* KIF to Ext(G) converter: the example usage of this tool can be found in SinglePlayer/. You need to install ECLiPSe Prolog https://eclipseclp.org/ first.

## Usage

* First create the answer set program Ext(G, N) with ```SinglePlayer/EXTTranslator.ecl``` from a GDL in KIF format and a horizon N.

* **Requirement: Ext(G, N) must be the N-step temporal-extended ASP program of some valid GDL game G**


* Then just run the following command

```
python extg2qbf_new.py -p=[PLAYER-NAME] -g=[EXT(G)-PATH] -o=[OUTPUT-FILE] [Optional Flags]

```

Run the following to see more options:

```
python extg2qbf_new.py -h

```

Example:

```
python extg2qbf_new.py -p=xplayer -g=SinglePlayer/Translations/break-through-2x5.asp -o=instances/break-through-2x5.qdimacs 

```
The unpreprocessed instance can be found in ```instances/break-through-2x5.qdimacs```

The bloqqer preprocessed instance can be found in ```instances/bloq_break-through-2x5.qdimacs```


Our prototypical implementation makes the following assumptions of the clingo grounder. 

- For any stratified GDL description, in the grounded program, once all choice rules are removed, the remaining program is still stratified with integrity constraints

- The choices in the choice rules cannot be replaced by auxiliary predicates during the grounding phase.

These assumptions are important to ensure that the dependency-based quantification method is implemented correctly (i.e., the splitting analysis still holds). The clingo grounder version 5.8.0 obeys both requirements. 


## Contributors

* Yifan He, Abdallah Saffidine, Michael Thielscher

