	object_const_def

EdelweissRuins1F_MapScripts:
	def_scene_scripts

	def_callbacks

EdelweissRuins1FStatue:
	jumptext EdelweissRuins1FStatueText

EdelweissRuins1FStatueText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

EdelweissRuins1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  17, EDELWEISS_RUINS_OUTSIDE, 1
	warp_event  3,  17, EDELWEISS_RUINS_OUTSIDE, 1
	warp_event  3,   2, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  1,  3, BGEVENT_READ, EdelweissRuins1FStatue
	bg_event  4,  3, BGEVENT_READ, EdelweissRuins1FStatue
	bg_event  1, 15, BGEVENT_READ, EdelweissRuins1FStatue
	bg_event  4, 15, BGEVENT_READ, EdelweissRuins1FStatue

	def_object_events