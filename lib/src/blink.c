#include <util/delay.h>

void blink()
{
	DDRA = 1;
	DDRB = 1;
	
	while(1)
	{
		PORTA ^= 1;
		PORTB ^= 1;
		_delay_ms(100);
	}
}
