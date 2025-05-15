# Software for converting GDL G to a temporal-extended ASP Ext(G)

* Note that this software was created by Michael Thielscher and Stephan Schiffel.

## Usage

* Compile the program EXTTranslator.ecl

* Put the GDL in KIF format in a file in GameDescriptions with extensions .gdl

* call the "run" function with 2 parameters [ name of the game ] [ horizon ]

* For example, if you want to create the temporal-extended ASP of the game tic-tac-toe, you need to place tic-tac-toe.gdl in GameDescriptions/, then call the "run" function with 2 parameters tic-tac-toe and 9. The tic-tac-toe game of depth 9 will be stored in Translations/tic-tac-toe.asp. 