	object_const_def
	const CAMPANULAGYMSPEECHHOUSE_POKEFAN_M
	const CAMPANULAGYMSPEECHHOUSE_BUG_CATCHER

CampanulaGymSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CampanulaGymSpeechHousePokefanMScript:
	jumptextfaceplayer CampanulaGymSpeechHousePokefanMText

CampanulaGymSpeechHouseBugCatcherScript:
	jumptextfaceplayer CampanulaGymSpeechHouseBugCatcherText

CampanulaGymSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

CampanulaGymSpeechHousePokefanMText:
	text "Trainers who want"
	line "to challenge"

	para "themselves try"
	line "to take on the"

	para "#MON GYMS of"
	line "NOSTA to prove"

	para "their worth and"
	line "collect BADGES."

	para "Collecting all"
	line "eight grants them"

	para "the right to face"
	line "the LEAGUE."
	done

CampanulaGymSpeechHouseBugCatcherText:
	text "I wanna take on"
	line "the LEAGUE one"
	cont "day."

	para "Until then, I'm"
	line "gonna train to"

	para "be the best I"
	line "can be!"
	done

CampanulaGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CAMPANULA_TOWN, 3
	warp_event  3,  7, CAMPANULA_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CampanulaGymSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CampanulaGymSpeechHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CampanulaGymSpeechHousePokefanMScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CampanulaGymSpeechHouseBugCatcherScript, -1
