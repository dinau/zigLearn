TARGET = life26nim
OPT += --nimcache:.nimcache

all:
	nim c -d:release -d:strip $(OPT) $(TARGET).nim

.PHONY: clean

clean:
	rm -fr .nimcache $(TARGET).exe
