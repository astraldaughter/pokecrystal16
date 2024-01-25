	object_const_def
	const EDELWEISSCRAFTSHOP_CRAFTSMAN	
	const EDELWEISSCRAFTSHOP_SPREASEL

EdelweissCraftShop_MapScripts:
	def_scene_scripts

	def_callbacks

EdelweissCraftShopCraftsmanScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .AlreadyGotCut
	writetext EdelweissCraftsmanText_Intro
	promptbutton
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext EdelweissCraftsmanText_Outro
	waitbutton
	closetext
	end

.AlreadyGotCut:
	writetext EdelweissCraftsmanText_After
	waitbutton
	closetext
	end

EdelweissCraftShopSpreaselScript:
	faceplayer
	opentext
	writetext EdelweissCraftShopSpreaselText
	cry SPREASEL
	waitbutton
	closetext
	end

EdelweissCraftsmanText_Intro:
	text "Welcome to"
	line "KNICK-KNACK CRA…"

	para "Oh! From the looks"
	line "of it, you're a"

	para "#MON trainer,"
	line "am I right?"

	para "In that case, let"
	line "me give you some-"
	cont "thing useful."
	done

EdelweissCraftsmanText_Outro:
	text "That there is"
	line "the HM for CUT!"

	para "Use it on your"
	line "#MON, and it'll"

	para "learn a technique"
	line "for CUTTING down"
	cont "trees."

	para "However, you'll"
	line "need the BADGE"

	para "from this city's"
	line "GYM to be able"

	para "to use it outside"
	line "of battle."
	done

EdelweissCraftsmanText_After:
	text "Hm? Why did I have"
	line "a HM for CUT?"

	para "Well, my #MON"
	line "cuts down trees"

	para "to gather material"
	line "for my woodwork."
	done

EdelweissCraftShopSpreaselText:
	text "SPREASEL: Spriyii!"
	done

EdelweissCraftShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, EDELWEISS_CITY, 2
	warp_event  4,  7, EDELWEISS_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EdelweissCraftShopCraftsmanScript, -1
	object_event  2,  3, SPRITE_SPREASEL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EdelweissCraftShopSpreaselScript, -1