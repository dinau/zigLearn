import strutils,sequtils ,rdstdin
const W = 10
const H = 10
var f,pf = newSeqWith(H, newSeq[int](W))
while(var sc:seq[string] = readLineFromStdin("x y >").split(); sc[0] != "q"):
        if sc.len == 2: pf[sc[1].parseInt][sc[0].parseInt] = 1
        elif sc[0] == "":
            for y in 0..<H:
                echo ""
                for x in 0..<W:
                    var c = 0
                    for yy in y-1..y+1:
                        for xx in x-1..x+1:
                            if yy < 0 or yy >= H or xx < 0 or xx >= W or (x == xx and y == yy): continue
                            c += pf[yy][xx]
                    f[y][x] = if (c == 2 and pf[y][x] == 1) or c == 3: 1 else: 0
                    write stdout , if f[y][x] == 1: " o" else: " ."
            swap(pf,f)
