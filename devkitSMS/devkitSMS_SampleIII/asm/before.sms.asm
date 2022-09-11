; Source code created by SMS Examine V1.2a
; Size: 32768 bytes

.MEMORYMAP
SLOTSIZE $4000
SLOT 0 $0000
SLOT 1 $4000
SLOT 2 $8000
DEFAULTSLOT 2
.ENDME

.ROMBANKMAP
BANKSTOTAL 2
BANKSIZE $4000
BANKS 2
.ENDRO

; SDSC Tag:
; Name:        Candy Kid Demo
; Author:      StevePro Studios
; Date:        17.03.2017
; Version:     1.00
; Description: DESC

.BANK 0 SLOT 0
.ORG $0000

_START:
	di
	im   1
	jp   _LABEL_70_2


; Data from 6 to 7 (2 bytes)
; (only NULL-bytes)
.db $00, $00

_LABEL_8_8:
	ld   c, $BF
	di
	out  (c), l
	out  (c), h
	ei
	ret


; Data from 11 to 37 (39 bytes)
.db $00, $00, $00, $00, $00, $00, $00, "}", $D3, $BE, "|", $D6, $00, $00, $D3, $BE, $C9
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00

_IRQ_HANDLER:
	jp   _LABEL_40D9_10


; Data from 3B to 65 (43 bytes)
; (only NULL-bytes)
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

_NMI_HANDLER:
	jp   _LABEL_410F_27


; Data from 69 to 6F (7 bytes)
; (only NULL-bytes)
.db $00, $00, $00, $00, $00, $00, $00

_LABEL_70_2:
	ld   sp, $DFF0
	ld   de, $FFFC
	xor  a
	ld   (de), a
	ld   b, $03
_LABEL_7A_3:
	inc  de
	ld   (de), a
	inc  a
	djnz _LABEL_7A_3
	xor  a
	ld   hl, $C000
	ld   (hl), a
	ld   de, $C001
	ld   bc, $1FF0
	ldir
	call _LABEL_412B_4
	call _LABEL_3E49_6
	ei
	call _LABEL_20A_25

; Data from 96 to 209 (372 bytes)
.db $C3, $04, $02, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED, $A3, $ED
.db $A3, $ED, $A3, $C9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3E, $02, $CF, $C9, $3E, $00
.db $CF, $76, $18, $FD

_LABEL_20A_25:
	jr   _LABEL_20A_25


; Data from 20C to 3E48 (15421 bytes)
.incbin "output.sms.dat.0"

_LABEL_3E49_6:
	ld   hl, $0000
	push hl
	call _LABEL_3F6B_7
	pop  af
	ld   c, $00
_LABEL_3E53_14:
	ld   hl, $3E9D
	ld   b, $00
	add  hl, bc
	ld   b, (hl)
	di
	ld   a, b
	out  ($BF), a
	ld   a, c
	set  7, a
	out  ($BF), a
	ei
	inc  c
	ld   a, c
	sub  $0B
	jr   c, _LABEL_3E53_14
	call _LABEL_3FAB_15
	call _LABEL_4006_16
	call _LABEL_4018_17
	call _LABEL_40AB_20
_LABEL_3E76_21:
	in   a, ($7E)
	ld   b, a
	ld   a, $80
	sub  b
	jr   c, _LABEL_3E76_21
_LABEL_3E7E_22:
	in   a, ($7E)
	sub  $80
	jr   c, _LABEL_3E7E_22
_LABEL_3E84_23:
	in   a, ($7E)
	ld   c, a
	in   a, ($7E)
	sub  c
	jr   nc, _LABEL_3E84_23
	ld   a, c
	sub  $E7
	jr   c, _LABEL_3E97_24
	ld   hl, $C024
	ld   (hl), $80
	ret

_LABEL_3E97_24:
	ld   hl, $C024
	ld   (hl), $40
	ret


; Data from 3E9D to 3F6A (206 bytes)
.db $04, $20, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $FF, $FD, $21, $24, $C0, $FD
.db $6E, $00, $C9, $4D, $5C, $16, $00, $21, $F0, $C0, $19, $7E, $B1, $4F, $71, $F3
.db $79, $D3, $BF, $7B, $CB, $FF, $D3, $BF, $FB, $C9, $7D, $5C, $2F, $47, $16, $00
.db $21, $F0, $C0, $19, $7E, $A0, $4F, $71, $F3, $79, $D3, $BF, $7B, $CB, $FF, $D3
.db $BF, $FB, $C9, $F3, $7D, $D3, $BF, $3E, $88, $D3, $BF, $FB, $C9, $F3, $7D, $D3
.db $BF, $3E, $89, $D3, $BF, $FB, $C9, $F3, $7D, $D3, $BF, $3E, $87, $D3, $BF, $FB
.db $C9, $CB, $45, $28, $04, $0E, $FB, $18, $02, $0E, $FF, $F3, $79, $D3, $BF, $3E
.db $86, $D3, $BF, $FB, $C9, $4D, $CB, $41, $28, $0F, $C5, $21, $02, $01, $CD, $B0
.db $3E, $C1, $21, $F2, $C0, $36, $10, $18, $0D, $C5, $21, $02, $01, $CD, $C7, $3E
.db $C1, $21, $F2, $C0, $36, $08, $CB, $49, $28, $14, $21, $01, $01, $CD, $B0, $3E
.db $21, $F3, $C0, $36, $10, $FD, $21, $F2, $C0, $FD, $CB, $00, $26, $C9, $21, $01
.db $01, $CD, $C7, $3E, $21, $F3, $C0, $36, $08, $C9, $21, $02, $00, $39, $4E, $06
.db $00, $21, $00, $C0, $09, $CF, $21, $03, $00, $39, $7E, $D3, $BE, $C9

_LABEL_3F6B_7:
	ld   hl, $0002
	add  hl, sp
	ld   c, (hl)
	ld   b, $00
	ld   hl, $C010
	add  hl, bc
	rst  $8
	ld   hl, $0003
	add  hl, sp
	ld   a, (hl)
	out  ($BE), a
	ret


; Data from 3F7F to 3FAA (44 bytes)
.db $11, $00, $C0, $0E, $BF, $F3, $ED, $59, $ED, $51, $FB, $06, $10, $0E, $BE, $ED
.db $A3, $20, $FC, $C9, $11, $10, $C0, $0E, $BF, $F3, $ED, $59, $ED, $51, $FB, $06
.db $10, $0E, $BE, $ED, $A3, $20, $FC, $C9, $7D, $D3, $BE, $C9

_LABEL_3FAB_15:
	ld   hl, $C0E9
	ld   (hl), $00
	ret


; Data from 3FB1 to 3FFF (79 bytes)
.db $3A, $E9, $C0, $D6, $40, $30, $4B, $FD, $21, $03, $00, $FD, $39, $FD, $7E, $00
.db $D6, $D1, $28, $3E, $3E, $29, $21, $E9, $C0, $86, $4F, $3E, $C0, $CE, $00, $47
.db $FD, $5E, $00, $1D, $7B, $02, $3A, $E9, $C0, $87, $4F, $21, $69, $C0, $06, $00
.db $09, $FD, $21, $02, $00, $FD, $39, $FD, $7E, $00, $77, $23, $FD, $21, $04, $00
.db $FD, $39, $FD, $7E, $00, $77, $FD, $21, $E9, $C0, $FD, $4E, $00, $FD, $34


.BANK 1 SLOT 1
.ORG $0000


; Data from 4000 to 4005 (6 bytes)
.db $00, "i", $C9, ".", $FF, $C9

_LABEL_4006_16:
	ld   a, ($C0E9)
	sub  $40
	ret  nc

	ld   bc, $C029
	ld   hl, ($C0E9)
	ld   h, $00
	add  hl, bc
	ld   (hl), $D0
	ret

_LABEL_4018_17:
	ld   hl, $7F00
	rst  $8
	ld   bc, $C029
	ld   e, $40
_LABEL_4021_18:
	ld   a, (bc)
	out  ($BE), a
	inc  bc
	ld   d, e
	dec  d
	ld   a, d
	ld   e, a
	or   a
	jr   nz, _LABEL_4021_18
	ld   hl, $7F80
	rst  $8
	ld   bc, $C069
	ld   e, $80
_LABEL_4035_19:
	ld   a, (bc)
	out  ($BE), a
	inc  bc
	ld   d, e
	dec  d
	ld   a, d
	ld   e, a
	or   a
	jr   nz, _LABEL_4035_19
	ret


; Data from 4041 to 40AA (106 bytes)
.db $21, $21, $C0, $36, $00, $21, $21, $C0, $CB, $46, $28, $F9, $C9, $2A, $25, $C0
.db $C9, $FD, $21, $27, $C0, $FD, $7E, $00, $2F, $4F, $FD, $7E, $01, $2F, $47, $FD
.db $21, $25, $C0, $FD, $7E, $00, $A1, $6F, $FD, $7E, $01, $A0, $67, $C9, $3A, $25
.db $C0, $FD, $21, $27, $C0, $FD, $A6, $00, $6F, $3A, $26, $C0, $FD, $21, $27, $C0
.db $FD, $A6, $01, $67, $C9, $FD, $21, $25, $C0, $FD, $7E, $00, $2F, $4F, $FD, $7E
.db $01, $2F, $47, $79, $FD, $21, $27, $C0, $FD, $A6, $00, $6F, $78, $FD, $A6, $01
.db $67, $C9, $FD, $21, $23, $C0, $FD, $6E, $00, $C9

_LABEL_40AB_20:
	ld   hl, $C023
	ld   (hl), $00
	ret


; Data from 40B1 to 40D8 (40 bytes)
.db $21, $02, $00, $39, $7E, $32, $EA, $C0, $21, $03, $00, $39, $7E, $32, $EB, $C0
.db $C9, $21, $02, $00, $39, $4E, $F3, $79, $D3, $BF, $3E, $8A, $D3, $BF, $FB, $C9
.db $DB, $7E, $6F, $C9, $DB, $7F, $6F, $C9

_LABEL_40D9_10:
	push af
	push hl
	in   a, ($BF)
	ld   ($C022), a
	rlca
	jr   nc, _LABEL_40FC_11
	ld   hl, $C021
	ld   (hl), $01
	ld   hl, ($C025)
	ld   ($C027), hl
	in   a, ($DC)
	cpl
	ld   hl, $C025
	ld   (hl), a
	in   a, ($DD)
	cpl
	inc  hl
	ld   (hl), a
	jr   _LABEL_410A_12

_LABEL_40FC_11:
	push bc
	push de
	push iy
	ld   hl, ($C0EA)
	call _LABEL_4122_13
	pop  iy
	pop  de
	pop  bc
_LABEL_410A_12:
	pop  hl
	pop  af
	ei
	reti

_LABEL_410F_27:
	push af
	push bc
	push de
	push hl
	push iy
	ld   hl, $C023
	ld   (hl), $01
	pop  iy
	pop  hl
	pop  de
	pop  bc
	pop  af
	retn

_LABEL_4122_13:
	jp   (hl)


; Data from 4123 to 412A (8 bytes)
.db $00, $00, $00, $00, $04, $20, $08, $08

_LABEL_412B_4:
	ld   bc, $0008
	ld   a, b
	or   c
	jr   z, _LABEL_413A_5
	ld   de, $C0EC
	ld   hl, $4123
	ldir
_LABEL_413A_5:
	ret


; Data from 413B to 7FFF (16069 bytes)
.incbin "output.sms.dat.10"

