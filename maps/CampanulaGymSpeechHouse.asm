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
	text "You're trying to"
	line "see how good you"

	para "are as a #MON"
	line "trainer?"

	para "You better visit"
	line "the #MON GYMS"

	para "all over JOHTO and"
	line "collect BADGES."
	done

CampanulaGymSpeechHouseBugCatcherText:
	text "When I get older,"
	line "I'm going to be a"
	cont "GYM LEADER!"

	para "I make my #MON"
	line "battle with my"

	para "friend's to make"
	line "them tougher!"
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
