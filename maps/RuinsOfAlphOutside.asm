	object_const_def


RuinsOfAlphOutside_MapScripts:
	def_scene_scripts


	def_callbacks

RuinsVisitorCentreSignScript:
	jumptext RuinsVisitorCentreSignText

RuinsVisitorCentreSignText:
	text "EDELWEISS RUINS"
	line "VISITORS' CENTER"
	done

RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 11, 13, BGEVENT_READ, RuinsVisitorCentreSignScript

	def_object_events
