name = civilstatus
compiler = clang
cflags = -ObjC -fobjc-arc
lflags = -framework Foundation
objects = main.o Citizen.o NoblePerson.o Commoner.o

all: $(name)

$(name): $(objects)
	$(compiler) $(cflags) $(lflags) $(objects) -o $(name)

$(objects): %.o: %.m
	$(compiler) $(cflags) -c $< -o $@

clean:
	rm -f $(name) $(objects)

run: $(name)
	./$(name)
