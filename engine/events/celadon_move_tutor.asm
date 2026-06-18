DEF CELADON_MOVE_TUTOR_PRICE EQU 7500

CeladonMoveTutor:
	ld hl, .IntroText
	call PrintText
	call YesNoBox
	jp c, .cancel

.loop
	ld hl, .AskMoveText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	push af
	call CloseWindow
	pop af
	jp c, .cancel

	ld a, [wMenuCursorY]
	cp 4
	jp z, .cancel
	dec a
	ld e, a
	ld d, 0
	ld hl, .Moves
	add hl, de
	ld a, [hl]
	ld [wPutativeTMHMMove], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyName1

	call .CheckFunds
	jr nc, .have_money
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	ld hl, .NotEnoughMoneyText
	call PrintText
	jp .cancel

.have_money
	ld hl, .AskMonText
	call PrintText
	farcall SelectMonForTutorMove
	jp c, .cancel
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname

	call CanLearnCeladonTutorMove
	ld a, c
	and a
	jr nz, .compatible
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	ld hl, .NotCompatibleText
	call PrintText
	jr .again

.compatible
	callfar KnowsMove
	jr c, .again
	predef LearnMove
	ld a, b
	and a
	jr z, .again
	call .TakePayment
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	ld hl, .PaymentText
	call PrintText

.again
	ld hl, .TeachAnotherText
	call PrintText
	call YesNoBox
	jp nc, .loop
	jp .cancel

.egg
	ld hl, .EggText
	call PrintText
	jr .again

.cancel
	ld hl, .ComeAgainText
	call PrintText
	ret

.CheckFunds:
	call .LoadPrice
	ld de, wMoney
	ld bc, hMoneyTemp
	farcall CompareMoney
	ret

.TakePayment:
	call .LoadPrice
	ld de, wMoney
	ld bc, hMoneyTemp
	farcall TakeMoney
	ret

.LoadPrice:
	ld a, LOW(CELADON_MOVE_TUTOR_PRICE >> 16)
	ldh [hMoneyTemp], a
	ld a, HIGH(CELADON_MOVE_TUTOR_PRICE)
	ldh [hMoneyTemp + 1], a
	ld a, LOW(CELADON_MOVE_TUTOR_PRICE)
	ldh [hMoneyTemp + 2], a
	ret

.Moves:
	db FLAMETHROWER
	db ICE_BEAM
	db THUNDERBOLT

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FLAMETHROWER@"
	db "ICE BEAM@"
	db "THUNDERBOLT@"
	db "CANCEL@"

.IntroText:
	text "Hey, I'm the"
	line "move tutor."

	para "Do you want me"
	line "to teach your"
	cont "#MON some moves?"

	para "It costs ¥{d:CELADON_MOVE_TUTOR_PRICE}"
	line "for each move."
	done

.AskMoveText:
	text "Which move should"
	line "I teach?"
	done

.AskMonText:
	text "Which #MON should"
	line "learn @"
	text_ram wStringBuffer2
	text "?"
	done

.NotCompatibleText:
	text_ram wStringBuffer1
	text " can't"
	line "learn @"
	text_ram wStringBuffer2
	text "."
	done

.NotEnoughMoneyText:
	text "You'll need"
	line "¥{d:CELADON_MOVE_TUTOR_PRICE} for that."
	done

.PaymentText:
	text "That will be"
	line "¥{d:CELADON_MOVE_TUTOR_PRICE}."
	done

.EggText:
	text "An EGG can't learn"
	line "moves."
	done

.TeachAnotherText:
	text "Teach another"
	line "move?"
	done

.ComeAgainText:
	text "Come back anytime."
	done

CanLearnCeladonTutorMove:
	ld a, [wPutativeTMHMMove]
	ld e, 1
	cp FLAMETHROWER
	jr z, .got_mask
	ld e, 2
	cp ICE_BEAM
	jr z, .got_mask
	ld e, 4
	cp THUNDERBOLT
	jr z, .got_mask
	ld c, 0
	ret

.got_mask
	ld a, [wCurPartySpecies]
	dec a
	ld hl, CeladonTutorCompatibility
	ld c, a
	ld b, 0
	add hl, bc
	ld a, BANK(CeladonTutorCompatibility)
	call GetFarByte
	and e
	jr z, .not_compatible
	ld c, 1
	ret

.not_compatible
	ld c, 0
	ret

INCLUDE "data/pokemon/celadon_tutor_compatibility.asm"
