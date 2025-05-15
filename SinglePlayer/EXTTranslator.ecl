:- lib(lists).

:- dynamic runtime/1.

run :- write("Choose a game to translate:"),
	read_string(end_of_line, _, File),
	concat_string(["GameDescriptions/", File, ".gdl"], FileName),
	clean_rules,
	load_rules_from_file(FileName),
	clean_dependency_graph,
	build_dependency_graph,
	clean_domain_graph,
	build_domain_graph,
	clean_domains,
	generate_domains,
	write("Choose a time horizon:"),
	read_string(end_of_line, _, NumString),
	number_string(T, NumString),
	concat_string(["Translations/", File, ".temp"], TempFilename),
	open(TempFilename, write, OutputStream),
	aspify(T, OutputStream),
	concat_string(["Translations/", File, ".asp"], AspFilename),
	open(TempFilename, read, In),
	open(AspFilename, write, Out),
	asp_to_clingo(In, Out),
	delete(TempFilename).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%   Produce correct clingo syntax
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

asp_to_clingo(In, Out) :-
	read_string(In, end_of_line, _, Clause),
	asp_to_clingo_clause(Clause, AspClauses),
	writeClauses(Out, AspClauses),
	!,
	asp_to_clingo(In, Out).

asp_to_clingo(In, Out) :-
	!,
	close(In),
	close(Out).

writeClauses(_, []) :- !.
writeClauses(Out, [C | Cs]) :-
	writeln(Out, C),
	writeClauses(Out, Cs).

asp_to_clingo_clause(Clause, AspClauses) :-
	replace_variables(Clause, Clause1),
	remove_tautologies(Clause1, Clause2),
	AspClauses = [Clause2].

replace_variables(Clause, NewClause) :-
	split_string(Clause, "_", "", [HeadString | SubStrings]),
	add_variable_id(HeadString, SubStrings, NewClause).

add_variable_id(String, [], String).
add_variable_id(String, [S | Ss], Result) :-
	concat_string([String, "X", S], String1),
	add_variable_id(String1, Ss, Result).

remove_tautologies(Clause, NewClause) :-
	append_strings(Clause1, " :- distinct.", Clause) ->
	 	append_strings(Clause1, ".", NewClause).

remove_tautologies(Clause, NewClause) :-
	append_strings(String1, Clause2, Clause),
	append_strings(Clause1, ", distinct", String1) ->
		append_strings(Clause1, Clause2, NewClause1),
		remove_tautologies(NewClause1, NewClause).

remove_tautologies(Clause, Clause).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%   ASP translation
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- dynamic asp_name/2.
:- dynamic asp_symbol_index/1.

gdl_keyword(S) :-
	number(S) -> true ;
	S == init -> true ; S == next -> true ;
	S == true -> true ; S == does -> true ; S == legal -> true ; S == terminal -> true ; S == goal -> true;
	S == distinct -> true; S == role -> true;
	S == base -> true ; S == action -> true.

retract_all_symbols :-
	asp_name(X, Y),
	retract(asp_name(X,Y)),
	fail.
retract_all_symbols :-
	asp_symbol_index(N),
	retract(asp_symbol_index(N)),
	fail.
retract_all_symbols.

aspify(T, Out) :-
	retract_all_symbols,
	assert(asp_symbol_index(0)),
	write(Out, 'mtdom(1..'), write(Out, T), writeln(Out, ').'),
	aspify(Out).

aspify(Out) :-
	game_rule(H, T),
	aspify_rule(H, T, Out),
	fail.

aspify(Out) :-
	domains(Id, Domain),
	asp_domains(Id, Domain, Out),
	fail.

aspify(Out) :-
	close(Out).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% uncomment to obtain a translation with real names
%%
 asp_rename_symbol(Symbol, NewSymbol) :-
	!,
	( \+ asp_name(Symbol,_) -> assert(asp_name(Symbol,Symbol)) ; true ),
	NewSymbol = Symbol.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

asp_rename_symbol(Symbol, NewSymbol) :-
	gdl_keyword(Symbol) -> NewSymbol = Symbol
	;
	asp_name(Symbol, NewSymbol) -> true
	;
	asp_symbol_index(N),
	N1 is N+1,
	retract(asp_symbol_index(N)),
	assert(asp_symbol_index(N1)),
	number_string(N1, NS),
	append_strings("koala", NS, NewSymbolString),
	atom_string(NewSymbol, NewSymbolString),
	assert(asp_name(Symbol, NewSymbol)).

asp_rename(Term, NewTerm) :-
	var(Term) -> NewTerm = Term
	;
	Term = next(T) -> NewTerm = T+1
	;
	Term =.. [F | Args],
	asp_rename_symbol(F, NewF),
	asp_rename_args(Args, NewArgs),
	NewTerm =.. [NewF | NewArgs].

asp_rename_args([], []).
asp_rename_args([A | As], [NewA | NewAs]) :-
	asp_rename(A, NewA),
	asp_rename_args(As, NewAs).

asp_domains(_, [], _).
asp_domains(Id, [D | Ds], Out) :-
	( number(D) -> DName = D
	  ;
	  asp_name(D, DName) ),
	write(Out, 'domdomain('), write(Out, Id), write(Out, ', '), write(Out, DName), writeln(Out, ').'),
	asp_domains(Id, Ds, Out).

aspify_rule(Head, Tail, Out) :-
	aspify_atom(Head, AspHead, T, D1),
	asp_rename(AspHead, AspHeadNew),
	write(Out, AspHeadNew),
	write(Out, ' :- '),
	aspify_literals(Tail, T, D2, Out),
	strict_union(D1, D2, DomainDeclarations),
	aspify_domains(DomainDeclarations, Out).

aspify_literals([], _, [], _).
aspify_literals([A | As], T, DomainDeclarations, Out) :-
	( A = (B1 ; B2) ->
		write(Out, '1 { '),
		aspify_literals([B1], T, Db1, Out),
		write(Out, 'distinct ; '),
		aspify_literals([B2], T, Db2, Out),
		write(Out, 'distinct }'),
		strict_union(Db1, Db2, D1)
	  ;
	    ( A = (not B) ->
			aspify_atom(B, AspAtom, T, D1),
			write(Out, 'not ')
	      ;
			aspify_atom(A, AspAtom, T, D1) ),
	    ( AspAtom =.. [distinct, X, Y] ->
			write(Out, X), write(Out, ' != '), write(Out, Y)
	      ;
			asp_rename(AspAtom, AspAtomNew),
			write(Out, AspAtomNew) ) ),
	write(Out, ', '),
	aspify_literals(As, T, D2, Out),
	strict_union(D1, D2, DomainDeclarations).

aspify_domains([], Out) :-
	writeln(Out, 'distinct.').

aspify_domains([D | Ds], Out) :-
	write(Out, D),
	write(Out, ', '),
	aspify_domains(Ds, Out).

aspify_atom(Atom, AspAtom, T, DomainDeclaration) :-
	Atom =.. [P | Args],
	( P = init ->
	    aspify_arguments(P, Args, DomainDeclaration),
	    append(Args, [1], TArgs),
	    AspAtom =.. [true | TArgs]
	  ;
	  P = true ->
	    aspify_arguments(P, Args, DomainDeclaration),
	    append(Args, [T], TArgs),
	    AspAtom =.. [true | TArgs]
	  ;
	  P = distinct ->
	    DomainDeclaration = [],
	    AspAtom =.. [distinct | Args]
	  ;
	  P = does ->
	    aspify_arguments(P, Args, DomainDeclaration),
	    append(Args, [T], TArgs),
	    AspAtom =.. [does | TArgs]
	  ;
	  P = legal ->
	    aspify_arguments(P, Args, DomainDecl),
	    DomainDeclaration = [tdom(T) | DomainDecl],		% tdom(T) stands for the domain of time points
	    append(Args, [T], TArgs),
	    AspAtom =.. [legal | TArgs]
	  ;
	  P = next ->
	    aspify_arguments(P, Args, DomainDecl),
	    DomainDeclaration = [mtdom(T) | DomainDecl],	% special time domain for "next"-clauses
	    append(Args, [next(T)], TArgs),				% next(T) will be replaced by T+1
	    AspAtom =.. [true | TArgs]
	  ;
	  P = terminal ->
	    DomainDeclaration = [tdom(T)],	
	    AspAtom =.. [terminal, T]
	  ;
	  P = goal ->
	    aspify_arguments(P, Args, DomainDecl),
	    DomainDeclaration = [tdom(T) | DomainDecl],
	    append(Args, [T], TArgs),
	    AspAtom =.. [goal | TArgs]
	  ;
	  dynamic_feature(P) ->
	    aspify_arguments(P, Args, DomainDecl),
	    DomainDeclaration = [tdom(T) | DomainDecl],
	    append(Args, [T], TArgs),
	    AspAtom =.. [P | TArgs]
	  ;
	    aspify_arguments(P, Args, DomainDeclaration),
	    AspAtom =.. [P | Args] ).

aspify_arguments(P, Args, DomainDeclaration) :-
	aspify_arguments(P, 1, Args, DomainDeclaration).

aspify_arguments(_, _, [], []).
aspify_arguments(P, Index, [Arg | Args], DomainDeclaration) :-
	Index1 is Index + 1,
	aspify_arguments(P, Index1, Args, DomainDecl),
	( var(Arg) ->
		domains(P, Index, Id),
		DomainDeclaration = [domdomain(Id,Arg) | DomainDecl]
	  ;
		Arg =.. [F | SubArgs],
		aspify_arguments(F, 1, SubArgs, DomainDecl1),
		strict_union(DomainDecl1, DomainDecl, DomainDeclaration) ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%   domains
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- dynamic domains/2, domains/3.

clean_domains :-
	retract(domains(_, _)), fail ;
	retract(domains(_, _, _)), fail ; true.
	
generate_domains :-
	setof(domdomain(P,Arg,D), setof(X, domain_element(P, Arg, X), D), L),
	generate_domains(1, L).

generate_domains(_, []).
generate_domains(N, [domdomain(P,Arg,D) | Domains]) :-
	( domains(Id, D) ->
	    assert(domains(P, Arg, Id)),
	    N1 is N
	;
	  assert(domains(N, D)),
	    assert(domains(P, Arg, N)),
	    N1 is N+1 ),
	generate_domains(N1, Domains).

domain_element(P, Arg, X) :-
	domain_element(P, Arg, X, []).

domain_element(P, Arg, X, _) :-
	domain_edge(P, Arg, X).

domain_element(P, Arg, X, Loop) :-
	domain_edge(P, Arg, P1, Arg1),
	\+ member(loop(P1,Arg1), Loop),
	domain_element(P1, Arg1, X, [loop(P1,Arg1) | Loop]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%   dependency graph
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dynamic_feature(P) :-
	dynamic_feature(P, []).

dynamic_feature(P, _) :-
	dependence(P, true, _), !.

dynamic_feature(P, _) :-
	dependence(P, does, _), !.

dynamic_feature(P, Loop) :-
	dependence(P, Q, _),
	\+ member(Q, Loop),
	dynamic_feature(Q, [P|Loop]).

:- dynamic dependence/3.

clean_dependency_graph :-
	retract(dependence(_, _, _)), fail ; true.

build_dependency_graph :-
	game_rule(Head, Tail),
	Head =.. [P | _],
	add_dependencies(P, Tail),
	fail ; true.

add_dependencies(_, []).
add_dependencies(P, [Literal | Tail]) :-
	( Literal = (A ; B) -> add_dependencies(P, [A,B | Tail])
	  ;
	  Literal = (not X) -> X =.. [Q | _], add_dependency(P, Q, neg)
	  ;
	  Literal =.. [Q | _], add_dependency(P, Q, pos) ),
	add_dependencies(P, Tail).

add_dependency(P, Q, Sign) :-
	dependence(P, Q, Sign) -> true ; assert(dependence(P, Q, Sign)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%   domain graph
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- dynamic domain_edge/3.
:- dynamic domain_edge/4.

clean_domain_graph :-
	retract(domain_edge(_, _, _)), fail ;
	retract(domain_edge(_, _, _, _)), fail ; true.

build_domain_graph :-
	assert(domain_edge(true, 1, base, 1)),
	assert(domain_edge(does, 1, role, 1)),
	assert(domain_edge(does, 2, action, 1)),
	game_rule(Head, Tail),
	add_domains(Head, Tail),
	fail ; true.

add_domains(Head, Tail) :-
	Head =.. [P | Args],
	add_functions(P, 1, Args),
	add_shared_variables(P, 1, Args, Tail).

add_functions(_, _, []).
add_functions(P, Index, [Arg | Args]) :-
	( \+ var(Arg) ->
	    Arg =.. [F | SubArgs],
	    add_edge(P, Index, F),
	    add_functions(F, 1, SubArgs)
	  ;
	  true ),
	Index1 is Index + 1,
	add_functions(P, Index1, Args).

add_shared_variables(_, _, [], _).
add_shared_variables(P, Index, [X | Args], Tail) :-
	( var(X) ->
	    add_variable(P, Index, X, Tail)
	  ;
	  X =.. [F | SubArgs],
	    add_shared_variables(F, 1, SubArgs, Tail) ),
	Index1 is Index + 1,
	add_shared_variables(P, Index1, Args, Tail).

add_variable(_, _, _, []).
add_variable(P, I, X, [B | Tail]) :-
	B =.. [F | Args],
	add_variable(P, I, X, F, 1, Args),
	add_variable(P, I, X, Tail).

add_variable(_, _, _, _, _, []).
add_variable(P, I, X, F, J, [Y | Args]) :-
	( var(Y) ->
	    ( Y == X -> add_edge(P, I, F, J) ; true )
	  ;
	  Y =.. [G | SubArgs],
	    add_variable(P, I, X, G, 1, SubArgs) ),
	J1 is J + 1,
	add_variable(P, I, X, F, J1, Args).

add_edge(P, I, F) :-
	domain_edge(P, I, F) -> true ; assert(domain_edge(P, I, F)).
add_edge(P, I, F, J) :-
	domain_edge(P, I, F, J) -> true ; assert(domain_edge(P, I, F, J)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%   parser
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- use_module(gdl_parser).
:- dynamic game_rule/2.

clean_rules :-
	retract(game_rule(_, _)), fail ; true.

load_rules_from_file(Filename) :-
	open(Filename, read, InputStream),
	read_string(InputStream, end_of_file, _, GameDescription),
	close(InputStream),
	(parse_gdl_description_string(GameDescription, Rules) -> true ; writeln("error: can't parse game description!"), fail),
	load_rules(Rules).

load_rules([]).
load_rules([Rule|Rules]) :-
	( Rule = (Head :- Tail) -> tail_to_list(Tail, TailList), assert(game_rule(Head, TailList))
	  ;
	  assert(game_rule(Rule, [])) ),
	load_rules(Rules).

tail_to_list((A, T), [A|TL]) :- !, tail_to_list(T, TL).
tail_to_list(A, [A]).

my_findall(V, G, L) :-
   setof(V, G, L), ! ; L = [].

%%

strict_member(E, [H|T]) :-
	E == H -> true ; strict_member(E, T).

strict_union(L, [], L).
strict_union(L, [H|T], M) :-
	strict_member(H, L) -> strict_union(L, T, M) ; strict_union(L, T, N), M = [H|N].

