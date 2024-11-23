;=================================================================================
; Set up VDP registers (default values)
;=================================================================================
; Call DefaultInitialiseVDP to set up VDP to default values.
; Also defines NameTableAddress, SpriteTableAddress and SpriteSet.
;=================================================================================

.section "Initialise VDP to defaults" free
DefaultInitialiseVDP:
    push hl
    push bc
        ld hl,_Data
        ld b,_End-_Data
        ld c,$bf
        otir
    pop bc
    pop hl
    ret

_Data:
    .db %10000100,$80
    ;    |||||||`- Disable synch
    ;    ||||||`-- Enable extra height modes
    ;    |||||`--- SMS mode instead of SG
    ;    ||||`---- Shift sprites left 8 pixels
    ;    |||`----- Enable line interrupts
    ;    ||`------ Blank leftmost column for scrolling
    ;    |`------- Fix top 2 rows during horizontal scrolling
    ;    `-------- Fix right 8 columns during vertical scrolling
    .db %10000000,$81
    ;     |||| |`- Zoomed sprites -> 16x16 pixels
    ;     |||| `-- Doubled sprites -> 2 tiles per sprite, 8x16
    ;     |||`---- 30 row/240 line mode
    ;     ||`----- 28 row/224 line mode
    ;     |`------ Enable VBlank interrupts
    ;     `------- Enable display
    .db (NameTableAddress>>10) |%11110001,$82
    .db %11111111,$83
    .db %11111111,$84
    .db (SpriteTableAddress>>7)|%10000001,$85
    .db (SpriteSet<<2)         |%11111011,$86
    .db $0|$f0,$87
    ;    `-------- Border palette colour (sprite palette)
    .db $00,$88
    ;    ``------- Horizontal scroll
    .db $00,$89
    ;    ``------- Vertical scroll
    .db $ff,$8a
    ;    ``------- Line interrupt spacing ($ff to disable)
_End:
.ends


;=================================================================================
; Clear VRAM
;=================================================================================

.section "Clear VRAM" free
ClearVRAM:
    push af
    push hl
        ld hl,$0000
        call VRAMToHL
        ; Output 16KB of zeroes
        ld bc, $4000    ; Counter for 16KB of VRAM
     -: ld a,$00        ; Value to write
        out ($be),a ; Output to VRAM address, which is auto-incremented after each write
        dec bc
        ld a,b
        or c
        jp nz,-
    pop hl
    pop af
    ret
.ends


;=================================================================================
; Set VRAM to HL
;=================================================================================

.section "VRAM to HL"

VRAMToHL:
    push af
        ld a, l
        out ($bf), a
        ld a, h
        or $40
        out ($bf), a
    pop af
    ret

.ends


;=================================================================================
; Disable Sprites
;=================================================================================

.section "Disable Sprites" free

DisableSprites:

    push af

    ld a, $00
    out ($bf), a
    ld a, $7f
    out ($bf), a         ; initialize Y coordinates

    ld a, $d0
    out ($be), a	 ; Terminate sprite draw
    
    pop af
    
ret

.ends


;=================================================================================
; Turn on screen display
;=================================================================================

.section "Turn on display" free

TurnOnScreen:
    ld a,%11100000
;          |||| |`- Zoomed sprites -> 16x16 pixels
;          |||| `-- Doubled sprites -> 2 tiles per sprite, 8x16
;          |||`---- 30 row/240 line mode
;          ||`----- 28 row/224 line mode
;          |`------ VBlank interrupts
;          `------- Enable display
    out ($bf),a
    ld a,$81
    out ($bf),a
ret

.ends


;=================================================================================
; Turn off screen display
;=================================================================================

.section "Turn off display" free

TurnOffScreen:
    ld a,%10100000
;          |||| |`- Zoomed sprites -> 16x16 pixels
;          |||| `-- Doubled sprites -> 2 tiles per sprite, 8x16
;          |||`---- 30 row/240 line mode
;          ||`----- 28 row/224 line mode
;          |`------ VBlank interrupts, leave enabled to play music during blank screen
;          `------- Enable display
    out ($bf),a
    ld a,$81
    out ($bf),a
ret

.ends