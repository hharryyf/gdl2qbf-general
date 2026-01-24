import sys 
file = sys.argv[1]
file2 = sys.argv[2]
f = open(file, 'r')
f2 = open(file2, 'w')
p = []

for line in f:
    p.append(line.strip())

p.sort()
for li in p:
    print(li, file=f2)

f.close()
f2.close()