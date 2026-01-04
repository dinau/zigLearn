include ../common.mk

TARGET = cmdarg$(EXE)

#OPT += --release=fast
#OPT += --release=safe
OPT += --release=small

all:
	zig build $(OPT) run -- abc def 123
	@-size $(BINDIR)/$(TARGET)


include ../common.after.mk
