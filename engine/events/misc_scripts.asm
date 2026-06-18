Script_AbortBugContest:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iffalse .finish
	setflag ENGINE_DAILY_BUG_CONTEST
	special ContestReturnMons
.finish
	end

FindItemInBallScript::
	callasm .TryReceiveItem
	iffalse .no_room
	ifequal 2, .found_tmhm
	disappear LAST_TALKED
	opentext
	writetext .FoundItemText
	playsound SFX_ITEM
	pause 60
	itemnotify
	closetext
	end

.found_tmhm
	disappear LAST_TALKED
	opentext
	callasm .GetTMHMMoveName
	writetext .FoundTMHMItemText
	playsound SFX_ITEM
	pause 60
	itemnotify
	closetext
	end

.no_room
	opentext
	writetext .FoundItemText
	waitbutton
	writetext .CantCarryItemText
	waitbutton
	closetext
	end

.FoundItemText:
	text_far _FoundItemText
	text_end

.FoundTMHMItemText:
	text_far _FoundTMHMItemText
	text_end

.CantCarryItemText:
	text_far _CantCarryItemText
	text_end

.TryReceiveItem:
	xor a
	ld [wScriptVar], a
	ld a, [wItemBallItemID]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wStringBuffer3
	call CopyName2
	ld a, [wItemBallItemID]
	ld [wCurItem], a
	ld a, [wItemBallQuantity]
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	ret nc
	call .CheckTMHM
	jr c, .received_tmhm
	ld a, $1
	ld [wScriptVar], a
	ret

.received_tmhm
	ld a, $2
	ld [wScriptVar], a
	ret

.CheckTMHM:
	farcall CheckItemPocket
	ld a, [wItemAttributeValue]
	cp TM_HM
	jr nz, .not_tmhm
	scf
	ret

.not_tmhm
	and a
	ret

.GetTMHMMoveName:
	ld a, [wItemBallItemID]
	ld [wCurItem], a
	farcall GetTMHMItemMoveName
	ret
