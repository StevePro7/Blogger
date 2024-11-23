;=================================================================================
; RAM
;=================================================================================

.ramsection "FM type" slot 3

FMType	           db		    ; 0 = PSG only, 1 = FM only, 2 = both

.ends


;=================================================================================
; Detect FM
;=================================================================================

; Expects I/O control information left by BIOS in $C000.
; Expects region information in a variable called Region: 1 = export, 0 = Japan
; Results: 0 = only psg, 1 = only FM, 2 = both

.section "detect FM" free

DetectFM:

    ld a, ($C000)
    or $04                          ; disable I/O chip
    out ($3E), a

    ld bc, $0000                    ; reset counters

-:  ld a, b
    out ($F2), a                    ; output to the audio control port

    in a, ($F2)                     ; read back
    and %00000011                   ; mask to bits 0-1 only
    cp b                            ; check what is read is the same as what was written
    jr nz, +

    inc c                           ; c = # of times the result is the same

+:  inc b                           ; increase counter
    bit 2, b                        ; repeated four times?
    jr z, -                         ; no? then repeat again

    ld a, ($C000)
    out ($3E), a                    ; turn I/O chip back on
    
    srl c                           ; 4 --> 2; 3, 2 --> 1; 0, 1 --> 0
    ld a, c
    bit 0, c                        ; check if PSG+FM (Japanese SMS) or PSG only
    jr z, +                         ; yes? then transfer value directly

    ld a, (Region)                  ; else check region: if Region = 1 (Export)
    add a, c                        ; then 1 --> 2 (3rd party FM board), else 1 stays 1 unchanged (Mark III + FM unit)

+:  ld (FMType), a                  ; store FM type

    ret

.ends