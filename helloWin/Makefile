include ../common.mk

TARGET = helloWin$(EXE)

CC = gcc
OPT_GCC +=-ffunction-sections -fdata-sections
OPT_GCC +=-Wl,--gc-sections
OPT_GCC += -s -Os
CFLAGS += $(OPT_GCC)

BIN = zig-out/bin

SRC = src/main.zig

all: $(BIN)/$(TARGET) helloWinZig$(EXE) chelloWinGCC$(EXE) chelloWinZigCC$(EXE)


$(BIN)/$(TARGET): $(SRC)
	zig build $(TARC) -Drelease-small
helloWinZig$(EXE): $(SRC)
	zig build-exe --subsystem windows -O ReleaseSmall $< -femit-bin=$@
chelloWinGCC$(EXE): chelloWin.c
	gcc    -mwindows  -o $@ $(CFLAGS) $<
chelloWinZigCC$(EXE): chelloWin.c
	zig cc -mwindows  -o $@ $(CFLAGS) $<

clean:
	rm *.exe *.pdb
	rm -fr zig-out zig-cache

run: all
	ls -al *.exe
