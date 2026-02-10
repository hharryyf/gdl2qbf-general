import os, subprocess
import time
from pathlib import Path
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
for preprocessor in ['bloqqer', 'qratpre+', 'hqspre']:        
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

            
            if (config, inst, preprocessor) in blacklist:
                continue
            start1 = time.time() 
            #os.system(f'timeout --foreground --kill-after=10s 30m {solver} instances/{config}/bloq_{inst}.qdimacs')
            subprocess.run(["python", "extg2qbf_new.py", f"-p=xplayer" ,f"-g=SinglePlayer/Translations/{inst}.asp", f"-n={nflag}", f"-d={dflag}" ,f"-o=instances/{config}/{inst}.qdimacs ", "-b=0"],start_new_session=True)
            try:
                if preprocessor == 'qratpre+':
                    f = open(f'instances/{config}/qrat_{inst}.qdimacs', 'w')
                    subprocess.run([f'{preprocessor}', '--print-formula', f'instances/{config}/{inst}.qdimacs'], stdout=f, start_new_session=True, timeout=1202)
                    f.close()
                elif preprocessor == 'hqspre':
                    subprocess.run([f'{preprocessor}', f'instances/{config}/{inst}.qdimacs', '-o', f'instances/{config}/hqs_{inst}.qdimacs'], start_new_session=True, timeout=1202)
                else:
                    f = open(f'instances/{config}/bloq_{inst}.qdimacs', 'w')
                    subprocess.run([f'{preprocessor}', f'instances/{config}/{inst}.qdimacs'], stdout=f, start_new_session=True, timeout=1202)
                    f.close()
            except subprocess.TimeoutExpired as e:
                print('TIMEOUT')
            end1 = time.time()
            os.system('sleep 0.5')
            f = open('result.txt', 'a')
            if end1 - start1 > 1200:
                print(f'config: {config} | instance: {inst}  | preprocessor-only: {preprocessor} | time: > 1200', file=f)
            else:
                if preprocessor == 'qratpre+':
                    path = Path(f'instances/{config}/qrat_{inst}.qdimacs')
                elif preprocessor == 'hqspre':
                    path = Path(f'instances/{config}/hqs_{inst}.qdimacs')
                elif preprocessor == 'bloqqer':
                    path = Path(f'instances/{config}/bloq_{inst}.qdimacs')
                if path.is_file():
                    print(f'config: {config} | instance: {inst}  | preprocessor-only: {preprocessor} | time: {int(end1 - start1)}', file=f)
                else:
                    print(f'config: {config} | instance: {inst}  | preprocessor-only: {preprocessor} | time: Abort', file=f)
            f.close()
