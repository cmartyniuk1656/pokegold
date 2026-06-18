	object_const_def
	const KOGASROOM_KOGA

KogasRoom_MapScripts:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_script KogasRoomNoopScene,     SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorsCallback

KogasRoomLockDoorScene:
	sdefer KogasRoomDoorLocksBehindYouScript
	end

KogasRoomNoopScene:
	end

KogasRoomDoorsCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KogasRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KogasRoom_EnterMovement
	reanchormap $85
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue KogaScript_AfterBattle
	readvar VAR_BADGES
	ifequal NUM_BADGES, .Rematch
	writetext KogaScript_KogaBeforeText
	waitbutton
	closetext
	winlosstext KogaScript_KogaBeatenText, 0
	loadtrainer KOGA, KOGA1
	sjump .StartBattle
.Rematch:
	writetext KogaScript_RematchBeforeText
	waitbutton
	closetext
	winlosstext KogaScript_RematchBeatenText, 0
	loadtrainer KOGA, KOGA2
.StartBattle:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	readvar VAR_BADGES
	ifequal NUM_BADGES, .RematchDefeat
	writetext KogaScript_KogaDefeatText
	sjump .Finish
.RematchDefeat:
	writetext KogaScript_RematchDefeatText
.Finish:
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

KogaScript_AfterBattle:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .RematchDefeat
	writetext KogaScript_KogaDefeatText
	sjump .Finish
.RematchDefeat:
	writetext KogaScript_RematchDefeatText
.Finish:
	waitbutton
	closetext
	end

KogasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KogaScript_KogaBeforeText:
	text "Fwahahahaha!"

	para "I am KOGA of the"
	line "ELITE FOUR."

	para "I live in shadows,"
	line "a ninja!"

	para "My intricate style"
	line "will confound and"
	cont "destroy you!"

	para "Confusion, sleep,"
	line "poison…"

	para "Prepare to be the"
	line "victim of my sin-"
	cont "ister technique!"

	para "That LITTLE may"
	line "look harmless..."

	para "But even a little"
	line "brat can fall to"
	cont "poison!"

	para "Fwahahahaha!"

	para "#MON is not"
	line "merely about brute"

	para "force--you shall"
	line "see soon enough!"
	done

KogaScript_KogaBeatenText:
	text "Ah!"
	line "You have proven"
	cont "your worth!"
	done

KogaScript_KogaDefeatText:
	text "I subjected you to"
	line "everything I could"
	cont "muster."

	para "But you and LITTLE"
	line "endured my"
	cont "techniques."

	para "My efforts failed."
	line "I must hone my"
	cont "skills."

	para "Go on to the next"
	line "room, and put your"
	cont "abilities to test!"
	done

KogaScript_RematchBeforeText:
	text "Fwahahahaha!"

	para "You return with"
	line "all 16 BADGES."

	para "A trainer who has"
	line "crossed two lands"
	cont "is no easy prey."

	para "Since our last"
	line "battle, I have"

	para "sharpened every"
	line "technique."

	para "My poisons creep"
	line "deeper."

	para "My shadows move"
	line "faster."

	para "Even CHRIS the"
	line "greatest trainer"

	para "of all time would"
	line "respect the art"
	cont "of a true ninja!"

	para "Now, <PLAYER>..."

	para "Let us see if you"
	line "can escape my"
	cont "web once more!"
	done

KogaScript_RematchBeatenText:
	text "Ah!"
	line "Even my finest"
	cont "arts failed!"
	done

KogaScript_RematchDefeatText:
	text "You pierced every"
	line "shadow I cast."

	para "Your LITTLE moved"
	line "through my traps"
	cont "with sharp senses."

	para "A ninja must never"
	line "stop improving."

	para "I will vanish,"
	line "train, and return"
	cont "stronger."

	para "Go on."

	para "The next battle"
	line "will test you in"
	cont "a different way."
	done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KogaScript_Battle, -1
