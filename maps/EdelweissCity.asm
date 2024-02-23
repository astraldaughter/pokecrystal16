	object_const_def
	const EDELWEISS_RIVAL
	const EDELWEISS_FISHER
	const EDELWEISS_GRAMPS


EdelweissCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EdelweissCityFlypointCallback

EdelweissCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIOLET
	endcallback

EdelweissCityRivalScript:
	jumptextfaceplayer EdelweissCityRivalText

EdelweissCityGrampsScript:
	jumptextfaceplayer EdelweissCityGrampsText

EdelweissCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext EdelweissCityFisherText_Question
	yesorno
	iffalse .Refused
	writetext EdelweissCityFisherText_Yes
	promptbutton
	verbosegiveitem OLD_ROD
	writetext EdelweissCityFisherText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext EdelweissCityFisherText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext EdelweissCityFisherText_After
	waitbutton
	closetext
	end

EdelweissCitySign:
	jumptext EdelweissCitySignText

CraftsmanSignScript:
	jumptext CraftsmanSignText

EdelweissCityPokecenterSign:
	jumpstd PokecenterSignScript

EdelweissCityMartSign:
	jumpstd MartSignScript

EdelweissCityRivalText:
	text "Hmph. It's you"
	line "again."

	para "You're looking"
	line "for the LEADER?"

	para "He's not in the"
	line "GYM right now."

	para "Honestly, some"
	line "people…"

	para "At any rate, I"
	line "don't have time"
	cont "for you."

	para "Go make a"
	line "nuisance of your-"
	cont "self elsewhere."
	done

EdelweissCityGrampsText:
	text "When I was a lad,"
	line "EDELWEISS was just"
	
	para "a quiet town in"
	line "the mountains…"

	para "That changed when"
	line "they discovered"
	cont "those RUINS."
	done


EdelweissCityFisherText_Question:
	text "Ahh… This is a"
	line "nice fishing spot."

	para "What about you?"
	line "Have you ever"
	cont "wanted to fish?"
	done

EdelweissCityFisherText_Yes:
	text "I like your"
	line "attitude, kiddo!"

	para "Here, you can have"
	line "this OLD ROD of"
	cont "mine."
	done

EdelweissCityFisherText_GiveOldRod:
	text "Take that OLD ROD"
	line "and fish!"

	para "Pretty much any"
	line "body of water will"
	
	para "do, from this pond"
	line "here, to the great"
	cont "blue sea!"
	done

EdelweissCityFisherText_No:
	text "Oh… I thought you"
	line "were a kindred"
	cont "spirit…"
	done

EdelweissCityFisherText_After:
	text "How's the fishing"
	line "going? Any good"
	cont "catches?"
	done

EdelweissCitySignText:
	text "EDELWEISS CITY"

	para "The Historic"
	line "Mountain City"
	done

CraftsmanSignText:
	text "KNICK-KNACK CRAFTS"
	done

EdelweissCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  19,  1, ROUTE_53_EDELWEISS_GATE, 3
	warp_event  11, 15, EDELWEISS_CRAFT_SHOP, 1
	warp_event  23, 13, EDELWEISS_GYM_LEADER_SPEECH_HOUSE, 1
	warp_event  27, 13, EDELWEISS_MART, 1
	warp_event  15,  9, EDELWEISS_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 18, 12, BGEVENT_READ, EdelweissCitySign
	bg_event 16,  9, BGEVENT_READ, EdelweissCityPokecenterSign
	bg_event 28, 13, BGEVENT_READ, EdelweissCityMartSign
	bg_event  9, 15, BGEVENT_READ, CraftsmanSignScript

	def_object_events
	object_event  28, 20, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, EdelweissCityRivalScript, -1
	object_event  29, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, EdelweissCityFisherScript, -1
	object_event  20, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, EdelweissCityGrampsScript, -1