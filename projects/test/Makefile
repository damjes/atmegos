all: bin/test
bin/test: bin obj/test.o obj/dummy.o
	gcc obj/test.o obj/dummy.o -o bin/test
bin:
	mkdir bin
obj/test.o : obj src/test.c
	gcc -c src/test.c -o obj/test.o
obj/dummy.o : obj src/test.c
	gcc -c src/dummy.c -o obj/dummy.o
obj:
	mkdir obj
