GNUSTEP_MAKEFILES = /c/GNUstep/GNUstep/System/Library/Makefiles

include $(GNUSTEP_MAKEFILES)/common.make

CC = clang
PACKAGE_NAME = assignment_three_assertion
CFLAG += -g

ifeq ($(CC), clang)
    ADDITIONAL_FLAGS += -fblocks
endif

TOOL_NAME = ThreeAssertion
ThreeAssertion_HEADER_FILES = $(wildcard *.h) 
ThreeAssertion_OBJC_FILES = $(wildcard *.m) 

include $(GNUSTEP_MAKEFILES)/tool.make
