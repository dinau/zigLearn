include ../common.mk

TARGET = helloWin$(EXE)

CC = gcc
OPT_GCC +=-ffunction-sections -fdata-sections
OPT_GCC +=-Wl,--gc-sections
OPT_GCC += -Wl,-s -Os
CFLAGS += $(OPT_GCC)

BIN = zig-out/bin

SRC = src/main.zig

all: $(BIN)/$(TARGET) helloWinZig$(EXE) chelloWinGCC$(EXE) chelloWinZigCC$(EXE)


helloWinZig$(EXE): $(SRC) Makefile
	zig build-exe --subsystem windows -O ReleaseSmall $< -femit-bin=$@
chelloWinGCC$(EXE): chelloWin.c Makefile
	gcc -mwindows  -o $@ $(CFLAGS) $<
chelloWinZigCC$(EXE): chelloWin.c Makefile
	zig cc -Wl,--subsystem,windows -o $@ $(CFLAGS) $<

include ../common.after.mk
