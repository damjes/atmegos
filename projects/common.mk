.PRECIOUS: obj/%.o bin/%.elf
.PHONY: program

PROG = usbasp
#PORT = avrdoper

CC=/usr/bin/avr-gcc
CFLAGS=-Os -I../../lib/h -mmcu=$(MCU) -DF_CPU=$(F_CPU)UL
OBJCOPY	= /usr/bin/avr-objcopy

program: bin/$(DEST).hex bin/$(DEST).eeprom
	sudo avrdude -p $(MCU) -c $(PROG) -P $(PORT) -U lfuse:w:$(LFUSE):m -U hfuse:w:$(HFUSE):m -U flash:w:bin/$(DEST).hex -U eeprom:w:bin/$(DEST).eeprom
bin/%.hex: bin/%.elf
	$(OBJCOPY) -O ihex -R .eeprom -R .fuse -R .lock $< $@
#params from winavr
bin/%.eeprom: bin/%.elf
	$(OBJCOPY) -O ihex  -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 --no-change-warnings $< $@ || exit 0
bin/%.elf: $(OFILES)
	$(CC) $(CFLAGS) $^ -o $@
obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f obj/*
	rm -f bin/*
