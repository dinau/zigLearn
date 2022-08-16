H = 10
W = 10
f = [[0 for i in range(H)] for j in range(W)]
pf = [[0 for i in range(H)] for j in range(W)]
while not ((len(sc := input().split()) == 1) and sc[0] == "q"): # Python 3.8 or later
    if len(sc) == 2: pf[ int(sc[1]) ][ int(sc[0])] = 1
    elif sc == []:
        for y in range(0,H):
            print("")
            for x in range(0,W):
                c = 0
                for yy in range(y-1,y+1 + 1):
                    for xx in range(x-1,x+1 + 1):
                        if yy < 0 or yy >= H or xx < 0 or xx >= W or (x == xx and y == yy): continue
                        c +=  pf[yy][xx]
                f[y][x] =  1 if (c == 2 and pf[y][x] == 1) or c == 3  else 0
                print( " o"  if f[y][x] == 1 else " .", end="")
        pf,f = f,pf
