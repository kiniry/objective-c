GNUSTEP_MAKEFILES = /c/GNUstep/GNUstep/System/Library/Makefiles

include $(GNUSTEP_MAKEFILES)/common.make

CC = clang
PACKAGE_NAME = assignment_three_logging
CFLAG += -g

ifeq ($(CC), clang)
    ADDITIONAL_FLAGS += -fblocks
endif

TOOL_NAME = ThreeLogging
ThreeLogging_HEADER_FILES = $(wildcard *.h) 
ThreeLogging_OBJC_FILES = $(wildcard *.m) 

include $(GNUSTEP_MAKEFILES)/tool.make
