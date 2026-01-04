let dirTable = [
  "avr_led"
, "cmdarg"
, "dim"
, "enumWindows"
, "exec"
, "fib"
, "hello"
, "helloWin"
, "json"
, "life26/nim"
, "life26/zig/life261"
, "life26/zig/life262"
, "printf"
, "sprintf"
, "stdin"
, "xprintf_stdio"
, "xprintf_win"]

task make, "":
  for dir in dirTable:
    withDir dir:
      try:
        if fileExists("Makefile"):
          echo "\n="
          echo "= ", dir, " =", " -- make"
          echo "="
          exec "make"
        else:
          echo "\n==== ", dir, " ====", " -- No Makefile"
          exec "zig build"
      except OSError:
        echo "\n==========================="
        echo "   Error Compilation !!"
        echo "===========================\n"

task clean, "":
  for dir in dirTable:
    withDir dir:
      if fileExists("Makefile"):
        echo "[ ", dir, " ]", " -- make"
        exec "make clean"
      else:
        echo "[ ", dir, " ]", " -- No Makefile"
        rmDir "zig-out"
        rmDir ".zig-cache"

task run, "":
  for dir in dirTable:
    withDir dir:
      if fileExists("Makefile"):
        echo "[ ", dir, " ]", " -- make"
        exec "make run"
      else:
        echo "[ ", dir, " ]", " -- No Makefile"
        exec "zig build run"

task fmt, "":
  for dir in dirTable:
    withDir dir:
      if fileExists("Makefile"):
        echo "[ ", dir, " ]", " -- make"
        exec "make fmt"
      else:
        echo "[ ", dir, " ]", " -- No Makefile"
        exec "zig fmt ."
task build, "":
  makeTask()
