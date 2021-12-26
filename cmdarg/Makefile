include ../common.mk

TARGET = cmdarg$(EXE)

BINDIR = zig-out/bin
OPT += -Drelease-small

ZIG = zig

SRCS = src/main.zig
all: $(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET): $(SRCS)
	$(ZIG) build $(OPT)
	@-ls -al $(BINDIR)/$(TARGET)
	@-size $(BINDIR)/$(TARGET)

run: all
	./$(BINDIR)/$(TARGET) 123 456 789

clean:
	rm -fr zig-out zig-cache

