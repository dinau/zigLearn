include ../common.mk

TARGET = json$(EXE)

#OPT += --release=fast
#OPT += --release=safe
OPT += --release=small

all:
	zig build $(OPT)
	@-ls -al $(BINDIR)/$(TARGET)
	@-size $(BINDIR)/$(TARGET)

include ../common.after.mk
