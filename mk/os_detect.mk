ifeq ($(OS), Windows_NT)
	EXT = .exe
	PREFIX =
	RM	= del
	WHICH := where
	PLATFORM := Windows
else
	EXT =
	RM 	= rm -f
	PREFIX := ./
	WHICH := which
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S), Linux)
		PLATFORM := Linux
	endif
	ifeq ($(UNAME_S), Darwin)
		PLATFORM := Mac
	endif
endif

ifeq ($(PROJLANG), cpp)
	include $(MK)/cppfiles.mk
	include $(MK)/cppbuild.mk
	include $(MK)/cpplint.mk
	include $(MK)/cppgraphics.mk
endif
ifeq ($(PROJECT), latex)
	include $(MK)/latex.mk
endif