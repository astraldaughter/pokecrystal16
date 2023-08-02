	object_const_def
	const ROUTE52BERRYHOUSE_POKEFAN_M

Route52BerryHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route52BerryHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_52_HOUSE
	iftrue .GotBerry
	writetext Route52BerrySpeechHouseMonEatBerriesText
	promptbutton
	verbosegiveitem BERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_FROM_ROUTE_52_HOUSE
.GotBerry:
	writetext Route52BerrySpeechHouseCheckTreesText
	waitbutton
.NoRoom:
	closetext
	end

Route52BerryHouseBookshelf:
	jumpstd MagazineBookshelfScript

Route52BerrySpeechHouseMonEatBerriesText:
	text "You know, #MON"
	line "eat BERRIES."

	para "Well, my #MON"
	line "got healthier by"
	cont "eating a BERRY."

	para "Here. I'll share"
	line "one with you!"
	done

Route52BerrySpeechHouseCheckTreesText:
	text "Check trees for"
	line "BERRIES. They just"
	cont "drop right off."
	done

Route52BerryHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_52, 1
	warp_event  3,  7, ROUTE_52, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route52BerryHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route52BerryHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route52BerryHousePokefanMScript, -1
