;==============================================================
; Region detector
; Returns a=0 for Japanese, 1 for export
; Based on code found in many Sega games (eg. Super Tennis)
;==============================================================

.section "Region Detection" free

DetectRegion:
                             
    ld a, %11110101                 ; Output 1s on both TH lines
    out ($3f), a
    in a, ($dd)
    and %11000000                   ; See what the TH inputs are
    cp %11000000                    ; If the input does not match the output then it's a Japanese system
    jp nz, _IsJap

    ld a, %01010101                 ; Output 0s on both TH lines
    out ($3f), a
    in a, ($dd)
    and %11000000                   ; See what the TH inputs are
    jp nz, _IsJap                   ; If the input does not match the output then it's a Japanese system

    ld a, %11111111                 ; Set everything back to being inputs
    out ($3f), a

    ld a, 1
    ret

_IsJap:

    ld a, 0
    ret
    
.ends