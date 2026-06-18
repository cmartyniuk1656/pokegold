	object_const_def
	const BRUNOSROOM_BRUNO

BrunosRoom_MapScripts:
	def_scene_scripts
	scene_script BrunosRoomLockDoorScene, SCENE_BRUNOSROOM_LOCK_DOOR
	scene_script BrunosRoomNoopScene,     SCENE_BRUNOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, BrunosRoomDoorsCallback

BrunosRoomLockDoorScene:
	sdefer BrunosRoomDoorLocksBehindYouScript
	end

BrunosRoomNoopScene:
	end

BrunosRoomDoorsCallback:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

BrunosRoomDoorLocksBehindYouScript:
	applymovement PLAYER, BrunosRoom_EnterMovement
	reanchormap $85
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_BRUNOSROOM_NOOP
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoScript_AfterBattle
	readvar VAR_BADGES
	ifequal NUM_BADGES, .Rematch
	writetext BrunoScript_BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	loadtrainer BRUNO, BRUNO1
	sjump .StartBattle
.Rematch:
	writetext BrunoScript_RematchBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_RematchBeatenText, 0
	loadtrainer BRUNO, BRUNO2
.StartBattle:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	readvar VAR_BADGES
	ifequal NUM_BADGES, .RematchDefeat
	writetext BrunoScript_BrunoDefeatText
	sjump .Finish
.RematchDefeat:
	writetext BrunoScript_RematchDefeatText
.Finish:
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .RematchDefeat
	writetext BrunoScript_BrunoDefeatText
	sjump .Finish
.RematchDefeat:
	writetext BrunoScript_RematchDefeatText
.Finish:
	waitbutton
	closetext
	end

BrunosRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoScript_BrunoBeforeText:
	text "I am BRUNO of the"
	line "ELITE FOUR."

	para "I always train to"
	line "the extreme be-"

	para "cause I believe in"
	line "our potential."

	para "That is how we"
	line "became strong."

	para "Can you withstand"
	line "our power?"

	para "Hm? I see no fear"
	line "in you. You look"

	para "determined. Per-"
	line "fect for battle!"

	para "Your LITTLE is"
	line "small, but its"
	cont "stance is firm."

	para "Good."

	para "Ready, <PLAYER>?"
	line "You will bow down"

	para "to our overwhelm-"
	line "ing power!"

	para "Hoo hah!"
	done

BrunoScript_BrunoBeatenText:
	text "Why? How could we"
	line "lose?"
	done

BrunoScript_BrunoDefeatText:
	text "Having lost, I"
	line "have no right to"
	cont "say anything…"

	para "You and LITTLE"
	line "proved your"
	cont "strength."

	para "Go face your next"
	line "challenge!"
	done

BrunoScript_RematchBeforeText:
	text "I am BRUNO of the"
	line "ELITE FOUR."

	para "You return with"
	line "all 16 BADGES."

	para "Good."

	para "A trainer only"
	line "reaches that point"

	para "through discipline"
	line "and focus."

	para "Since our battle,"
	line "I have trained"
	cont "without rest."

	para "My body is harder."
	line "My spirit is"
	cont "sharper."

	para "Even CHRIS the"
	line "greatest trainer"

	para "of all time would"
	line "respect such"
	cont "devotion."

	para "Now show me your"
	line "full power!"

	para "Hoo hah!"
	done

BrunoScript_RematchBeatenText:
	text "Why? Even after"
	line "all my training?"
	done

BrunoScript_RematchDefeatText:
	text "I understand."

	para "Power is not only"
	line "muscle."

	para "You and LITTLE"
	line "fight as one."

	para "That is why you"
	line "broke through our"
	cont "strength."

	para "I will train more."

	para "Go. Your next"
	line "challenge awaits!"
	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BrunoScript_Battle, -1
