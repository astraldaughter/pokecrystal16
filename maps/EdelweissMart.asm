	object_const_def
	const EDELWEISSMART_CLERK
	const EDELWEISSMART_YOUNGSTER
	const EDELWEISSMART_COOLTRAINER_M

EdelweissMart_MapScripts:
	def_scene_scripts

	def_callbacks

EdelweissMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_EDELWEISS
	closetext
	end

EdelweissMartYoungsterScript:
	jumptextfaceplayer EdelweissMartYoungsterText

EdelweissMartCooltrainerMScript:
	jumptextfaceplayer EdelweissMartCooltrainerMText

EdelweissMartYoungsterText:
	text "If you're heading"
	line "into the RUINS,"
	
	para "you'd better bring"
	line "an ESCAPE ROPE in"
	cont "case you get lost."
	done

EdelweissMartCooltrainerMText:
	text "They sell a TM"
	line "here that helps"

	para "weaken a #MON"
	line "to make it easy"
	cont "to catch."
	done

EdelweissMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, EDELWEISS_CITY, 4
	warp_event  3,  7, EDELWEISS_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EdelweissMartClerkScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EdelweissMartYoungsterScript, -1
	object_event  5,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EdelweissMartCooltrainerMScript, -1
