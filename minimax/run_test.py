import os, subprocess
import time
import datetime

blacklist = set()

instance = [#('break-through-2x5', 'xplayer', 'oplayer', '', 21), 
#             ('break-through-3x4', 'xplayer', 'oplayer', '', 19),
#             ('break-through-2x6', 'xplayer', 'oplayer', '', 29),
#             ('break-through-4x4', 'xplayer', 'oplayer', '', 25),
#             ('connect-3-4x4', 'red', 'black', '', 16),
#             ('connect-3-5x5', 'red', 'black', '', 25),
#             ('connect-3-6x6', 'red', 'black', '', 36),
#             ('connect-4-4x4', 'red', 'black', '', 16),
#             ('connect-4-5x4', 'red', 'black', '', 20),
#             ('connect-4-5x5', 'red', 'black', '', 22),
#             ('gttt-4x4-1-1-fatty-v2', 'xplayer', 'oplayer', '', 16),
#             ('gttt-4x4-1-1-elly-v2', 'xplayer', 'oplayer', '', 16),
#             ('gttt-4x4-1-1-knobby-v2', 'xplayer', 'oplayer', '', 16),
#             ('gttt-4x4-1-1-skinny-v2', 'xplayer', 'oplayer', '', 16),
#             ('gttt-4x4-1-1-tippy-v2', 'xplayer', 'oplayer', '', 16),
#             ('gttt-4x4-2-2-fatty-v2', 'xplayer', 'oplayer', '', 16),
#             ('gttt-4x4-2-2-elly-v2', 'xplayer', 'oplayer', '', 16),
#             ('gttt-4x4-2-2-knobby-v2', 'xplayer', 'oplayer', '', 16),
#             ('gttt-4x4-2-2-skinny-v2', 'xplayer', 'oplayer', '', 16),
#             ('gttt-4x4-2-2-tippy-v2', 'xplayer', 'oplayer', '', 16),
            ('dots-and-boxes-2x2', 'xplayer', 'oplayer', '', 12),
            ('dots-and-boxes-2x3', 'xplayer', 'oplayer', '', 17),
            #('connect-3-3-player-4x4', 'red', 'black', 'yellow', 16),
            #('connect-3-3-player-5x5', 'red', 'black', 'yellow', 25),
            #('connect-3-3-player-6x6', 'red', 'black', 'yellow', 36),
            #('connect-4-3-player-4x4', 'red', 'black', 'yellow', 16),
            #('connect-4-3-player-5x4', 'red', 'black', 'yellow', 20),
            #('connect-4-3-player-5x5', 'red', 'black', 'yellow', 24),
            ('tic-tac-toe-3player-3x3', 'xplayer', 'oplayer', 'zplayer', 9),
            ('tic-tac-toe-3player-4x4', 'xplayer', 'oplayer', 'zplayer', 16)
        ]

f = open('result.txt', 'a')

print(f'====================Start New Logs {datetime.datetime.now()}==============================', file=f)

f.close()

for inst in instance:
    players = f'{inst[1]},{inst[2]},{inst[3]}'
    start1 = time.time()
    try:
        subprocess.run(['./minimax_solver', f'{inst[0]}.pl', players, str(inst[4])], start_new_session=True, timeout=1200)
    except subprocess.TimeoutExpired as e:
        print('TIMEOUT')
    end1 = time.time()
    os.system('sleep 0.5')
    f = open('result.txt', 'a')
    if end1 - start1 > 1200:
        print(f'instance: {inst}  | solver: Minimax | time: > 1200', file=f)
    else:
        print(f'instance: {inst}  | solver: Minimax | time: {round(end1 - start1, 2)}', file=f)
    f.close()
