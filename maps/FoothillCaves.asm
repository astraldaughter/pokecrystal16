	object_const_def
	const FOOTHILLCAVES_POKEFAN_M

FoothillCaves_MapScripts:
	def_scene_scripts

	def_callbacks

FoothillCavesPokefanMScript:
	jumptextfaceplayer FoothillCavesPokefanMText

FoothillCavesHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_FOOTHILL_CAVES_HIDDEN_MAX_REVIVE

FoothillCavesPokefanMText:
	text "A bunch of DIGLETT"
	line "popped out of the"

	para "ground! That was"
	line "shocking."
	done

FoothillCaves_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event	11,  5, ROUTE_53, 2
	warp_event	 9, 33, ROUTE_53, 3

	def_coord_events

	def_bg_events
	bg_event  6, 11, BGEVENT_ITEM, FoothillCavesHiddenMaxRevive

	def_object_events
	object_event  3, 31, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FoothillCavesPokefanMScript, -1
