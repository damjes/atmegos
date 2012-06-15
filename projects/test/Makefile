all: bin/test
bin/test: bin obj/test.o
	gcc obj/test.o -o bin/test
bin:
	mkdir bin
obj/test.o : obj src/test.c
	gcc -c src/test.c -o obj/test.o
obj:
	mkdir obj
