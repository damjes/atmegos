.PRECIOUS: obj/%.o bin/%.elf
.PHONY: program

DEST = test

HFUSE = 0x99
LFUSE = 0xe1

MCU = atmega32
F_CPU = 1000000

PROG = stk500v2
PORT = avrdoper

CC=/usr/bin/avr-gcc
CFLAGS=-Os -I../../lib/h -mmcu=$(MCU) -DF_CPU=$(F_CPU)UL
OBJCOPY	= /usr/bin/avr-objcopy

program: bin/$(DEST).hex bin/$(DEST).eeprom
	sudo avrdude -p $(MCU) -c $(PROG) -P $(PORT) -U lfuse:w:$(LFUSE):m -U hfuse:w:$(HFUSE):m -U flash:w:$(DEST).hex -U eeprom:w:$(DEST).eeprom
bin/%.hex: bin/%.elf
	$(OBJCOPY) -O ihex -R .eeprom -R .fuse -R .lock $< $@
#params from winavr
bin/%.eeprom: bin/%.elf
	$(OBJCOPY) -O ihex  -j .eeprom --set-section-flags=.eeprom="alloc,load" \
		--change-section-lma .eeprom=0 --no-change-warnings $< $@ || exit 0
bin/%.elf: obj/test.o
	$(CC) $(CFLAGS) $^ -o $@
obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f obj/*
	rm -f bin/*
