include ../common.mk

TARGET = xprintf_stdio$(EXE)

#OPT += --release=fast
#OPT += --release=safe
OPT += --release=small

LIBC_INC_DIR = -Ic:/zig/lib/libc/musl

XPRINTF += -I./src/xprintf_int src/xprintf_int/xprintf.c

LIBC += $(LIBC_INC_DIR) -lc

SRCS = src/main.zig
all: $(BINDIR)/$(TARGET)

#main: $(SRCS)
#	zig build-exe $(XPRINTF) $(LIBC) $(SRCS) -O ReleaseSmall
#	@-ls -al ./main$(EXE)
#	@-size ./main$(EXE)

include ../common.after.mk
