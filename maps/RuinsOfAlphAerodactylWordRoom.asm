	object_const_def
	const EDELWEISS_RUINS_B1F_YOUNGSTER

RuinsOfAlphAerodactylWordRoom_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSchoolboyJack:
	trainer SCHOOLBOY, JACK, EVENT_BEAT_SCHOOLBOY_JACK, SchoolboyJackSeenText, SchoolboyJackBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJackAfterText
	waitbutton
	closetext
	end

EdelweissRuinsB1FStatue:
	jumptext EdelweissRuins1FStatueText

EdelweissRuinsB1FStatueText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

SchoolboyJackSeenText:
	text "I came to explore"
	line "the RUINS with"

	para "some friends, but"
	line "we got separated…"
	done

SchoolboyJackBeatenText:
	text "I wanna go home…"
	done

SchoolboyJackAfterText:
	text "I think I'll stay"
	line "here and wait for"

	para "my friends to find"
	line "me."
	done

RuinsOfAlphAerodactylWordRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  2, EDELWEISS_RUINS_1F, 3

	def_coord_events

	def_bg_events
	bg_event  4,  7, BGEVENT_READ, EdelweissRuinsB1FStatue
	bg_event  9,  7, BGEVENT_READ, EdelweissRuinsB1FStatue

	def_object_events
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyJack, -1
