.PHONY: clean run fmt

all:
	@nim make
clean:
	@nim $@
run:
	@nim $@
fmt:
	@nim $@


MAKEFLAGS += --no-print-directory
