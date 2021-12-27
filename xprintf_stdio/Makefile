include ../common.mk

TARGET = xprintf_stdio$(EXE)
BINDIR = zig-out/bin

LIBC_INC_DIR = -Id:/zig/lib/libc/musl
XPRINTF += -I./src/xprintf_int src/xprintf_int/xprintf.c
LIBC += $(LIBC_INC_DIR) -lc

SRCS = src/main.zig
all: $(BINDIR)/$(TARGET) main

main: $(SRCS)
	zig build-exe -target i386-windows-gnu $(XPRINTF)  $(LIBC) $(SRCS) -O ReleaseSmall
	@-ls -al ./main$(EXE)
	@-size ./main$(EXE)

$(BINDIR)/$(TARGET): $(SRCS)
	zig build $(TARC) -Drelease-small
	@-ls -al $(BINDIR)/$(TARGET)
	@-size $(BINDIR)/$(TARGET)

run: all
	./$(BINDIR)/$(TARGET)


clean:
	-@rm -fr zig-out zig-cache src/zig-cache
	-@rm *.exe *.pdb
