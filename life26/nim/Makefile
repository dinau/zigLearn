TARGET = life26nim
OPT += --nimcache:.nimcache

all:
	nim c -d:release -d:strip --opt:size $(OPT) $(TARGET).nim

.PHONY: clean

clean:
	@-rm -fr .nimcache $(TARGET).exe

fmt:
	nimpretty $(TARGET).nim
