OakPhoneCallerScript:
	readvar VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_OAK_MT_SILVER, .MtSilver
	writetext OakCallAfter16BadgesText
	specialphonecall SPECIALCALL_NONE
	end

.MtSilver:
	writetext OakCallMtSilverUnlockedText
	specialphonecall SPECIALCALL_NONE
	end

OakCallAfter16BadgesText:
	text "Hello, <PLAYER>?"
	line "This is PROF.OAK!"

	para "I heard the news!"
	line "You collected all"
	cont "16 BADGES!"

	para "That is a truly"
	line "remarkable"
	cont "achievement!"

	para "And your LITTLE"
	line "has been with you"
	cont "through it all."

	para "A bond like that"
	line "is what makes a"
	cont "great trainer."

	para "But your journey"
	line "is not over yet."

	para "The ELITE FOUR"
	line "have been training"
	cont "for a rematch."

	para "Return to INDIGO"
	line "PLATEAU and face"
	cont "them again!"

	para "I will be waiting"
	line "to see how far"
	cont "you have grown!"
	done

OakCallMtSilverUnlockedText:
	text "Hello, <PLAYER>?"
	line "This is PROF.OAK!"

	para "I heard you won"
	line "your rematch at"
	cont "the #MON LEAGUE!"

	para "That proves it."
	line "You are ready."

	para "I have arranged"
	line "for you to enter"
	cont "MT.SILVER."

	para "It is a dangerous"
	line "mountain beyond"
	cont "INDIGO PLATEAU."

	para "Only exceptional"
	line "trainers may go"
	cont "there."

	para "Head through the"
	line "gate near the"
	cont "#MON LEAGUE."

	para "Be careful."
	line "And good luck!"
	done
