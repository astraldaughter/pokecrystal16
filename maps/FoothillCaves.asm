	object_const_def
	const FOOTHILLCAVES_POKEFAN_M
	const FOOTHILLCAVES_POKE_BALL

FoothillCaves_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHikerAnthony:
	trainer HIKER, ANTHONY, EVENT_BEAT_HIKER_ANTHONY, HikerAnthonySeenText, HikerAnthonyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerAnthonyAfterText
	waitbutton
	closetext
	end

FoothillCavesPokeBall:
	itemball POKE_BALL

FoothillCavesHiddenPotion:
	hiddenitem POTION, EVENT_FOOTHILL_CAVES_HIDDEN_POTION

HikerAnthonySeenText:
	text "I just broke camp!"
	line "I'm raring to go!"
	done

HikerAnthonyBeatenText:
	text "Guess now's good"
	line "for a break…"
	done

HikerAnthonyAfterText:
	text "An important part"
	line "of any long hike"

	para "is knowing when"
	line "to take a"
	cont "breather."
	done

FoothillCaves_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event	11,  5, ROUTE_53, 2
	warp_event	 9, 33, ROUTE_53, 3

	def_coord_events

	def_bg_events
	bg_event 5, 13, BGEVENT_ITEM, FoothillCavesHiddenPotion

	def_object_events
	object_event  11, 21, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event  12, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FoothillCavesPokeBall, EVENT_FOOTHILL_CAVES_POKE_BALL
