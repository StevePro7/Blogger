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
	jp   _LABEL_4136_10


; Data from 3B to 65 (43 bytes)
; (only NULL-bytes)
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

_NMI_HANDLER:
	jp   _LABEL_416C_34


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
	call _LABEL_4188_4
	call _LABEL_3EA6_6
	ei
	call _LABEL_245_25

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

_LABEL_20A_26:
	push ix
	ld   ix, $0000
	add  ix, sp
	ld   a, (ix+5)
	rlca
	and  $01
	ld   c, a
	ld   b, $00
	xor  a
	sub  c
	ld   c, a
	ld   a, $00
	sbc  a, b
	ld   b, a
	xor  a
	cp   (ix+4)
	sbc  a, (ix+5)
	jp   po, _LABEL_22E_27
	xor  $80
_LABEL_22E_27:
	rlca
	and  $01
	ld   l, a
	ld   h, $00
	add  hl, bc
	push hl
	ld   l, (ix+4)
	ld   h, (ix+5)
	push hl
	call _LABEL_3E8C_28
	pop  af
	pop  af
	pop  ix
	ret

_LABEL_245_25:
	ld   hl, $FFFB
	push hl
	call _LABEL_20A_26
	pop  af
_LABEL_24D_32:
	jr   _LABEL_24D_32


; Data from 24F to 3E8B (15421 bytes)
.incbin "output.sms.dat.0"

_LABEL_3E8C_28:
	pop  af
	pop  bc
	pop  de
	push de
	push bc
	push af
	xor  a
	ld   l, a
	or   b
	ld   b, $10
	jr   nz, _LABEL_3E9D_29
	ld   b, $08
	ld   a, c
_LABEL_3E9C_31:
	add  hl, hl
_LABEL_3E9D_29:
	rl   c
	rla
	jr   nc, _LABEL_3EA3_30
	add  hl, de
_LABEL_3EA3_30:
	djnz _LABEL_3E9C_31
	ret

_LABEL_3EA6_6:
	ld   hl, $0000
	push hl
	call _LABEL_3FC8_7
	pop  af
	ld   c, $00
_LABEL_3EB0_14:
	ld   hl, $3EFA
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
	jr   c, _LABEL_3EB0_14
	call _LABEL_4008_15
	call _LABEL_4063_16
	call _LABEL_4075_17
	call _LABEL_4108_20
_LABEL_3ED3_21:
	in   a, ($7E)
	ld   b, a
	ld   a, $80
	sub  b
	jr   c, _LABEL_3ED3_21
_LABEL_3EDB_22:
	in   a, ($7E)
	sub  $80
	jr   c, _LABEL_3EDB_22
_LABEL_3EE1_23:
	in   a, ($7E)
	ld   c, a
	in   a, ($7E)
	sub  c
	jr   nc, _LABEL_3EE1_23
	ld   a, c
	sub  $E7
	jr   c, _LABEL_3EF4_24
	ld   hl, $C024
	ld   (hl), $80
	ret

_LABEL_3EF4_24:
	ld   hl, $C024
	ld   (hl), $40
	ret


; Data from 3EFA to 3FC7 (206 bytes)
.db $04, $20, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $FF, $FD, $21, $24, $C0, $FD
.db $6E, $00, $C9, $4D, $5C, $16, $00, $21, $F0, $C0, $19, $7E, $B1, $4F, $71, $F3
.db $79, $D3, $BF, $7B, $CB, $FF, $D3, $BF, $FB, $C9, $7D, $5C, $2F, $47, $16, $00
.db $21, $F0, $C0, $19, $7E, $A0, $4F, $71, $F3, $79, $D3, $BF, $7B, $CB, $FF, $D3
.db $BF, $FB, $C9, $F3, $7D, $D3, $BF, $3E, $88, $D3, $BF, $FB, $C9, $F3, $7D, $D3
.db $BF, $3E, $89, $D3, $BF, $FB, $C9, $F3, $7D, $D3, $BF, $3E, $87, $D3, $BF, $FB
.db $C9, $CB, $45, $28, $04, $0E, $FB, $18, $02, $0E, $FF, $F3, $79, $D3, $BF, $3E
.db $86, $D3, $BF, $FB, $C9, $4D, $CB, $41, $28, $0F, $C5, $21, $02, $01, $CD, $0D
.db $3F, $C1, $21, $F2, $C0, $36, $10, $18, $0D, $C5, $21, $02, $01, $CD, $24, $3F
.db $C1, $21, $F2, $C0, $36, $08, $CB, $49, $28, $14, $21, $01, $01, $CD, $0D, $3F
.db $21, $F3, $C0, $36, $10, $FD, $21, $F2, $C0, $FD, $CB, $00, $26, $C9, $21, $01
.db $01, $CD, $24, $3F, $21, $F3, $C0, $36, $08, $C9, $21, $02, $00, $39, $4E, $06
.db $00, $21, $00, $C0, $09, $CF, $21, $03, $00, $39, $7E, $D3, $BE, $C9

_LABEL_3FC8_7:
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


; Data from 3FDC to 3FFF (36 bytes)
.db $11, $00, $C0, $0E, $BF, $F3, $ED, $59, $ED, $51, $FB, $06, $10, $0E, $BE, $ED
.db $A3, $20, $FC, $C9, $11, $10, $C0, $0E, $BF, $F3, $ED, $59, $ED, $51, $FB, $06
.db $10, $0E, $BE, $ED


.BANK 1 SLOT 1
.ORG $0000


; Data from 4000 to 4007 (8 bytes)
.db $A3, " ", $FC, $C9, "}", $D3, $BE, $C9

_LABEL_4008_15:
	ld   hl, $C0E9
	ld   (hl), $00
	ret


; Data from 400E to 4062 (85 bytes)
.db $3A, $E9, $C0, $D6, $40, $30, $4B, $FD, $21, $03, $00, $FD, $39, $FD, $7E, $00
.db $D6, $D1, $28, $3E, $3E, $29, $21, $E9, $C0, $86, $4F, $3E, $C0, $CE, $00, $47
.db $FD, $5E, $00, $1D, $7B, $02, $3A, $E9, $C0, $87, $4F, $21, $69, $C0, $06, $00
.db $09, $FD, $21, $02, $00, $FD, $39, $FD, $7E, $00, $77, $23, $FD, $21, $04, $00
.db $FD, $39, $FD, $7E, $00, $77, $FD, $21, $E9, $C0, $FD, $4E, $00, $FD, $34, $00
.db $69, $C9, $2E, $FF, $C9

_LABEL_4063_16:
	ld   a, ($C0E9)
	sub  $40
	ret  nc

	ld   bc, $C029
	ld   hl, ($C0E9)
	ld   h, $00
	add  hl, bc
	ld   (hl), $D0
	ret

_LABEL_4075_17:
	ld   hl, $7F00
	rst  $8
	ld   bc, $C029
	ld   e, $40
_LABEL_407E_18:
	ld   a, (bc)
	out  ($BE), a
	inc  bc
	ld   d, e
	dec  d
	ld   a, d
	ld   e, a
	or   a
	jr   nz, _LABEL_407E_18
	ld   hl, $7F80
	rst  $8
	ld   bc, $C069
	ld   e, $80
_LABEL_4092_19:
	ld   a, (bc)
	out  ($BE), a
	inc  bc
	ld   d, e
	dec  d
	ld   a, d
	ld   e, a
	or   a
	jr   nz, _LABEL_4092_19
	ret


; Data from 409E to 4107 (106 bytes)
.db $21, $21, $C0, $36, $00, $21, $21, $C0, $CB, $46, $28, $F9, $C9, $2A, $25, $C0
.db $C9, $FD, $21, $27, $C0, $FD, $7E, $00, $2F, $4F, $FD, $7E, $01, $2F, $47, $FD
.db $21, $25, $C0, $FD, $7E, $00, $A1, $6F, $FD, $7E, $01, $A0, $67, $C9, $3A, $25
.db $C0, $FD, $21, $27, $C0, $FD, $A6, $00, $6F, $3A, $26, $C0, $FD, $21, $27, $C0
.db $FD, $A6, $01, $67, $C9, $FD, $21, $25, $C0, $FD, $7E, $00, $2F, $4F, $FD, $7E
.db $01, $2F, $47, $79, $FD, $21, $27, $C0, $FD, $A6, $00, $6F, $78, $FD, $A6, $01
.db $67, $C9, $FD, $21, $23, $C0, $FD, $6E, $00, $C9

_LABEL_4108_20:
	ld   hl, $C023
	ld   (hl), $00
	ret


; Data from 410E to 4135 (40 bytes)
.db $21, $02, $00, $39, $7E, $32, $EA, $C0, $21, $03, $00, $39, $7E, $32, $EB, $C0
.db $C9, $21, $02, $00, $39, $4E, $F3, $79, $D3, $BF, $3E, $8A, $D3, $BF, $FB, $C9
.db $DB, $7E, $6F, $C9, $DB, $7F, $6F, $C9

_LABEL_4136_10:
	push af
	push hl
	in   a, ($BF)
	ld   ($C022), a
	rlca
	jr   nc, _LABEL_4159_11
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
	jr   _LABEL_4167_12

_LABEL_4159_11:
	push bc
	push de
	push iy
	ld   hl, ($C0EA)
	call _LABEL_417F_13
	pop  iy
	pop  de
	pop  bc
_LABEL_4167_12:
	pop  hl
	pop  af
	ei
	reti

_LABEL_416C_34:
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

_LABEL_417F_13:
	jp   (hl)


; Data from 4180 to 4187 (8 bytes)
.db $00, $00, $00, $00, $04, $20, $08, $08

_LABEL_4188_4:
	ld   bc, $0008
	ld   a, b
	or   c
	jr   z, _LABEL_4197_5
	ld   de, $C0EC
	ld   hl, $4180
	ldir
_LABEL_4197_5:
	ret


; Data from 4198 to 7FFF (15976 bytes)
.incbin "output.sms.dat.10"

