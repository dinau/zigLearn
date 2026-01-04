include ../common.mk

TARGET = hello$(EXE)

#OPT += --release=fast
#OPT += --release=safe
OPT += --release=small

SRCS = src/main.zig
all:
	zig build $(OPT)
	@-ls -al $(BINDIR)/$(TARGET)
	@-size $(BINDIR)/$(TARGET)

include ../common.after.mk
