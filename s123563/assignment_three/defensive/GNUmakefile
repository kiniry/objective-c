GNUSTEP_MAKEFILES = /c/GNUstep/GNUstep/System/Library/Makefiles

include $(GNUSTEP_MAKEFILES)/common.make

CC = clang
PACKAGE_NAME = assignment_three_defensive
CFLAG += -g

ifeq ($(CC), clang)
    ADDITIONAL_FLAGS += -fblocks
endif

TOOL_NAME = ThreeDefensive
ThreeDefensive_HEADER_FILES = $(wildcard *.h) 
ThreeDefensive_OBJC_FILES = $(wildcard *.m) 

include $(GNUSTEP_MAKEFILES)/tool.make
