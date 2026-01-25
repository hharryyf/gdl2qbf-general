import os, subprocess
import time
import datetime
dir = ['GD', 'ND', 'GB', 'NB']

blacklist = set()

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

nflag = 1
dflag = 1

f = open('result.txt', 'a')

print(f'====================Start New Logs {datetime.datetime.now()}==============================', file=f)

f.close()

for config in dir:
    for inst in instance:
        if config == 'GD':
            nflag = 0
            dflag = 1
        elif config == 'NB':
            nflag = 1
            dflag = 0
        elif config == 'GB':
            nflag = 0
            dflag = 0
        else:
            nflag = 1
            dflag = 1

        #cmd = f'python extg2qbf_new.py -p=xplayer -g=SinglePlayer/Translations/{inst}.asp -n={nflag} -d={dflag} -o=instances/{config}/{inst}.qdimacs '
        start = time.time()
        
        subprocess.run(["python", "extg2qbf_new.py", f"-p=xplayer" ,f"-g=SinglePlayer/Translations/{inst}.asp", f"-n={nflag}", f"-d={dflag}" ,f"-o=instances/{config}/{inst}.qdimacs "],start_new_session=True)
        #os.system(cmd)
        end = time.time()
        for solver in ['depqbf']:
            if (config, inst, solver) in blacklist:
                continue
            start1 = time.time() 
            arg = '--no-qbce-dynamic'
            #os.system(f'timeout --foreground --kill-after=10s 30m {solver} instances/{config}/bloq_{inst}.qdimacs')
            try:
                subprocess.run([f'{solver}', arg, f'instances/{config}/bloq_{inst}.qdimacs'], start_new_session=True, timeout=1800)
            except subprocess.TimeoutExpired as e:
                print('TIMEOUT')
            end1 = time.time()
            os.system('sleep 0.5')
            f = open('result.txt', 'a')
            if end - start + end1 - start1 > 1800:
                print(f'config: {config} | instance: {inst}  | solver: {solver} {arg} | time: > 1800', file=f)
            else:
                print(f'config: {config} | instance: {inst}  | solver: {solver} {arg} | time: {int(end - start + end1 - start1)}', file=f)
            f.close()
