include ../common.mk

TARGET = dim$(EXE)

#OPT += --release=fast
#OPT += --release=safe
OPT += --release=small

SRCS = src/main.zig

all:
	zig test src\main.zig

include ../common.after.mk
