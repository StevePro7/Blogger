	org 50000
	ld hl, 22528
	ld a, 12
loop:
	ld b, 16	
row1:	ld (hl), 0
	inc hl
	ld (hl), 127
	inc hl
	djnz row1
	ld b, 16
row2:	ld (hl), 127
	inc hl
	ld (hl), 0
	inc hl
	djnz row2
	dec a
	jr nz, loop
ret
