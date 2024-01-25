	object_const_def
	const EDELWEISSGYMLEADERSPEECHHOUSE_TEACHER

EdelweissGymLeaderSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EdelweissGymLeaderSpeechHouseTeacherScript:
	jumptextfaceplayer EdelweissGymLeaderSpeechHouseTeacherText

EdelweissGymLeaderSpeechHouseTeacherText:
	text "The GYM LEADER"
	line "here, DOUGLAS,"
	
	para "is a renowned"
	line "archaeologist."

	para "He might be a"
	line "little TOO into"
	cont "it, though…"

	para "He often leaves"
	line "his GYM for days"
	cont "at a time…"
	done

EdelweissGymLeaderSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, EDELWEISS_CITY, 3
	warp_event  4,  7, EDELWEISS_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EdelweissGymLeaderSpeechHouseTeacherScript, -1