#include "../SMSlib/SMSlib.h"
#include "../MBMlib/MBMlib.h"
#include "assets2banks.h"

#define theModule  example_mbm

void main (void) {

  if (SMS_GetFMAudioCapabilities())
    SMS_EnableAudio (SMS_ENABLE_AUDIO_FM_ONLY);

  MBMPlay(theModule);

  for (;;) {
    SMS_waitForVBlank();
    MBMFrame();

    unsigned char kp=SMS_getKeysPressed();

    if (kp & PORT_A_KEY_1) {
      if (MBMGetStatus())
        MBMStop();
      else
        MBMResume();
    } else if (kp & PORT_A_KEY_2) {
      if (MBMGetStatus())
        MBMStop();
      else
        MBMPlay(theModule);
    } else if (kp & PORT_A_KEY_DOWN) {
      if (MBMGetStatus())
        MBMFadeOut(15);
    } else if (kp & PORT_A_KEY_UP) {
      if (MBMGetStatus())
        MBMCancelLoop();
    }
  }
}

SMS_EMBED_SEGA_ROM_HEADER_16KB(9999,0);
