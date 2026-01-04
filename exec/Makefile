include ../common.mk

TARGET = exec$(EXE)

#OPT += --release=fast
#OPT += --release=safe
OPT += --release=small

all:
	zig build $(OPT)
	@-size $(BINDIR)/$(TARGET)

include ../common.after.mk
