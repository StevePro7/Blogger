;=================================================================================
; SDSC tag and SMS rom header
;=================================================================================

.sdsctag 1.00, "MBM Play SFX Demo", "Master System version", "Kagesan"


;=================================================================================
; WLA-DX banking setup
;=================================================================================
.emptyfill $00                      ; fill all banks with zeroes

.MEMORYMAP
DEFAULTSLOT 0
SLOTSIZE $7FF0
SLOT 0 $0000                        ; ROM (unpaged)
SLOTSIZE $0010
SLOT 1 $7FF0                        ; Header
SLOTSIZE $4000
SLOT 2 $8000                        ; ROM (paged)
SLOTSIZE $2000
SLOT 3 $c000                        ; RAM
.ENDME

.ROMBANKMAP
BANKSTOTAL 8
BANKSIZE $7FF0
BANKS 1
BANKSIZE $0010
BANKS 1
BANKSIZE $4000
BANKS 6
.ENDRO


;=================================================================================
;Variable Definitions
;=================================================================================

;----------------------------------------------------------------------
; VARIABLES
;----------------------------------------------------------------------

.ramsection "RAM" slot 3

; General
ControllerInput1          db        ; Input read from controller port 1
VBlankRoutine             dw        ; Stores the adress of the routine executed at VBlank interrupt
Region                    db        ; 0 = Japan, 1 = Export
ButtonPressed             db        ; 1 = button held down

.ends

;----------------------------------------------------------------------
; CONSTANTS
;----------------------------------------------------------------------

.define SpriteSet           0       ; 0 for sprites to use tiles 0-255, 1 for 256+
.define NameTableAddress    $3800   ; must be a multiple of $800; usually $3800; fills $700 bytes (unstretched)
.define SpriteTableAddress  $3f00   ; must be a multiple of $100; usually $3f00; fills $100 bytes

.define BankSwitch          $ffff

.define JoyRight            %11110111
.define JoyLeft             %11111011
.define JoyUp               %11111110
.define JoyDown             %11111101
.define JoyA                %11101111
.define JoyB                %11011111
.define JoyIdle             %11111111


;=================================================================================
; Boot section
;=================================================================================
.BANK 0 SLOT 0
.ORGA $0000

.section "Boot section" force

    di                              ; disable interrupts
    im 1                            ; interrupt mode 1
    
    ld a, $00                       ; initialize mappers
    ld ($fffc), a
    ld a, $00
    ld ($fffd), a
    ld a, $01
    ld ($fffe), a
    ld a, $02
    ld ($ffff), a

    jp Initialize                   ; jump to main program

.ends

;=================================================================================
; Interrupt handler
;=================================================================================
.ORG $0038

.section "Interrupt handler" force

    ex af, af'

    ld a, (BankSwitch)              ; read current bank from paging register
    push af                         ; push it on stack

    in a, $bf                       ; VDP status / satisfy interrupt

    in a, ($dc)                     ; reads the port from control pad 1
    ld (ControllerInput1), a

    exx
    ld hl, (VBlankRoutine)
    call CallHL
    exx

    pop af                          ; retrieve bank to return to from stack
    ld (BankSwitch), a              ; write it to paging register

    ex af, af'
    ei
    reti

.ends

;=================================================================================
; Pause button handler
;=================================================================================
.ORG $0066

.section "Pause button handler" force

retn

.ends


;=================================================================================
; VBlank routine
;=================================================================================

.section "VBlank Routine main" free

VBlankRoutineMain:

    call TurnOffScreen
    call TurnOnScreen

ret

.ends


;=================================================================================
; Helper functions
;=================================================================================

.include "vdp.inc"

.include "RegionDetection.inc"

.include "FMDetection.inc"


;=================================================================================
; Initialize
;=================================================================================

.section "Initialize" free

Initialize:

; Clear RAM -->

    ld hl, $C001                    ; clear RAM, leave IO control byte from BIOS
    ld bc, $1FFF
 -: ld a, $00
    ld (hl), a
    inc hl
    dec bc
    ld a, b
    or c
    jp nz, -

    ld sp, $dff0                    ; set stack pointer

    call DefaultInitialiseVDP       ; set up VDP registers
    call ClearVRAM                  ; clear VRAM
    call DisableSprites             ; disable sprites

    jp Main

.ends


;=================================================================================
; Main program
;=================================================================================

.section "Main" free

Main:

    di

    call DetectRegion               ; check for region
    ld (Region), a

    call DetectFM                   ; check if FM sound is available

    call PSGInit                    ; initialize PSGlib

    ld hl, VBlankRoutineMain        ; set VBlankRoutine to proper VBlank handling
    ld (VBlankRoutine), hl
    
    ld a, (FMType)                  
    or a
    jp z, +

    ld a, :Music_FM
    ld (MBMBank), a
    ld hl, Music_FM
    ld (MBMStart), hl
    call MBMPlay                    ; load FM music and start playing
    
+:  ei

    call TurnOnScreen
    
Loop:

    halt
    
; play music and sfx -->

    ld a, (FMType)
    or a
    jp z, +

    call MBMFrame                   ; process music frame
    call MBMSFXFrame                ; process sfx frame

+:  ld a, (PSGBankSFX)              ; switch to bank for current sfx
    ld (BankSwitch), a
    call PSGSFXFrame

    ld a, (ControllerInput1)        ; Check if no button is pressed
    cp $FF
    jp nz, +

    ld hl, ButtonPressed
    ld (hl), 0

+:  cp JoyA
    jp nz, +++

    ld a, (ButtonPressed)
    or a
    jp nz, ++

    ld a, :FMSFX                    ; start FM sfx
    ld (MBMSFXBank), a
    ld hl, FMSFX
    ld (MBMSFXStart), hl
    call MBMSFXPlay

    ld a, 1
    ld (ButtonPressed), a

    jp ++

+++:cp JoyB
    jp nz, ++

    ld a, (ButtonPressed)
    or a
    jp nz, ++

    ld a, :PSGSFX
    ld (PSGBankSFX), a              ; store bank for PSGSFXPlay
    ld (BankSwitch), a              ; switch to bank
    ld hl, PSGSFX                   ; load sfx
    ld c, SFX_CHANNEL2              ; sfx plays on channel 2
    call PSGSFXPlay                 ; start PSG sfx

    ld a, 1
    ld (ButtonPressed), a

++: jp Loop

.ends


;=================================================================================
; Music players
;=================================================================================

.include "PSGlib.inc"
.include "MBMPlay.inc"
.include "MBMSFXPlay.inc"


;=================================================================================
; Header etc.
;=================================================================================

.BANK 1 SLOT 1
.ORG $7FF0
;---------------------------------------------------------------------------------

.section "Call HL" free

CallHL:
    jp (hl)

.ends


;=================================================================================
; Assets in superfree sections
;=================================================================================
.BANK 2 SLOT 2

.section "Music FM" superfree
Music_FM:
    .incbin "example.mbm"
.ends
.section "SFX PSG" superfree
PSGSFX:
    .incbin "sfx_example.psg"
.ends
.section "SFX FM" superfree
FMSFX:
    .incbin "sfx_example.bin"
.ends