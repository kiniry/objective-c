GNUSTEP_MAKEFILES = /c/GNUstep/GNUstep/System/Library/Makefiles

include $(GNUSTEP_MAKEFILES)/common.make

CC = clang
PACKAGE_NAME = assignment_five

TOOL_NAME = Five

ADDITIONAL_FLAGS += -fblocks -std=gnu99 -g

Five_HEADER_FILES = $(wildcard *.h) 
Five_OBJC_FILES = $(wildcard *.m) 

include $(GNUSTEP_MAKEFILES)/tool.make
