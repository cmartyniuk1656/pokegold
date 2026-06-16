CalcLevel:
	ld a, [wTempMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld d, 1
.next_level
	inc d
	ld a, d
	cp LOW(MAX_LEVEL + 1)
	jr z, .got_level
	call CalcExpAtLevel
	push hl
	ld hl, wTempMonExp + 2
	ldh a, [hProduct + 3]
	ld c, a
	ld a, [hld]
	sub c
	ldh a, [hProduct + 2]
	ld c, a
	ld a, [hld]
	sbc c
	ldh a, [hProduct + 1]
	ld c, a
	ld a, [hl]
	sbc c
	pop hl
	jr nc, .next_level

.got_level
	dec d
	ret

GetCurrentLevelCap:
	push bc
	push hl
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	ld c, a
	ld b, 0
	ld hl, LevelCapsByBadgeCount
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret

IsPartyMonAtLevelCap:
	call GetCurrentLevelCap
	ld d, a
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp d
	jr c, .below_cap
	scf
	ret

.below_cap
	and a
	ret

CapPartyMonExpAtLevelCap:
	push bc
	call GetCurrentLevelCap
	ld d, a
	call CalcExpAtLevel
	pop bc
	ld hl, MON_EXP + 2
	add hl, bc
	jr CapExpAtHLToMultiplicand

CapTempMonExpAtLevelCap:
	call GetCurrentLevelCap
	ld d, a
	call CalcExpAtLevel
	ld hl, wTempMonExp + 2

CapExpAtHLToMultiplicand:
	ldh a, [hMultiplicand + 2]
	ld d, a
	ldh a, [hMultiplicand + 1]
	ld e, a
	ldh a, [hMultiplicand]
	ld b, a
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc e
	ld a, [hl]
	sbc b
	ret c
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ret

LevelCapsByBadgeCount:
	db 12        ; 0 badges
	db 16        ; 1 badge
	db 20        ; 2 badges
	db 25        ; 3 badges
	db 30        ; 4 badges
	db 35        ; 5 badges
	db 40        ; 6 badges
	db 45        ; 7 badges
	db 50        ; 8 badges
	db 55        ; 9 badges
	db 60        ; 10 badges
	db 65        ; 11 badges
	db 70        ; 12 badges
	db 75        ; 13 badges
	db 80        ; 14 badges
	db 85        ; 15 badges
	db MAX_LEVEL ; 16 badges

CalcExpAtLevel:
; (a/b)*n**3 + c*n**2 + d*n - e
; BUG: Experience underflow for level 1 Pokémon with Medium-Slow growth rate (see docs/bugs_and_glitches.md)
	ld a, [wBaseGrowthRate]
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, GrowthRates
	add hl, bc
; Cube the level
	call .LevelSquared
	ld a, d
	ldh [hMultiplier], a
	call Multiply

; Multiply by a
	ld a, [hl]
	and $f0
	swap a
	ldh [hMultiplier], a
	call Multiply
; Divide by b
	ld a, [hli]
	and $f
	ldh [hDivisor], a
	ld b, 4
	call Divide
; Push the cubic term to the stack
	ldh a, [hQuotient + 1]
	push af
	ldh a, [hQuotient + 2]
	push af
	ldh a, [hQuotient + 3]
	push af
; Square the level and multiply by the lower 7 bits of c
	call .LevelSquared
	ld a, [hl]
	and $7f
	ldh [hMultiplier], a
	call Multiply
; Push the absolute value of the quadratic term to the stack
	ldh a, [hProduct + 1]
	push af
	ldh a, [hProduct + 2]
	push af
	ldh a, [hProduct + 3]
	push af
	ld a, [hli]
	push af
; Multiply the level by d
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, d
	ldh [hMultiplicand + 2], a
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
; Subtract e
	ld b, [hl]
	ldh a, [hProduct + 3]
	sub b
	ldh [hMultiplicand + 2], a
	ld b, 0
	ldh a, [hProduct + 2]
	sbc b
	ldh [hMultiplicand + 1], a
	ldh a, [hProduct + 1]
	sbc b
	ldh [hMultiplicand], a
; If bit 7 of c is set, c is negative; otherwise, it's positive
	pop af
	and $80
	jr nz, .subtract
; Add c*n**2 to (d*n - e)
	pop bc
	ldh a, [hProduct + 3]
	add b
	ldh [hMultiplicand + 2], a
	pop bc
	ldh a, [hProduct + 2]
	adc b
	ldh [hMultiplicand + 1], a
	pop bc
	ldh a, [hProduct + 1]
	adc b
	ldh [hMultiplicand], a
	jr .done_quadratic

.subtract
; Subtract c*n**2 from (d*n - e)
	pop bc
	ldh a, [hProduct + 3]
	sub b
	ldh [hMultiplicand + 2], a
	pop bc
	ldh a, [hProduct + 2]
	sbc b
	ldh [hMultiplicand + 1], a
	pop bc
	ldh a, [hProduct + 1]
	sbc b
	ldh [hMultiplicand], a

.done_quadratic
; Add (a/b)*n**3 to (d*n - e +/- c*n**2)
	pop bc
	ldh a, [hProduct + 3]
	add b
	ldh [hMultiplicand + 2], a
	pop bc
	ldh a, [hProduct + 2]
	adc b
	ldh [hMultiplicand + 1], a
	pop bc
	ldh a, [hProduct + 1]
	adc b
	ldh [hMultiplicand], a
	ret

.LevelSquared:
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, d
	ldh [hMultiplicand + 2], a
	ldh [hMultiplier], a
	jp Multiply

INCLUDE "data/growth_rates.asm"
