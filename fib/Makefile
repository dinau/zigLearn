include ../common.mk


SRC = src/main.zig

all: fib-fast$(EXE) fib-size$(EXE)

fib-fast$(EXE):
	zig build-exe $(SRC) -O ReleaseFast -femit-bin=$@
fib-size$(EXE):
	zig build-exe $(SRC) -O ReleaseSmall -femit-bin=$@

run: all
	bash ./time.sh

clean:
	-rm -fr zig-out zig-cache src/zig-cache
	-rm *.exe *.pdb
