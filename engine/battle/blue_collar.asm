CalcDefenderHeldItemDefenseBonus:
; Return in hQuotient + 3 the bonus to add to the defender's damage stat.

	xor a
	ldh [hQuotient + 3], a

	push de

	ld a, MON_SPECIES
	call BattlePartyAttr
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .got_species
	ld a, [wTempEnemyMonSpecies]

.got_species
	ld d, a

	ld hl, wEnemyMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .got_item
	ld hl, wBattleMonItem

.got_item
	ld a, [hl]
	cp METAL_POWDER
	jr z, .metal_powder
	cp BLUE_COLLAR
	jr z, .blue_collar

.no_bonus
	pop de
	ret

.metal_powder
	ld a, d
	cp DITTO
	jr nz, .no_bonus
	ld a, c
	srl a
	ldh [hQuotient + 3], a
	pop de
	ret

.blue_collar
	ld a, d
	cp LITTLE
	jr nz, .no_bonus
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerMoveStructType]
	jr z, .got_move_type
	ld a, [wEnemyMoveStructType]
.got_move_type
	cp SPECIAL
	jr nc, .no_bonus

	push bc
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, 25
	ldh [hMultiplier], a
	call Multiply
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
	pop bc
	pop de
	ret

BoostLittleLazerBaseStatsIfCurPartyMon:
	ld a, [wCurPartySpecies]
	cp LITTLE
	ret nz
	push bc
	push hl
	ld hl, wPartyMon1Item
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp LAZER_COLLAR
	jr nz, .done
	call BoostLittleLazerBaseStats
.done
	pop hl
	pop bc
	ret

BoostLittleLazerBaseStatsIfTempMon:
	ld a, [wTempMonSpecies]
	cp LITTLE
	ret nz
	ld a, [wTempMonItem]
	cp LAZER_COLLAR
	ret nz

BoostLittleLazerBaseStats:
	ld hl, wBaseAttack
	call .boost_base_stat
	ld hl, wBaseDefense
	call .boost_base_stat
	ld hl, wBaseSpeed
	call .boost_base_stat
	ld hl, wBaseSpecialDefense

.boost_base_stat
	ld a, [hl]
	ld b, a
	srl a
	add b
	jr nc, .got_boosted_stat
	ld a, $ff

.got_boosted_stat
	ld [hl], a
	ret
