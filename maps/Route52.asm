	object_const_def
	const ROUTE52_YOUNGSTER1
	const ROUTE52_YOUNGSTER2
	const ROUTE52_FRUIT_TREE1
	const ROUTE52_FRUIT_TREE2
	const ROUTE52_COOLTRAINER_F
	const ROUTE52_POKE_BALL

Route52_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerYoungsterMikey:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end

Route52YoungsterScript:
	faceplayer
	opentext
	writetext Route52YoungsterText_DirectionsToMrPokemonsHouse
	waitbutton
	closetext
	end

Route52CooltrainerFScript:
	jumptextfaceplayer Route52CooltrainerFText

Route52Sign:
	jumptext Route52SignText

MrPokemonsHouseDirectionsSign:
	jumptext MrPokemonsHouseDirectionsSignText

MrPokemonsHouseSign:
	jumptext MrPokemonsHouseSignText

Route52TrainerTips:
	jumptext Route52TrainerTipsText

Route52Antidote:
	itemball ANTIDOTE

Route52FruitTree1:
	fruittree FRUITTREE_ROUTE_52_1

Route52FruitTree2:
	fruittree FRUITTREE_ROUTE_52_2

Route52HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_52_HIDDEN_POTION

YoungsterMikeySeenText:
	text "You're a #MON"
	line "trainer, right?"

	para "Our eyes met!"
	line "Let's battle!"
	done

YoungsterMikeyBeatenText:
	text "Ack! I shouldn't"
	line "have challenged"
	cont "you…"
	done

YoungsterMikeyAfterText:
	text "Becoming a good"
	line "trainer is really"
	cont "tough."

	para "I'm going to bat-"
	line "tle other people"
	cont "to get better."
	done

Route52YoungsterText_DirectionsToMrPokemonsHouse:
	text "PROF.CRYS'"
	line "house? It's a bit"
	cont "farther ahead."
	done

Route52CooltrainerFText:
	text "I'm not a trainer."

	para "But if you look"
	line "one in the eyes,"
	cont "prepare to battle."
	done

Route52SignText:
	text "ROUTE 52"

	para "CAMPANULA TOWN -"
	line "FREESIA WOODS"
	done

MrPokemonsHouseDirectionsSignText:
	text "PROF.CRYS' HOUSE"
	line "STRAIGHT AHEAD!"
	done

MrPokemonsHouseSignText:
	text "PROF.CRYS' HOUSE"
	done

Route52TrainerTipsText:
	text "TRAINER TIPS"

	para "No stealing other"
	line "people's #MON!"

	para "# BALLS are to"
	line "be thrown only at"
	cont "wild #MON!"
	done

YoungsterJoeyText_GiveHPUpAfterBattle:
	text "I lost again…"
	line "Gee, you're tough!"

	para "Oh yeah, I almost"
	line "forgot that I had"
	cont "to give you this."

	para "Use it to get even"
	line "tougher, OK?"

	para "I'm going to get"
	line "tougher too."
	done

Route52_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21, 43, MR_POKEMONS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11,  5, BGEVENT_READ, Route52Sign
	bg_event  9, 21, BGEVENT_READ, MrPokemonsHouseDirectionsSign
	bg_event 19, 43, BGEVENT_READ, MrPokemonsHouseSign
	bg_event 15, 29, BGEVENT_READ, Route52TrainerTips
	bg_event 16, 44, BGEVENT_ITEM, Route52HiddenPotion

	def_object_events
	object_event 15, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterMikey, -1
	object_event 10, 32, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route52YoungsterScript, -1
	object_event 20, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route52FruitTree1, -1
	object_event  8, 40, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route52FruitTree2, -1
	object_event 19, 30, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route52CooltrainerFScript, -1
	object_event  8, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route52Antidote, EVENT_ROUTE_52_ANTIDOTE
