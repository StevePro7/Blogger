#ifdef _CONSOLE
#include "_genesis.h"
#else
#include <genesis.h>
#endif

int main()
{
	VDP_drawText( "Hello Genny World!", 10, 13 );
	while( 1 )
	{
		VDP_waitVSync();
	}

	return 0;
}