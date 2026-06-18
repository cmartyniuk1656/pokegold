	object_const_def
	const KARENSROOM_KAREN

KarensRoom_MapScripts:
	def_scene_scripts
	scene_script KarensRoomLockDoorScene, SCENE_KARENSROOM_LOCK_DOOR
	scene_script KarensRoomNoopScene,     SCENE_KARENSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KarensRoomDoorsCallback

KarensRoomLockDoorScene:
	sdefer KarensRoomDoorLocksBehindYouScript
	end

KarensRoomNoopScene:
	end

KarensRoomDoorsCallback:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KarensRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KarensRoom_EnterMovement
	reanchormap $85
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_KARENSROOM_NOOP
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarenScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue KarenScript_AfterBattle
	readvar VAR_BADGES
	ifequal NUM_BADGES, .Rematch
	writetext KarenScript_KarenBeforeText
	waitbutton
	closetext
	winlosstext KarenScript_KarenBeatenText, 0
	loadtrainer KAREN, KAREN1
	sjump .StartBattle
.Rematch:
	writetext KarenScript_RematchBeforeText
	waitbutton
	closetext
	winlosstext KarenScript_RematchBeatenText, 0
	loadtrainer KAREN, KAREN2
.StartBattle:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opentext
	readvar VAR_BADGES
	ifequal NUM_BADGES, .RematchDefeat
	writetext KarenScript_KarenDefeatText
	sjump .Finish
.RematchDefeat:
	writetext KarenScript_RematchDefeatText
.Finish:
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

KarenScript_AfterBattle:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .RematchDefeat
	writetext KarenScript_KarenDefeatText
	sjump .Finish
.RematchDefeat:
	writetext KarenScript_RematchDefeatText
.Finish:
	waitbutton
	closetext
	end

KarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenScript_KarenBeforeText:
	text "I am KAREN of the"
	line "ELITE FOUR."

	para "You're <PLAYER>?"
	line "How amusing."

	para "I love dark-type"
	line "#MON."

	para "I find their wild,"
	line "tough image to be"

	para "so appealing. And"
	line "they're so strong."

	para "That LITTLE of"
	line "yours..."

	para "Cute, certainly."

	para "But I can tell"
	line "there is mischief"
	cont "behind those eyes."

	para "Think you can take"
	line "my #MON? Just try"
	cont "entertain me."

	para "Let's go."
	done

KarenScript_KarenBeatenText:
	text "Well, aren't you"
	line "good. I like that"
	cont "in a trainer."
	done

KarenScript_KarenDefeatText:
	text "Strong #MON."

	para "Weak #MON."

	para "That is only the"
	line "selfish perception"
	cont "of people."

	para "Truly skilled"
	line "trainers should"

	para "try to win with"
	line "their favorites."

	para "You and LITTLE"
	line "understand that"
	cont "very well."

	para "I like your style."
	line "You understand"
	cont "what's important."

	para "Go on--the CHAM-"
	line "PION is waiting."
	done

KarenScript_RematchBeforeText:
	text "Welcome back,"
	line "<PLAYER>."

	para "All 16 BADGES..."
	line "How impressive."

	para "You have crossed"
	line "two regions and"

	para "still battle with"
	line "your favorite."

	para "That is rare."

	para "Many trainers"
	line "chase power and"
	cont "forget style."

	para "But you and LITTLE"
	line "still have both."

	para "Even CHRIS the"
	line "greatest trainer"

	para "of all time would"
	line "understand that."

	para "Now then..."

	para "Show me how much"
	line "your favorites"
	cont "have grown."

	para "Let's go."
	done

KarenScript_RematchBeatenText:
	text "Well done."

	para "You really do know"
	line "how to make a"
	cont "battle exciting."
	done

KarenScript_RematchDefeatText:
	text "Strong #MON."

	para "Weak #MON."

	para "Those words still"
	line "miss the point."

	para "What matters is"
	line "how a trainer"
	cont "chooses to battle."

	para "You and LITTLE"
	line "battle with trust,"
	cont "style, and nerve."

	para "I like that."

	para "Go on."

	para "The CHAMPION is"
	line "waiting again."
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenScript_Battle, -1
