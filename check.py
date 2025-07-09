import sys 

if len(sys.argv) != 2:
    print('Usage: python check.py [path to the qdimacs file]')
    exit(1)

dimacs = sys.argv[1]

f = open(dimacs, 'r')

level = {}
cnt = 0
cl = 0
clause = {}

for line in f:
    line = line.strip().split()
    if line[0] == 'p':
        continue
    if line[0] == 'e':
        for i in line[1:]:
            if int(i) != 0:
                level[int(i)] = cnt
        cnt += 1
    elif line[0] == 'a':
        for i in line[1:]:
            if int(i) != 0:
                level[int(i)] = cnt
        cnt += 1
    else:
        for i in line:
            vari = abs(int(i))
            if vari != 0:
                if vari not in clause:
                    clause[vari] = set()
                for j in line:
                    varj = abs(int(j))
                    if varj != 0 and vari != varj:
                        clause[vari].add(varj)


for v in clause.keys():
    lv = level[v]
    if lv % 2 == 1:
        continue
    ac = 0
    for nv in clause[v]:
        ac = max(ac, level[nv])
    if ac != lv:
        print(v, 'actual: ', lv, 'optimal: ', ac)        

f.close()
