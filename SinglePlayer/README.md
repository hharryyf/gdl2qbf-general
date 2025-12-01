# Software for converting GDL G to a temporal-extended ASP Ext(G, N)

* Note that this software was created by Michael Thielscher and Stephan Schiffel.

## Usage

* Compile the program EXTTranslator.ecl

* Put the GDL in KIF format in a file in GameDescriptions with extensions .gdl

* call the "run" function with 2 parameters [ name of the game ] [ the horizon N]

* For example, if you want to create the 9-step temporal-extended ASP of the game tic-tac-toe, you need to place tic-tac-toe.gdl in GameDescriptions/, then call the "run" function with 2 parameters ```tic-tac-toe``` and ```9```. The tic-tac-toe game of depth 9 will be stored in ```Translations/tic-tac-toe.asp```. 

* Warning: the authors of this tool assumes that no players may have uppercase letters in their name and also no predicate name "p" other than distinct may have the word "distinct" as a prefix