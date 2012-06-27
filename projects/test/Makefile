.PRECIOUS: obj/%.o

CC=/usr/bin/gcc
#CFLAGS=-Os -mcall-prologues
CFLAGS=-Os -I../../lib/h -L../../lib/obj -ldummy -lplus

all: bin/test
bin/%: obj/test.o
	$(CC) $(CFLAGS) $^ -o $@
obj/%.o : src/%.c
	$(CC) $(CFLAGS) -c $< -o $@
