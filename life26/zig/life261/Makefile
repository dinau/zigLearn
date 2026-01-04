include ../common.mk

TARGET = $(notdir $(CURDIR))$(EXE)

#OPT += --release=fast
#OPT += --release=safe
OPT += --release=small

BINDIR = zig-out/bin

all:
	zig build $(OPT)
	@-ls -al $(BINDIR)
	@-size $(BINDIR)/$(TARGET)


include ../../../common.after.mk
