.PRECIOUS: obj/%.o

all: bin/test
bin/%: obj/test.o obj/dummy.o
	gcc $^ -o $@
obj/%.o : src/%.c
	gcc -c $< -o $@
