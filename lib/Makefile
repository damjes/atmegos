all: obj/libblink.a
obj/lib%.a: src/%.c
	avr-gcc -mmcu=atmega32 -c $^ -o $@
