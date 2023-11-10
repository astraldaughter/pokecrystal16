	object_const_def
	const CAMPANULAMART_CLERK
	const CAMPANULAMART_COOLTRAINER_M
	const CAMPANULAMART_YOUNGSTER

CampanulaMart_MapScripts:
	def_scene_scripts

	def_callbacks

CampanulaMartClerkScript:
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	pokemart MARTTYPE_STANDARD, MART_CAMPANULA
	closetext
	end

.PokeBallsInStock:
	pokemart MARTTYPE_STANDARD, MART_CAMPANULA_DEX
	closetext
	end

CampanulaMartCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	writetext CampanulaMartCooltrainerMText
	waitbutton
	closetext
	end

.PokeBallsInStock:
	writetext CampanulaMartCooltrainerMText_PokeBallsInStock
	waitbutton
	closetext
	end

CampanulaMartYoungsterScript:
	jumptextfaceplayer CampanulaMartYoungsterText

CampanulaMartCooltrainerMText:
	text "Darn! They're out"
	line "of # BALLS!"

	para "I was hoping to"
	line "grab some…"
	done

CampanulaMartCooltrainerMText_PokeBallsInStock:
	text "# BALLS are"
	line "finally back in"
	cont "stock!"
	done

CampanulaMartYoungsterText:
	text "They sell so many"
	line "medicines for"
	cont "#MON here…"

	para "I'm not sure if"
	line "there's enough"
	cont "room in my bag!"
	done

CampanulaMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CAMPANULA_TOWN, 1
	warp_event  3,  7, CAMPANULA_TOWN, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CampanulaMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CampanulaMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CampanulaMartYoungsterScript, -1
