	object_const_def
	const ROUTE51_YOUNGSTER
	const ROUTE51_TEACHER1
	const ROUTE51_FRUIT_TREE
	const ROUTE51_FISHER
	const ROUTE51_COOLTRAINER_M2
	const ROUTE51_TUSCANY
	const ROUTE51_POKE_BALL

Route51_MapScripts:
	def_scene_scripts
	scene_script Route51Noop1Scene, SCENE_ROUTE51_NOOP
	scene_script Route51Noop2Scene, SCENE_ROUTE51_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route51TuscanyCallback

Route51Noop1Scene:
	end

Route51Noop2Scene:
	end

Route51TuscanyCallback:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE51_TUSCANY
	endcallback

.DoesTuscanyAppear:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE51_TUSCANY
	endcallback

Route51YoungsterScript:
	jumptextfaceplayer Route51YoungsterText

Route51LassScript:
	jumptextfaceplayer Route51LassText

Route51FisherScript:
	jumptextfaceplayer Route51FisherText

Route51CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route51CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route51CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route51Sign1:
	jumptext Route51Sign1Text

Route51Sign2:
	jumptext Route51Sign2Text

Route51FruitTree:
	fruittree FRUITTREE_ROUTE_51

Route51Potion:
	itemball POTION

Route51YoungsterText:
	text "Yo. How are your"
	line "#MON?"

	para "If they're weak"
	line "and not ready for"

	para "battle, keep out"
	line "of the grass."
	done

Route51LassText:
	text "It's scary to jump"
	line "off those ledges."

	para "But if you do, you"
	line "can get to NIVALE"

	para "much quicker than"
	line "taking the road."
	done

Route51FisherText:
	text "I wanted to take a"
	line "break, so I saved"

	para "to record my"
	line "progress."
	done

Route51CooltrainerMText_WaitingForDay: ; unreferenced
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "daytime."
	done

Route51CooltrainerMText_WaitingForNight:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

Route51CooltrainerMText_WaitingForMorning:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done

MeetTuscanyText:
	text "TUSCANY: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a PINK BOW."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route51Sign1Text:
	text "ROUTE 51"

	para "CAMPANULA CITY -"
	line "NEW BARK TOWN"
	done

Route51Sign2Text:
	text "ROUTE 51"

	para "CAMPANULA CITY -"
	line "NEW BARK TOWN"
	done

Route51_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 31, 15, ROUTE_51_ROUTE_53_GATE, 1
	warp_event 32, 15, ROUTE_51_ROUTE_53_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 51,  7, BGEVENT_READ, Route51Sign1
	bg_event  7,  7, BGEVENT_READ, Route51Sign2

	def_object_events
	object_event 20, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route51YoungsterScript, -1
	object_event 26, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route51LassScript, -1
	object_event 42,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route51FruitTree, -1
	object_event 27,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route51FisherScript, -1
	object_event 43,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route51CooltrainerMScript, -1
	object_event 51,  2, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_51_TUSCANY_OF_TUESDAY
	object_event 24, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route51Potion, EVENT_ROUTE_51_POTION
