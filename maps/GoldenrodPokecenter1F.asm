	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_FISHER
	const GOLDENRODPOKECENTER1F_TWIN
	const GOLDENRODPOKECENTER1F_OAKS_AIDE

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, GoldenrodPokecenter1FOaksAideCallback

GoldenrodPokecenter1FOaksAideCallback:
	checkevent EVENT_GOT_BLUE_COLLAR_FROM_OAKS_AIDE
	iftrue .Disappear
	checkevent EVENT_OAK_CALLED_ABOUT_BLUE_COLLAR
	iftrue .Appear
.Disappear:
	disappear GOLDENRODPOKECENTER1F_OAKS_AIDE
	endcallback

.Appear:
	appear GOLDENRODPOKECENTER1F_OAKS_AIDE
	endcallback

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1FGameboyKidScript:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FGameboyKidText
	waitbutton
	closetext
	turnobject GOLDENRODPOKECENTER1F_GAMEBOY_KID, DOWN
	end

GoldenrodPokecenter1FPersonScript:
	jumptextfaceplayer GoldenrodPokecenter1FPersonText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FOaksAideScript:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FOaksAideIntroText
	promptbutton
	verbosegiveitem BLUE_COLLAR
	iffalse .BagFull
	setevent EVENT_GOT_BLUE_COLLAR_FROM_OAKS_AIDE
	writetext GoldenrodPokecenter1FOaksAideBlueCollarText
	waitbutton
	closetext
	disappear GOLDENRODPOKECENTER1F_OAKS_AIDE
	end

.BagFull:
	writetext GoldenrodPokecenter1FOaksAideBagFullText
	waitbutton
	closetext
	end

GoldenrodPokecenter1FGameboyKidText:
	text "The COLOSSEUM--"
	line "upstairs at any"

	para "#MON CENTER--is"
	line "for link battles."

	para "Battle records are"
	line "posted on the"

	para "wall, so I can't"
	line "afford to lose."
	done

GoldenrodPokecenter1FPersonText:
	text "I wonder how many"
	line "kinds of #MON"

	para "there are in the"
	line "world."

	para "Three years ago,"
	line "PROF.OAK said that"

	para "there were 150"
	line "different kinds."
	done

GoldenrodPokecenter1FLassText:
	text "A higher level"
	line "#MON doesn't"
	cont "always win."

	para "After all, it may"
	line "have a type dis-"
	cont "advantage."

	para "I don't think"
	line "there is a single"

	para "#MON that is"
	line "the toughest."
	done

GoldenrodPokecenter1FOaksAideIntroText:
	text "<PLAYER>?"
	line "PROF.OAK asked me"
	cont "to find you."

	para "He wanted you to"
	line "have this for"
	cont "your LITTLE."
	done

GoldenrodPokecenter1FOaksAideBlueCollarText:
	text "That BLUE COLLAR"
	line "only works on"
	cont "LITTLE."

	para "When LITTLE holds"
	line "it, evolution is"
	cont "prevented."

	para "It also raises"
	line "LITTLE's DEFENSE."

	para "PROF.OAK measured"
	line "the boost at about"
	cont "25 percent."
	done

GoldenrodPokecenter1FOaksAideBagFullText:
	text "Your BAG is full."

	para "Please make room"
	line "and come see me."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 7
	warp_event  4,  7, GOLDENROD_CITY, 7
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPersonScript, -1
	object_event  0,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FOaksAideScript, EVENT_OAKS_AIDE_IN_GOLDENROD_POKEMON_CENTER
