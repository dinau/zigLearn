include ../common.mk


SRC = src/main.zig

all: fib-fast$(EXE) fib-size$(EXE)
	-sh ./time.sh 41

fib-fast$(EXE): $(SRC)
	zig build-exe $(<) -O ReleaseFast -femit-bin=$@

fib-size$(EXE): $(SRC)
	zig build-exe $(<) -O ReleaseSmall -femit-bin=$@


include ../common.after.mk
