import sys 
if len(sys) != 2:
    print('Usage: python extg_asp_parser.py [file to the EXTG ASP file]')
    exit(1)
file = sys.argv[1]
f = open(file, 'r')

for line in f:
    pass


f.close()