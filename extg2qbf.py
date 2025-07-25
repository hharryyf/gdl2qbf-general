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
        # else:
        #     # other actions, map to does(player, 0)
        #     print(f'does({player}, {moveL[0]}, T) :- ', end='', file=f)
        #     for k in range(0, tol):
        #         if ((i >> k) & 1) == 0:
        #             print('not ', end='', file=f)
        #         if k == tol - 1:
        #             if i == 0:
        #                 print(f'moveL({player}, {k+1}' + f', T), ' + f'legal({player}, {moveL[0]}, T), not terminated(T).', file=f)
        #             else:
        #                 print(f'moveL({player}, {k+1}' + f', T), ' + f'legal({player}, {moveL[0]}, T), not terminated(T).', file=f)
        #         else:
        #             print(f'moveL({player}, {k+1}' + f', T), ', end='', file=f)
        
        j += 1
    
    print(file=f)


def build_quantifier(current, gamefile, formulafile, quantifier):
    cmd = f'clingo --output=smodels action-generator-2.lp helper/pos.lp log-encoding.lp {gamefile} {formulafile}  > smodels.txt'
    os.system(f"bash -c '{cmd}'")

    outputfile = open(file=quantifier, mode='w')

    state, mxv = 0, 0
    edge = set()
    vertex, universal, exist = {}, {}, {}

    with open('smodels.txt') as f:
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
                        if line[i] == 1:
                            print('Unexpected Error')
                            exit(1)
                        edge.add((line[i], head))
                # head number_of_lit number_of_neg_lit bound [negative lit] [positive lit]
                elif line[0] == 2:
                    head = line[1]
                    for i in range(5, len(line)):
                        edge.add((line[i], head))
                # number_of_head [head] number_of_lit number_of_neg_lit [negative lit] [positive lit]
                elif line[0] == 3:
                    head_num = line[1]
                    head = []
                    for i in range(2, head_num + 2):
                        head.append(line[i])
                    # this part can be optimized
                    for i in range(head_num + 4, len(line)):
                        for h in head:
                            edge.add((line[i], h))
                else:
                    print('Cannot handle rule of type 4+ in Clingo!')
                    exit(1)
            elif state == 1:
                line = line.split()
                vid, atom = int(line[0]), line[1]
                mxv = max(mxv, vid)
                newl = atom.replace('(', ',').replace(')',',').split(',')
                ours = False
                for cu in current:
                    lencu = len(f'does({cu},')
                    if atom[:lencu] == f'does({cu},':
                        ours = True
                        break

                if ours == False and atom[:6] != 'moveL(':
                    vertex[vid] = (atom, -1)
                    continue

                lv = -1
                for i in range(len(newl) - 1, -1, -1):
                    if len(newl[i]) and newl[i] != '\n':
                        lv = int(newl[i])
                        break
                if lv != -1:
                    vertex[vid] = (atom, lv)
                    if ours == True:
                        if lv in exist:
                            exist[lv].append(vid)
                        else:
                            exist[lv] = []
                            exist[lv].append(vid)
                    elif atom[:6] == 'moveL(':
                        if lv in universal:
                            universal[lv].append(vid)
                        else:
                            universal[lv] = []
                            universal[lv].append(vid)

    for e in edge:
        mxv = max(mxv, max(e[0], e[1]))

    univ_out = []
    exist_in = []
    for univ in universal.items():
        lv = univ[0]
        univ_out.append((lv, mxv + 1))
        for uv in univ[1]:
            edge.add((uv, mxv + 1))
        mxv += 1

    for exi in exist.items():
        lv = exi[0]
        exist_in.append((lv, mxv + 1))
        for ex in exi[1]:
            edge.add((mxv + 1, ex))
        mxv += 1

    univ_out.sort()
    exist_in.sort()

    luniv, lexist = len(univ_out), len(exist_in)
    i, j = luniv - 1, lexist - 1
    while i >= 0:
        while j >= 0 and exist_in[j][0] > univ_out[i][0]:
            edge.add((univ_out[i][1], exist_in[j][1]))
            j -= 1
        i -= 1

    graph = []
    visited = []
    for i in range(0, mxv + 1):
        graph.append([])
        visited.append(-1)

    for e in edge:
        graph[e[0]].append(e[1])

    def bfs(v, uv, depth):
        q = queue.Queue()
        q.put(v)
        while q.empty() == False:
            curr = q.get()
            if visited[curr] == 1:
                continue
            if uv != curr and curr in vertex:
                print(f'_exists({depth},{vertex[curr][0]}).', file=outputfile)
            visited[curr] = 1

            for nxt in graph[curr]:
                if visited[nxt] != 1:
                    q.put(nxt)

    for i in range(luniv - 1, -1, -1):
        for uv in universal[univ_out[i][0]]:
            print(f'_forall({i * 2 + 2},{vertex[uv][0]}).', file=outputfile)
        for uv in universal[univ_out[i][0]]:
            if visited[uv] != 1:
                bfs(uv, uv, i * 2 + 3)

    for i in range(1, mxv + 1):
        if i in vertex and visited[i] != 1:
            print(f'_exists(1,{vertex[i][0]}).', file=outputfile)

    outputfile.close()


def gdl2qbf(current, other, gamefile, formula, preprocess, outfile):
    logfile = 'log-encoding.lp'
    f = open(logfile, 'w')
    for o in other:
        log_action_encoding(gamefile, o, f)
    f.close()
    build_quantifier(current, gamefile, formula, 'quantifier.lp')
    cmd = f'clingo --output=smodels {gamefile}  {formula} action-generator-2.lp log-encoding.lp quantifier.lp | python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > {outfile}'
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
    current = js['current']
    other = js['other']
    formula = js['formula']
    preprocessor = js['preprocessor']
    output = js['output']
    gc = js['gc']
    lp2sat = js['lp2sat']
    fp.close()
    if len(other) == 0:
        # cooperate goal
        cmd = f'clingo {gamefile} {formula} helper/show-does.lp helper/pos.lp action-generator.lp'
        os.system(f"bash -c '{cmd}'")
        exit(0)

    if len(current) == 0:
        # co-NP property
        if gc == False and lp2sat == False:
            print('co-NP property, please reverse the answer:')
            cmd = f'clingo {gamefile} {formula} helper/rev.lp action-generator.lp'
            os.system(f"bash -c '{cmd}'")
            exit(0)
        elif gc == True:
            check = '{' + f'action-generator.lp,helper/rev.lp,{gamefile},{formula}' + '}'
            cmd = f'time python gc1.py helper/show-nothing.lp  -C {check}'
            os.system(f"bash -c '{cmd}'")
            exit(0)
    # competitive goal
    gdl2qbf(current, other, gamefile, formula, preprocessor, output)
    