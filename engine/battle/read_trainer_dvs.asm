GetTrainerDVs:
; Return the DVs of wOtherTrainerClass in bc

	push hl

	ld a, [wOtherTrainerClass]
	cp WILL
	jr z, .will
	cp KOGA
	jr z, .koga
	cp BRUNO
	jr z, .bruno
	cp KAREN
	jr z, .karen
	cp CHAMPION
	jr z, .champion
	cp RED
	jr z, .red
	cp BLUE
	jr z, .blue
	jr .class_dvs

.will
	ld a, [wOtherTrainerID]
	cp WILL2
	jr z, .max_dvs
	jr .class_dvs

.koga
	ld a, [wOtherTrainerID]
	cp KOGA2
	jr z, .max_dvs
	jr .class_dvs

.bruno
	ld a, [wOtherTrainerID]
	cp BRUNO2
	jr z, .max_dvs
	jr .class_dvs

.karen
	ld a, [wOtherTrainerID]
	cp KAREN2
	jr z, .max_dvs
	jr .class_dvs

.champion
	ld a, [wOtherTrainerID]
	cp LANCE2
	jr z, .max_dvs
	jr .class_dvs

.red
	ld a, [wOtherTrainerID]
	cp RED1
	jr z, .max_dvs
	jr .class_dvs

.blue
	ld a, [wOtherTrainerID]
	cp BLUE1
	jr z, .max_dvs
	jr .class_dvs

.max_dvs
	ld bc, $ffff
	pop hl
	ret

.class_dvs
	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0

	ld hl, TrainerClassDVs
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld b, a
	ld c, [hl]

	pop hl
	ret

INCLUDE "data/trainers/dvs.asm"
