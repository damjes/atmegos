.PRECIOUS: obj/%.o

CC=/usr/bin/avr-gcc
CFLAGS=-Os -I../../lib/h -mmcu=atmega32 -DF_CPU=1000000UL

all: bin/test
bin/%: obj/test.o
	$(CC) $(CFLAGS) $^ -o $@
obj/%.o : src/%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f obj/*
	rm -f bin/*
