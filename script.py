ans = 0
for line in sys.stdin:
    line = line.rstrip()  
    ans += tonum(line)
