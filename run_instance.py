import os, subprocess
import time
import datetime

dir = ['GD', 'ND', 'GB', 'NB']
solvers = ['caqe', 'depqbf', 'qute']
preprocessors = ['bloqqer', 'hqspre', 'qratpre+']

preprefix = {'bloqqer':'bloq', 'hqspre': 'hqs', 'qratpre+': 'qrat'}

blacklist = set()

pretime = {}

instance = ['break-through-2x5', 
             'break-through-3x4',
             'break-through-2x6',
             'break-through-4x4',
             'connect-3-4x4',
             'connect-3-5x5',
             'connect-3-6x6',
             'connect-4-4x4',
             'connect-4-5x4',
             'connect-4-5x5',
             'gttt-4x4-1-1-fatty-v2',
             'gttt-4x4-1-1-elly-v2',
             'gttt-4x4-1-1-knobby-v2',
             'gttt-4x4-1-1-skinny-v2',
             'gttt-4x4-1-1-tippy-v2',
             'gttt-4x4-2-2-fatty-v2',
             'gttt-4x4-2-2-elly-v2',
             'gttt-4x4-2-2-knobby-v2',
             'gttt-4x4-2-2-skinny-v2',
             'gttt-4x4-2-2-tippy-v2',
             'dots-and-boxes-2x2',
             'dots-and-boxes-2x3',
             'connect-3-3player-4x4',
             'connect-3-3player-5x5',
             'connect-3-3player-6x6',
             'connect-4-3player-4x4',
             'connect-4-3player-5x4',
             'connect-4-3player-5x5',
             'tic-tac-toe-3player-3x3',
             'tic-tac-toe-3player-4x4'
            ]

f = open('result.txt', 'r')

for line in f:
    line = line.strip()
    if len(line) == 0:
        continue
    line = line.split('|')
    if len(line) == 1:
        continue
    ispre = False
    con = ''
    inst = ''
    sol = ''
    pre = ''
    tm = -1
        
    for content in line:
        content = content.strip()
        content = content.split(':')
        t1 = content[0].strip()
        t2 = content[1].strip()
        if t1 == 'config':
            con = t2
        elif t1 == 'instance':
            inst = t2
        elif t1 == 'solver':
            sol = t2
        elif t1 == 'preprocessor' or t1 == 'preprocessor-only':
            pre = t2
        elif t1 == 'time':
            if t2[0] == '>' or t2[0] == 'A':
                tm = -1
            else:
                tm = int(t2)

    if sol != '':
    #print(con, inst, sol, pre, tm)
        blacklist.add((con, inst, sol, pre))
    else:
        if pre not in pretime:
            pretime[pre] = {}
        if inst not in pretime[pre]:
            pretime[pre][inst] = {}
        pretime[pre][inst][con] = tm

#print(pretime)

f.close()



nflag = 1
dflag = 1

f = open('result.txt', 'a')

print(f'====================Start New Logs {datetime.datetime.now()}==============================', file=f)

f.close()

for sol in solvers:
    for pre in preprocessors:
        for inst in instance:
            for config in dir:
                f = open('result.txt', 'a')
                if (config, inst, sol, pre) in blacklist:
                    print('skip', (config, inst, pre, sol))
                else:
                    used = pretime[pre][inst][con]
                    if used == -1:
                        print(f'{sol} start solving {inst}, with preprocessor {pre} and time limit -1, skip')
                        print(f'config: {config} | instance: {inst}  | solver: {sol} | preprocessor: {pre} | time: > 1200', file=f)
                    else:
                        T = 1200 - used
                        print(f'{sol} start solving {inst}, with preprocessor {pre} and time limit {T}')
                        start = time.time()
                        try:
                            subprocess.run([sol, f'instances/{config}/{preprefix[pre]}_{inst}.qdimacs'],  start_new_session=True, timeout=T + 1)
                        except subprocess.TimeoutExpired as e:
                            print('TIMEOUT')
                        end = time.time()
                        if end - start > T:
                            print(f'config: {config} | instance: {inst}  | solver: {sol} | preprocessor: {pre} | time: > 1200', file=f)
                        else:
                            print(f'config: {config} | instance: {inst}  | solver: {sol} | preprocessor: {pre} | time: {int(end - start)}', file=f)
                f.close()            
