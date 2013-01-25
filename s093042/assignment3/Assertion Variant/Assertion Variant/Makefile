SRCS=$(wildcard *.m)
OBJS=$(SRCS:.m=.o)

PROGRAMNAME=myTestProgram
# write gcc without any parameters to use gcc
CC=clang -fobjc-arc # we want to use ARC with clang

linkedProgram: $(OBJS)
	$(CC) -framework Foundation -o $(PROGRAMNAME) $(OBJS)

%.o: %.m
	$(CC) -c $<

clean:
	rm -f *.o $(PROGRAMNAME)
