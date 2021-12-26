let dirTable = ["cmdarg"
,"dim"
,"enumWindows"
,"exec"
,"fib"
,"hello"
,"helloWin"
,"life26"
,"life262"
,"printf"
,"sprintf"
,"stdin"
,"xprintf_stdio"
,"xprintf_win"]

task make, "":
    for dir in dirTable:
        withDir dir:
            if fileExists("Makefile"):
                echo "[ ",dir," ]"," -- make"
                exec "make"
            else:
                echo "[ ",dir," ]"," -- No Makefile"
                exec "zig build"
task clean, "":
    for dir in dirTable:
        withDir dir:
            if fileExists("Makefile"):
                echo "[ ",dir," ]"," -- make"
                exec "make clean"
            else:
                echo "[ ",dir," ]"," -- No Makefile"
                rmDir "zig-out"
                rmDir "zig-cache"
task run, "":
    for dir in dirTable:
        withDir dir:
            if fileExists("Makefile"):
                echo "[ ",dir," ]"," -- make"
                exec "make run"
            else:
                echo "[ ",dir," ]"," -- No Makefile"
                exec "zib build run"
task build,"":
    makeTask()


