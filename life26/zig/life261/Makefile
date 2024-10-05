include ../common.mk

TARGET = $(notdir $(CURDIR))$(EXE)

BINDIR = zig-out/bin
OPT += --release=small

ZIG = zig

SRCS = src/main.zig
all: $(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET): $(SRCS)
	$(ZIG) build $(OPT)
	@-ls -al $(@)
	@-size $(@)

run: all
	./$(BINDIR)/$(TARGET)

clean:
	rm -fr zig-out zig-cache
