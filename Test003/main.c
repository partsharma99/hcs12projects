#include <hcs12.h>
#include <dbug12.h>

/**
 * 7 segments LED decoder
 * 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H
 * 
 * Example: if you want to show "1" on LED segments
 * you should do the following:
 * DDRB = 0xff; //set all pin on port b to output
 * PORTB = segment_decoder[1]; //which means one decodes to 0x06:
 * G F E D C B A
 * 0 0 0 0 1 1 0   
 * 
 *		 A 
 * 		----
 * 	   |	| B
 * 	 F |  	|
 * 		--G-        ===> if B and C segments are one we get the shape of 1 (number one)   
 * 	   |	| C
 * 	 E |	|
 * 		----	
 *       D
 */
unsigned int segment_decoder[]= { 0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d,
		0x07, 0x7f, 0x6f, 0x77, 0x7c, 0x39, 0x5e, 0x79, 0x71, 0x3d, 0x76 };


int main(void) {
	DDRB = 0xff; 
	DDRP |= 0x0f;   //PP0 PP1 PP2 PP3 as output pins

	while (1) 
	{
		static int index_on_7segment_LEDs = 0; // 7-seg display 0 1 2 3
		static int number = 0; // hex number to display 

		PTP = ~(1 << (3 - index_on_7segment_LEDs));  
		PORTB = segment_decoder[number];

		index_on_7segment_LEDs++;
		number++;

		if (index_on_7segment_LEDs > 3) index_on_7segment_LEDs = 0;
		if (number > 15) number = 0;
		
		for (unsigned int i=0; i<100; i++) 
			for (unsigned int j=0; j<65000; j++)
				__asm("nop");
	}
}

