ifeq ($(OS),Windows_NT)
	EXE=.exe
endif

ifeq ($(PROCESSOR_ARCHITECTURE),x86)
	TARC = -Dtarget=i386-windows
endif

#	TARC = x86_64-windows
#
