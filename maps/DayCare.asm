	object_const_def
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY
	const DAYCARE_LITTLE_BREEDING_TIP

DayCare_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, DayCareEggCheckCallback

DayCareEggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

DayCareManScript_Inside:
	faceplayer
	opentext
	special DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd DifficultBookshelfScript

DayCareLittleBreedingTipScript:
	jumptextfaceplayer DayCareLittleBreedingTipText

Text_GrampsLookingForYou:
	text "Gramps was looking"
	line "for you."
	done

DayCareLittleBreedingTipText:
	text "Hey! Did you"
	line "know LITTLE can"
	cont "only be male?"

	para "That means the"
	line "only way to breed"
	cont "one is with DITTO."

	para "You can breed"
	line "really powerful"
	cont "LITTLE this way."

	para "He gets EGG"
	line "moves from his"
	cont "evolutions."

	para "These are all"
	line "the EGG moves"
	cont "he can inherit:"

	para "SPORE, RECOVER,"
	line "BATON PASS,"
	cont "GROWTH."

	para "THUNDER WAVE,"
	line "SPIKES,"
	cont "HYDRO PUMP."

	para "ICE BEAM,"
	line "FLAMETHROWER,"
	cont "DRAGONBREATH."

	para "CRUNCH,"
	line "MEAN LOOK,"
	cont "DREAM EATER."

	para "EARTHQUAKE,"
	line "BELLY DRUM."

	para "I saw some DITTO"
	line "in the grass"
	cont "right beside the"
	cont "DAY-CARE."
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  5, ROUTE_34, 3
	warp_event  0,  6, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, DayCareBookshelf
	bg_event  1,  1, BGEVENT_READ, DayCareBookshelf

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DayCareLittleBreedingTipScript, -1
