import os
import re
import sys 
import clingo
from turn import get_o_noop
import queue
import time

def get_player_action(player, path):
    moveR = set()
    with open(path, "r") as g:
        ASP_program = g.read()
    ASP_program += f'#show.'
    ASP_program += f'#show input/2.'
    # Control object is a low-level interface for controlling the grounding/solving process.
    ctl = clingo.Control(arguments=['-W', 'none'])  # Here you can write the arguments you would pass to clingo by command line.
    ctl.add("base", [], ASP_program)  # Adds the program to the control object.
    ctl.ground([("base", [])])  # Grounding...

    # Solving...
    result = []
    with ctl.solve(yield_=True) as solution_iterator:
        for model in solution_iterator:
            # Model is an instance of clingo.solving.Model class 
            # Reference: https://potassco.org/clingo/python-api/current/clingo/solving.html#clingo.solving.Model
            for s in str(model).split():
                result.append(s)
    result.sort(reverse=True)
    for s in result:
        if s[:(len(player) + 6)] == f'input({player}':
            moveR.add(s[len(player) + 7:-1])

    moveR = list(moveR)
    moveR.sort()
    return moveR

def get_horizon(file):
    with open(file, "r") as g:
        ASP_program = g.read()
    ASP_program += f'#show.'
    ASP_program += f'#show mtdom/1.'
    # Control object is a low-level interface for controlling the grounding/solving process.
    ctl = clingo.Control(arguments=['-W', 'none'])  # Here you can write the arguments you would pass to clingo by command line.
    ctl.add("base", [], ASP_program)  # Adds the program to the control object.
    ctl.ground([("base", [])])  # Grounding...

    # Solving...
    horizon = 0
    with ctl.solve(yield_=True) as solution_iterator:
        for model in solution_iterator:
            # Model is an instance of clingo.solving.Model class 
            # Reference: https://potassco.org/clingo/python-api/current/clingo/solving.html#clingo.solving.Model
            for s in str(model).split():
                s = re.match(r'mtdom\((\d+)\)', s).group(1)
                horizon = max(horizon, int(s))
    
    return horizon


def get_role(name, file):
    with open(file, "r") as g:
        ASP_program = g.read()
    ASP_program += f'#show.'
    ASP_program += f'#show role/1.'
    # Control object is a low-level interface for controlling the grounding/solving process.
    ctl = clingo.Control(arguments=['-W', 'none'])  # Here you can write the arguments you would pass to clingo by command line.
    ctl.add("base", [], ASP_program)  # Adds the program to the control object.
    ctl.ground([("base", [])])  # Grounding...

    # Solving...
    adv = []
    with ctl.solve(yield_=True) as solution_iterator:
        for model in solution_iterator:
            # Model is an instance of clingo.solving.Model class 
            # Reference: https://potassco.org/clingo/python-api/current/clingo/solving.html#clingo.solving.Model
            for s in str(model).split():
                s = s[5:-1]
                if s != name:
                    adv.append(s)
    
    return adv



def base_encoding(inputfile, name, adv, horizon):
    def print_integrity(moveX, player, f):
        print(f':- not terminated(T), mtdom(T)', end='', file=f)
        for mv in moveX:
            print(f', not does({player}, {mv}, T)', end='', file=f)
        print('.', file=f)

        print(f':- does({player},A,T), does({player},B,T), A < B.', file=f)

    f = open('base_encoding.lp', 'w')
    print('tdom(T+1) :- mtdom(T). tdom(1).', file=f)
    print('{' + f'does(R, A, T) : input(R, A)' + '} :- role(R), mtdom(T), not terminated(T).', file=f)
    
    
    gamma = {}

    moveX = get_player_action(name, inputfile)
    print_integrity(moveX, name, f)
    gamma[name] = moveX
    for o in adv:
        moveX = get_player_action(o, inputfile)
        print_integrity(moveX, o, f)
        gamma[o] = moveX

    print('terminated(T) :- terminal(T).', file=f)
    print('terminated(T+1) :- terminated(T), mtdom(T).', file=f)
    print(':- does(R, A, T), not legal(R, A, T).', file=f)
    print(f':- not terminated({horizon+1}).', file=f)
    
    print(f':- not goal({name}, 100, T), terminated(T), not terminated(T-1).', file=f)
    print(file=f)
    f.close()

    return gamma    

def model_adverse(adv, moveL, turns, horizon, fg):
    f = open('encoding_adverse.lp', fg)
    tol, lenl = 0, len(moveL)
    while (1 << tol) < lenl:
        tol += 1

    print(f'ldom({adv}, 1..{tol}).', file=f)
    print('% log-encoding', file=f)


    for i in range(1, horizon + 1):
        if i not in turns:
            print(f"{{moveL({adv}, M, {i})}} :-  ldom({adv}, M).",file=f)
    
    for time in range(1, horizon + 1):
        if time not in turns:
            j = 0
            for i in range(0, 1 << tol):
                if j < len(moveL):
                    print(f':- not does({adv}, {moveL[j]}, {time}), ', end='', file=f)
                    for k in range(0, tol):
                        if ((i >> k) & 1) == 0:
                            print('not ', end='', file=f)
                        if k == tol - 1:
                            if i == 0:
                                print(f'moveL({adv}, {k+1}' + f', {time}), ' + f'legal({adv}, {moveL[j]}, {time}), not terminated({time}).', file=f)
                            else:
                                print(f'moveL({adv}, {k+1}' + f', {time}), ' + f'legal({adv}, {moveL[j]}, {time}), not terminated({time}).', file=f)
                        else:
                            print(f'moveL({adv}, {k+1}' + f', {time}), ', end='', file=f)
                
                j += 1
            
    print(file=f)
    
    f.close()


def basic_quantification(xname, filelist):
    cmd = f'clingo --output=smodels {' '.join(filelist)} > encoding_smodels.txt'
    os.system(f"bash -c '{cmd}'")
    f = open('encoding_smodels.txt', 'r')
    outfile = open('quantification.lp', 'w')
    prefix = []
    state = 0
    for line in f:
        line = line.strip()
        if line == '0':
            state += 1
            continue 
        if state == 1:
            line = line.split()
            name = line[1]
            if name[:5] == 'does(':
                ss = name[5:-1].split(',')
                player = ss[0]
                round = int(ss[-1])
                if player == xname:
                    prefix.append((round * 2 - 1, name))
                else:
                    prefix.append((round * 2 + 1, name))
            elif name[:6] == 'moveL(':
                ss = name[6:-1].split(',')
                player = ss[0]
                round = int(ss[-1])
                prefix.append((round * 2, name))

    prefix.sort()
    #print(prefix)
    level = 1
    for atom in prefix:
        if atom[0] % 2 != level % 2:
            level += 1
        if atom[0] % 2 == 0:
            print(f'_forall({level}, {atom[1]}).', file=outfile)
        else:
            print(f'_exists({level}, {atom[1]}).', file=outfile)
        
def quantifier_shifting(filelist):
    cmd = f'clingo --output=smodels {' '.join(filelist)} > encoding_smodels.txt'
    os.system(f"bash -c '{cmd}'")
    f = open('encoding_smodels.txt', 'r')
    outfile = open('quantification.lp', 'a')
    # construct the dependency graph
    edge = {}
    id2name = {}
    name2id = {}
    state = 0
    quantlevel = {}
    visited = set()
    quantified = set()
    for line in f:
        line = line.strip()
        if line == '0':
            state += 1
            continue 
        if state == 0:
            line = list(map(int, line.split()))
            # normal rule
            # head number_of_lit number_of_neg_lit [negative lit] [positive lit]
            if line[0] == 1:
                head = line[1]
                for i in range(4, len(line)):
                    if line[i] not in edge:
                        edge[line[i]] = set()
                    edge[line[i]].add(head)
            # head number_of_lit number_of_neg_lit bound [negative lit] [positive lit]
            elif line[0] == 2:
                head = line[1]
                for i in range(5, len(line)):
                    if line[i] not in edge:
                        edge[line[i]] = set()
                    edge[line[i]].add(head)
            # number_of_head [head] number_of_lit number_of_neg_lit [negative lit] [positive lit]
            elif line[0] == 3:
                head_num = line[1]
                head = []
                for i in range(2, head_num + 2):
                    head.append(line[i])
                    # this part can be optimized
                    for i in range(head_num + 4, len(line)):
                        if line[i] not in edge:
                            edge[line[i]] = set()
                        for h in head:
                            edge[line[i]].add(h)
            else:
                print('Cannot handle rule of type 4+ in Clingo!')
                exit(1)
        elif state == 1:
            # here we process the atoms
            # Aim: associate each atom with its id in the smodels, and
            # 2) memorize the level order of the quantifiers
            line = line.split()
            id = int(line[0])
            name = line[1]
            id2name[id] = name 
            name2id[name] = id 
            if name[:8] == '_exists(':
                match = re.match(r'_exists\((\d+),(.*)\)', name)  
                lv = int(match.group(1))
                quantified.add(match.group(2))
                if lv not in quantlevel:
                    quantlevel[lv] = set()
                quantlevel[lv].add(('e', match.group(2)))  
            elif name[:8] == '_forall(':
                match = re.match(r'_forall\((\d+),(.*)\)', name)  
                lv = int(match.group(1))
                quantified.add(match.group(2))
                if lv not in quantlevel:
                    quantlevel[lv] = set()
                quantlevel[lv].add(('a', match.group(2)))         
            

    def bfs(v, depth):
        q = queue.Queue()
        q.put(v)
        while q.empty() == False:
            curr = q.get()
            if curr in visited:
                continue
            if curr in id2name:
                atm = id2name[curr]
                if atm not in quantified:
                    print(f'_exists({depth},{atm}).', file=outfile)
            visited.add(curr)

            if curr in edge:
                for nxt in edge[curr]:
                    if nxt not in visited:
                        q.put(nxt)
    
    level_list = list(quantlevel)
    level_list.sort(reverse=True)
    for lv in level_list:
        for tp, atom in quantlevel[lv]:
            if atom in name2id and name2id[atom] not in visited:
                if tp == 'e':
                    bfs(name2id[atom], lv)
                else:
                    bfs(name2id[atom], lv + 1)
    for id in id2name:
        if id not in visited:
            if id2name[id][:8] != '_exists(' and id2name[id][:8] != '_forall(':
                print(f'_exists(1, {id2name[id]}).', file=outfile)
    outfile.close()
    f.close()

def invalid(option):
    print(f'Invalid argument for {option}')
    print('run:     python extg2qbf_new.py -h   to see more options')
    exit(0)

if __name__ == '__main__':
    help = '''
            Usage: python extg2qbf_new.py -p=[PLAYER-NAME] -g=[EXT(G)-PATH] -o=[OUTPUT-FILE] [Optional Flags] \n
            
            Compulsory Flags:

            -p=<v>      player name \n
            -o=<v>      path to the outputfile  \n
            -g=<v>      path to the EXT(G) file \n
            
            Optional Flags:

            -d=<0|1>    dependency-based quantification method (default 1) \n
            -n=<0|1>    detect noop-turn (default 0) \n
            -t=<v>      the time limit for detecting noop-turn per player per turn (default 2) \n      
            -b=<0|1>    bloqqer preprocessing (default 1) \n
            -h          print this screen \n
    '''
    if len(sys.argv) == 1:
        print('INVALID USAGE, run:     python extg2qbf_new.py -h   to see more options')
        exit(0)
    
    name = ''
    path = ''
    outfile = ''
    shift = True
    preprocess = True
    noop = False
    timelimit = 2


    for i in range(1, len(sys.argv)):
        arg = sys.argv[i]
        if arg == '-h':
            print(f'{help}')
            exit(0)
        elif arg[:3] == '-d=':
            if arg != '-d=0' and arg != '-d=1':
                invalid(arg)
            if arg == '-d=0':
                shift = False
        elif arg[:3] == '-b=':
            if arg != '-b=0' and arg != '-b=1':
                invalid(arg)
            if arg == '-b=0':
                preprocess = False
        elif arg[:3] == '-g=':
            path = arg[3:]
        elif arg[:3] == '-p=':
            name = arg[3:] 
        elif arg[:3] == '-o=':
            outfile = arg[3:]
        elif arg[:3] == '-t=':
            def is_integer(s):
                try:
                    int(s)
                    return True
                except ValueError:
                    return False
            if is_integer(arg[3:]):
                timelimit = int(arg[3:])
            else:
                invalid(arg)
        elif arg[:3] == '-n=':
            if arg != '-n=0' and arg != '-n=1':
                invalid(arg)
            if arg == '-n=1':
                noop = True
        else:
            invalid(arg)

    if name == '' or outfile == '' or path == '':
        print('INVALID USAGE, run:     python extg2qbf_new.py -h   to see more options')
        exit(0)
    
    
    ################## The actual Encoding ####################

    horizon = get_horizon(path)

    adv = get_role(name, path)

    gamma = base_encoding(path, name, adv, horizon)
    
    # single-player game
    if len(adv) == 0:
        print('The game is a single-player determinstic game!')
        cmd = f'clingo {path} base_encoding.lp'
        os.system(f"bash -c '{cmd}'")
        exit(0)
    
    filelist = ['base_encoding.lp', path]

    fg = 'w'
    for o in adv:
        turns = set()
        if noop == True:
            turns = set(get_o_noop(path, horizon, 2, o))
        model_adverse(o, gamma[o], turns, horizon, fg)
        fg = 'a'
    filelist.append('encoding_adverse.lp')

    basic_quantification(name, filelist)
    filelist.append('quantification.lp')
    if shift == True:
        quantifier_shifting(filelist)

    cmd = f'clingo --output=smodels {' '.join(filelist)} '
    
    cmd += f'| python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > {outfile}'
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

    