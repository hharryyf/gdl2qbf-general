# unpack all the 1 {} 1 choice rules to {} chice rules
# the only place negative cycles can exist is the choice rules

import os
import sys
import time
import queue
import clingo
import json

def log_action_encoding(inputfile, player, f):
    ################ log-encoding #################
    moveL = set()
    with open(inputfile, "r") as g:
        ASP_program = g.read()
    ASP_program += f'#show.'
    ASP_program += f'#show input({player}, P) : input({player}, P).'
    # Control object is a low-level interface for controlling the grounding/solving process.
    ctl = clingo.Control(arguments=['-W', 'none'])  # Here you can write the arguments you would pass to clingo by command line.
    ctl.add("base", [], ASP_program)  # Adds the program to the control object.
    ctl.ground([("base", [])])  # Grounding...

    # Solving...
    with ctl.solve(yield_=True) as solution_iterator:
        for model in solution_iterator:
            # Model is an instance of clingo.solving.Model class 
            # Reference: https://potassco.org/clingo/python-api/current/clingo/solving.html#clingo.solving.Model
            for s in str(model).split():
                moveL.add(s[(7 + len(player)):-1])
        
    moveL = list(moveL)
    moveL.sort()
    tol, lenl = 0, len(moveL)
    while (1 << tol) < lenl:
        tol += 1

    print(f'ldom({player}, 1..{tol}).', file=f)
    print('% log-encoding', file=f)

    print(f"{{moveL({player}, M, T) : ldom({player}, M)}} :- mtdom(T).",file=f)
    
    j = 0
    for i in range(0, 1 << tol):
        if j < len(moveL):
            print(f'does({player}, {moveL[j]}, T) :- ', end='', file=f)
            for k in range(0, tol):
                if ((i >> k) & 1) == 0:
                    print('not ', end='', file=f)
                if k == tol - 1:
                    if i == 0:
                        print(f'moveL({player}, {k+1}' + f', T), ' + f'legal({player}, {moveL[j]}, T), not terminated(T).', file=f)
                    else:
                        print(f'moveL({player}, {k+1}' + f', T), ' + f'legal({player}, {moveL[j]}, T), not terminated(T).', file=f)
                else:
                    print(f'moveL({player}, {k+1}' + f', T), ', end='', file=f)
        
        j += 1
    
    print(file=f)


def build_quantifier(current, gamefile, quantifier):
    cmd = f'clingo --output=smodels log-encoding.lp {gamefile} > smodels.txt'
    os.system(f"bash -c '{cmd}'")

    outputfile = open(file=quantifier, mode='w')

    state = 0
    universal = {}
    exist = {}
    exist_o = {}

    
    with open('smodels.txt') as f:
        for line in f:
            line = line.strip()
            if line == '0':
                state += 1
                continue
            if state == 1:
                line = line.split()
                _, atom = int(line[0]), line[1]
                if atom[:5] != 'does(' and atom[:6] != 'moveL(':
                    continue
                newl = atom.replace('(', ',').replace(')',',').split(',')
                lv = -1
                for i in range(len(newl) - 1, -1, -1):
                    if len(newl[i]) and newl[i] != '\n':
                        lv = int(newl[i])
                        break
                if lv != -1:
                    ours = False
                    for cu in current:
                        lencu = len(f'does({cu},')
                        if atom[:lencu] == f'does({cu},':
                            ours = True
                            break

                    if ours == True:
                        if lv in exist:
                            exist[lv].append(atom)
                        else:
                            exist[lv] = []
                            exist[lv].append(atom)
                    elif atom[:6] == 'moveL(':
                        if lv in universal:
                            universal[lv].append(atom)
                        else:
                            universal[lv] = []
                            universal[lv].append(atom)
                    else:
                        if lv in exist_o:
                            exist_o[lv].append(atom)
                        else:
                            exist_o[lv] = []
                            exist_o[lv].append(atom)


    univ = list(universal.items())
    univ.sort()
    exist = list(exist.items())
    exist.sort()
    exist_o = list(exist_o.items())
    exist_o.sort()

    i = 1
    for tup in univ:
        for it in tup[1]:
            print(f'_forall({i*2}, {it}).', file=outputfile)
        i += 1

    for tup in exist:
        lv = 2 * len(univ) + 1
        ok = False
        for i in range(0, len(univ), 1):
            if tup[0] <= univ[i][0]:
                ok = True
                for it in tup[1]:
                    print(f'_exists({2 * i + 1}, {it}).', file=outputfile)
                break

        if ok == False:
            for it in tup[1]:
                print(f'_exists({lv}, {it}).', file=outputfile)

    for tup in exist_o:
        lv = 1
        ok = False
        for i in range(len(univ) - 1, -1, -1):
            if tup[0] >= univ[i][0]:
                ok = True
                lv = 2 * i + 3
                for it in tup[1]:
                    print(f'_exists({lv}, {it}).', file=outputfile)
                break

        if ok == False:
            for it in tup[1]:
                print(f'_exists({lv}, {it}).', file=outputfile)                

        
    outputfile.close()


def print_integrity(inputfile, player, file):
    with open(inputfile, "r") as g:
        ASP_program = g.read()
    ASP_program += f'#show.'
    ASP_program += f'#show input({player}, P) : input({player}, P).'
    # Control object is a low-level interface for controlling the grounding/solving process.
    ctl = clingo.Control(arguments=['-W', 'none'])  # Here you can write the arguments you would pass to clingo by command line.
    ctl.add("base", [], ASP_program)  # Adds the program to the control object.
    ctl.ground([("base", [])])  # Grounding...
    moves = set()
    # Solving...
    with ctl.solve(yield_=True) as solution_iterator:
        for model in solution_iterator:
            # Model is an instance of clingo.solving.Model class 
            # Reference: https://potassco.org/clingo/python-api/current/clingo/solving.html#clingo.solving.Model
            for s in str(model).split():
                moves.add(s[(7 + len(player)):-1])
        
    moves = list(moves)

    print(f':- not terminated(T), mtdom(T)', end='', file=file)
    for mv in moves:
        print(f', not does({player}, {mv}, T)', end='', file=file)
    print('.', file=file)

    print(f':- does({player},A,T), does({player},B,T), A < B.', file=file)
    # for i in range(len(moves)):
    #     for j in range(i):
    #         print(f':- does({player},{moves[i]}, T), does({player},{moves[j]}, T), mtdom(T), not terminated(T).', file=file)


def print_termination(inputfile, file):
    with open(inputfile, "r") as g:
        ASP_program = g.read()
    ASP_program += f'#show.'
    ASP_program += f'#show mtdom/1.'
    # Control object is a low-level interface for controlling the grounding/solving process.
    ctl = clingo.Control(arguments=['-W', 'none'])  # Here you can write the arguments you would pass to clingo by command line.
    ctl.add("base", [], ASP_program)  # Adds the program to the control object.
    ctl.ground([("base", [])])  # Grounding...
    # Solving...
    mx = 0
    t = ''
    with ctl.solve(yield_=True) as solution_iterator:
        for model in solution_iterator:
            # Model is an instance of clingo.solving.Model class 
            # Reference: https://potassco.org/clingo/python-api/current/clingo/solving.html#clingo.solving.Model
            for s in str(model).split():
                mx = max(mx, int(s[6:-1]))
    
    
    print(f':- not terminated({mx + 1}).', file=file)

def get_other(inputfile, current):
    with open(inputfile, "r") as g:
        ASP_program = g.read()
    ASP_program += f'#show.'
    ASP_program += f'#show role/1.'
    # Control object is a low-level interface for controlling the grounding/solving process.
    ctl = clingo.Control(arguments=['-W', 'none'])  # Here you can write the arguments you would pass to clingo by command line.
    ctl.add("base", [], ASP_program)  # Adds the program to the control object.
    ctl.ground([("base", [])])  # Grounding...
    # Solving...
    res = set()
    with ctl.solve(yield_=True) as solution_iterator:
        for model in solution_iterator:
            # Model is an instance of clingo.solving.Model class 
            # Reference: https://potassco.org/clingo/python-api/current/clingo/solving.html#clingo.solving.Model
            for s in str(model).split():
                if s[5:-1] != current[0]:
                    res.add(s[5:-1]) 
    
    return list(res)


def gdl2qbf(current, other, gamefile, preprocess, outfile):
    logfile = 'log-encoding.lp'
    f = open(logfile, 'w')

    print("tdom(1). tdom(T+1) :- tdom(T), mtdom(T).", file=f)

    print(file=f)

    print("terminated(T) :- terminal(T).", file=f)
    print("terminated(T+1) :- terminated(T), mtdom(T).", file=f)

    print(":- does(P,M,T), not legal(P,M,T).",file=f)

    print(file=f)
    print(f"eta(T) :- goal({current[0]}, 100, T), terminal(T).", file=f)
    print(":- terminated(T), not terminated(T-1), not eta(T).", file=f)
    print(":- terminated(1), not eta(1).", file=f)

    print_termination(gamefile, f)    
    
    print(file=f)

    print(" {" + f"does(R,A,T) : input(R,A)" + "}  :- not terminated(T), mtdom(T), role(R).", file=f)
    
    for o in current:
        print_integrity(gamefile, o, f)    

    print(file=f)

    for o in other:
        print_integrity(gamefile, o, f)    

    print(file=f)


    for o in other:
        log_action_encoding(gamefile, o, f)
    f.close()
    build_quantifier(current, gamefile, 'quantifier.lp')
    cmd = f'clingo --output=smodels {gamefile}  log-encoding.lp quantifier.lp | python qasp2qbf.py --no-warning  | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > {outfile}'
    os.system(f"bash -c '{cmd}'")

    if preprocess == True:
        ps = outfile.split('/')
        ps[len(ps) - 1] = 'bloq_' + ps[len(ps) - 1]
        cmd = f'bloqqer  {outfile} > {'/'.join(ps)}'
        print('Bloqqer preprocessing start')
        start = time.time()
        os.system(f"bash -c '{cmd}'")
        end = time.time()
        print(f'Bloqqer finishes in {round(end - start, 2)}s')

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python extg2qbf.py [config.json]")
        exit(1)
    fp = open(sys.argv[1])
    js = json.load(fp)
    gamefile = js['path']
    current = [js['current']]
    other = get_other(gamefile, current)
    preprocessor = js['preprocessor']
    output = js['output']
    fp.close()
    
    if len(other) == 0:
        # single-player game
        cmd = f'clingo {gamefile} action-generator-single.lp'
        os.system(f"bash -c '{cmd}'")
        exit(0)

    # competitive goal
    gdl2qbf(current, other, gamefile, preprocessor, output)
    