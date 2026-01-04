CC = avr-gcc
OBJDUMP = avr-objdump
OBJCOPY = avr-objcopy
MCU = atmega328p
ELFS += main.elf
VPATH = src

all: $(ELFS)

ZIG_OPT += -mcpu=$(MCU)
ZIG_OPT += -target avr-freestanding-none
ZIG_OPT += -O ReleaseSmall

CFLAGS  = -mmcu=$(MCU) -Os
#CFLAGS += -Wl,--gc-sections

%.o: %.c Makefile
	$(CC) -c -o $@  $(CFLAGS) $<

%.o: %.zig Makefile
	zig build-obj -femit-bin=$@  $(ZIG_OPT) $<

%.elf: %.o
	-$(CC) $(CFLAGS) -o $@ $^
	-@$(OBJDUMP) -hdSC $@ > $(@:%.elf=%.lst)
	@$(OBJCOPY) -O ihex $@ $(@:%.elf=%.hex)
	-@avr-size $@

clean:
	@rm -f *.dmp *.s *.hex *.bin *.out *.elf *.o *.lst
	@rm -fr .zig-cache zig-out

fmt:
	zig fmt .
