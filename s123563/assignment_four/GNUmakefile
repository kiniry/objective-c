GNUSTEP_MAKEFILES = /c/GNUstep/GNUstep/System/Library/Makefiles

include $(GNUSTEP_MAKEFILES)/common.make

CC = clang
PACKAGE_NAME = assignment_four

TOOL_NAME = Four

# flags
ifeq ($(CC), clang)
    ADDITIONAL_FLAGS += -fblocks
else
    ADDITIONAL_FLAGS += -std=gnu99
endif


Four_HEADER_FILES = $(wildcard *.h) 
Four_OBJC_FILES = $(wildcard *.m) 

include $(GNUSTEP_MAKEFILES)/tool.make
