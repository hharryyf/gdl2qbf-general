# gdl2qbf-general

A converter from multi-player GDL games to QBF, [the paper](https://www.ifaamas.org/Proceedings/aamas2024/pdfs/p807.pdf) is attached. 

The proof and experiments of the NMR paper are available in the NMR branch https://github.com/hharryyf/gdl2qbf-general/tree/NMR.


**The experients in the AAMAS paper were based on an old and less generic implementation that can only handle games with exactly 2 players https://github.com/hharryyf/gdl2qbf while the current implementation is more general than that. We can now deal with the bounded-depth strong winnability against arbitarily many players.**

## Description

The converter will translate any GDL (in KIF format) to a QBF instance, the QBF instance is true if and only if the current player can achieve 100 points within N moves in the GDL game no matter what the other players perform.

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
python extg2qbf.py [path-to-the-json-configuration-file]

```

Example:

```
 python extg2qbf.py config/break-through-2x5-x-100.json  

```

In the json configuration file, one needs to specify:

```
{
 "path": "SinglePlayer/Translations/break-through-2x5.asp",
 "current": "xplayer",
 "preprocessor": true,
 "output": "instances/break-through-2x5.qdimacs"
}
```

- *path* is the path to the asp file describing ```Ext(G, N)```

- *current* is the name of our player. 

- *preprocessor* is a Boolean value specifying whether bloqqer preprocessing is needed

- *output* is the path to the output QBF in qdimacs format. Note that if *preprocessor* option is set to true, the path to the preprocessed instance has a bloq_ prefix in the name (e.g., instances/bloq_break-through-2x5.qdimacs).

You may choose any qdimacs QBF solver (e.g., caqe, depqbf, qute, rareqs) to solve the instance.


Our implementation makes the following assumptions of the clingo grounder. 

- For any stratified GDL description, the grounded program have a stratified structure while
the only non-stratified part of the program are the self-cycles of the choice rules

- The choices in the choice rules cannot be replaced by auxiliary predicates during the grounding phase.

Note that the clingo grounder version 5.8.0 obeys these 2 requirements in all our experiements. 


## Contributors

* Yifan He, Abdallah Saffidine, Michael Thielscher

