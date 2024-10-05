
BINDIR = zig-out/bin

SRCS = src/main.zig

$(BINDIR)/$(TARGET): $(SRCS)
	zig build $(OPT)
	@-ls -al $(BINDIR)/$(TARGET)
	@-size $(BINDIR)/$(TARGET)

run: all
	./$(BINDIR)/$(TARGET)

clean:
	@-rm -fr zig-out zig-cache .zig-cache *.pdb *.obj *.exe
