	object_const_def
	const SILVERCAVEROOM3_RED

SilverCaveRoom3_MapScripts:
	def_scene_scripts

	def_callbacks

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext RedSeenText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext RedLeavesText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
	pause 15
	special FadeInFromBlack
	pause 30
	special HealParty
	reanchormap
	credits
	end

RedSeenText:
	text "You finally caught"
	line "up..."

	para "I've been all"
	line "around the world"
	cont "with LITTLE,"

	para "beating down"
	line "punks and brats"
	cont "just like you."

	para "Prepare yourself."

	para "It's time you"
	line "learned why me"
	cont "and LITTLE are"

	para "the greatest and"
	line "most powerful"
	cont "beings this world"
	cont "has ever known."

	para "Your days of"
	line "messing around"
	cont "are over."
	done

RedWinLossText:
	text "LITTLE..."
	done

RedLeavesText:
	text "They were right"
	line "about you..."

	para "All this time..."
	line "you weren't"
	cont "messing around..."

	para "Well done,"
	line "<PLAYER>."
	done

SilverCaveRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
