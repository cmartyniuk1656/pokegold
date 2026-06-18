CanLearnTMHMMove:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBaseTMHM
	push hl

	ld a, [wPutativeTMHMMove]
	ld b, a
	ld c, 0
	ld hl, TMHMMoves
.loop
	ld a, [hli]
	and a
	jr z, .end
	cp b
	jr z, .found
	inc c
	jr .loop

.found
	pop hl
	ld b, CHECK_FLAG
	push de
	ld d, 0
	predef SmallFarFlagAction
	pop de
	ret

.end
	pop hl
	ld c, 0
	ret

GetTMHMMove:
	ld a, [wTempTMHM]
	dec a
	ld hl, TMHMMoves
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTempTMHM], a
	ret

GetTMHMItemMoveName::
	ld a, [wCurItem]
	cp ITEM_C3
	jr c, .got_item_number
	cp ITEM_DC
	jr c, .skip
	dec a
.skip
	dec a
.got_item_number
	sub TM01
	ld c, a
	ld hl, TMHMMoves
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetMoveName
	ret

INCLUDE "data/moves/tmhm_moves.asm"
