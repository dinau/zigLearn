include ../common.mk

TARGET = life262$(EXE)

BINDIR = zig-out/bin

ZIG = zig

SRCS = src/main.zig
all: $(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET): $(SRCS)
	$(ZIG) build $(OPT)
	@-ls -al $(BINDIR)/$(TARGET)
	@-size $(BINDIR)/$(TARGET)

run: all
	./$(BINDIR)/$(TARGET)

clean:
	rm -fr zig-out zig-cache
