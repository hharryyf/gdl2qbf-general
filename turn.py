import clingo 
import sys
turns = ''
def model(m):
    global turns
    turns = m.symbols(shown=True)


def get_o_noop(gamefile, horizon, timeout, player):
    
    noopturn = []
    for i in range(1, horizon + 1):
        with open(gamefile, "r") as g:
            ASP_program = g.read()
        with open('simulator.lp', 'r') as g2:
            ASP_program += g2.read()
        ASP_program += f'mtdom(1..{horizon}).'
        ASP_program += f'#show legal/3.'
        ASP_program += f':-  terminated({i-1}).'
        ASP_program += ':-  {' +  f'legal({player}, A, {i}) : input({player}, A)' + '} 1.'

        # Control object is a low-level interface for controlling the grounding/solving process.
        ctl = clingo.Control(arguments=['-W', 'none'])  # Here you can write the arguments you would pass to clingo by command line.
        ctl.add("base", [], ASP_program)  # Adds the program to the control object.
        ctl.ground([("base", [])])  # Grounding...
        
        # Solving...
        
        with ctl.solve(yield_=True, async_=True, on_model=model) as solution_iterator:
            solution_iterator.wait(timeout)
            solution_iterator.cancel()
            answer = solution_iterator.get()
            if answer.unsatisfiable:
                print(f'Noop-turn {i} for player {player}', file=sys.stderr)
                noopturn.append(i)
            elif answer.satisfiable:
                print(f'Round {i} is not a noop-turn for player {player}', file=sys.stderr)   
            else:
                print(f'Cannot prove step {i}', file=sys.stderr)
                # cnt = 0
                # for ss in turns:
                #     if ss[0] == player:
                #         cnt += 1
                # candidate.append((i, cnt))
    


    print(noopturn)
    return noopturn


#get_o_noop('SinglePlayer/Translations/gttt-4x4-1-1-elly.asp', 16, 2, 'oplayer')
