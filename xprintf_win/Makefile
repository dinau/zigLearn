include ../common.mk

TARGET = xprintf_win$(EXE)

BINDIR = zig-out/bin
OPT += -Drelease-small

ZIG = zig

SRCS = src/main.zig
all: $(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET): $(SRCS) build.zig
	$(ZIG) build $(OPT)
	@-ls -al $(BINDIR)/$(TARGET)
	@-size $(BINDIR)/$(TARGET)

run: all
	./$(BINDIR)/$(TARGET)

clean:
	rm -fr zig-out zig-cache

