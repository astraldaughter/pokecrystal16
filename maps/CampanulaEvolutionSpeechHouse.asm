	object_const_def
	const CAMPANULAEVOLUTIONSPEECHHOUSE_LASS
	const CAMPANULAEVOLUTIONSPEECHHOUSE_YOUNGSTER

CampanulaEvolutionSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CampanulaEvolutionSpeechHouseYoungsterScript:
	opentext
	writetext CampanulaEvolutionSpeechHouseYoungsterText
	waitbutton
	closetext
	end

CampanulaEvolutionSpeechHouseLassScript:
	opentext
	writetext CampanulaEvolutionSpeechHouseLassText
	waitbutton
	closetext
	end

CampanulaEvolutionSpeechHouseBookshelf:
	jumpstd MagazineBookshelfScript

CampanulaEvolutionSpeechHouseYoungsterText:
	text "Some #MON"
	line "evolve and change"
	cont "form."

	para "Most do it when"
	line "they gain enough"

	para "experience in"
	line "battle, but some"

	para "need to be given"
	line "special items." 
	done

CampanulaEvolutionSpeechHouseLassText:
	text "None of my"
	line "#MON have"
	cont "evolved yet…"

	para "Maybe I need to"
	line "train harder?"
	done

CampanulaEvolutionSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CAMPANULA_TOWN, 5
	warp_event  3,  7, CAMPANULA_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CampanulaEvolutionSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CampanulaEvolutionSpeechHouseBookshelf

	def_object_events
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CampanulaEvolutionSpeechHouseLassScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CampanulaEvolutionSpeechHouseYoungsterScript, -1
