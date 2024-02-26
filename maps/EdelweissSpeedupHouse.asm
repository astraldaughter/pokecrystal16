	object_const_def
	const EDELWEISSGYMLEADERSPEECHHOUSE_COOLTRAINER

EdelweissSpeedupHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EdelweissSpeedupHouseCooltrainerScript:
	jumptextfaceplayer EdelweissSpeedupHouseCooltrainerText

EdelweissSpeedupHouseCooltrainerText:
	text "Everyone seems to"
	line "want to rush"
	
	para "through life"
	line "these days…"

	para "Personally, I"
	line "think it's good"

	para "to take your time"
	line "with things."
	done

EdelweissSpeedupHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, EDELWEISS_CITY, 6
	warp_event  4,  7, EDELWEISS_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EdelweissSpeedupHouseCooltrainerScript, -1