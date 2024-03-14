	object_const_def


EdelweissRuinsOutside_MapScripts:
	def_scene_scripts


	def_callbacks

RuinsVisitorCentreSignScript:
	jumptext RuinsVisitorCentreSignText

RuinsVisitorCentreSignText:
	text "EDELWEISS RUINS"
	line "VISITORS' CENTER"
	done

EdelweissRuinsOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  10,  3, EDELWEISS_RUINS_1F, 1

	def_coord_events

	def_bg_events
	bg_event 11, 13, BGEVENT_READ, RuinsVisitorCentreSignScript

	def_object_events
