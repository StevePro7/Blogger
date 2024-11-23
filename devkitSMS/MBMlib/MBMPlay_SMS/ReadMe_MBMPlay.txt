MBMPlay
-------
MoonBlaster 1.4 driver
MB1.4 assembly sources written by Remco Schrijvers
Extended by BiFi / The New Image 2012/2019
Adapted for the SMS by Kagesan with help from Zipper and Calindro

MBMPlay allows replaying song files created with Moonblaster 1.4 as background music in SEGA 8 bit homebrew programs.



Typical workflow:

- Track a module in MoonBlaster 1.4.
  Save module in USER mode, as MBMPlay will not play files saved in EDIT mode.

- Include MBMPlay and 'incbin' the MBM file to your Z80 ASM source.

- Put the number of the ROM bank where the tune is located and the start address of the tune in 'MBMBank' and 'MBMStart' respectively.
  Load tune and start playing it by calling MBMPlay or MBMPlayNoRepeat.

- Call MBMFrame once per frame.



MBMPlay functions reference:

- MBMPlay / MBMPlayNoRepeat: Loads and starts a tune (playing it repeatedly or only once).
			     Needs bank number in 'MBMBank' and start address in 'MBMStart'.

- MBMFrame: Processes a music frame.

- MBMStop: Stops / pauses the music.

- MBMResume: Resumes the previously stopped music.

- MBMCancelLoop: Sets a looping tune to no more loops after the current one.
		 Non-looping tunes are unaffected. Loop marker must be set in MoonBlaster.

- If 'MBMStatus' is $00, then no tune is playing. $FF means that a tune is playing.

- Putting any value other than 0 in 'MBMFading' will fade out the currently playing tune smoothly.
  A value of 1 makes the volume drop by one level every frame. The tune fades out quickly. 
  A value of 255 makes the tune fade out very slowly.
  After the fade-out is complete, the tune is stopped and 'MBMStatus' is set to $00.