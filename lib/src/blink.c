#include <util/delay.h>

void blink()
{
	DDRA = 1;
	
	for(;;)
	{
		PORTA ^= 1;
		_delay_ms(500);
	}
}
