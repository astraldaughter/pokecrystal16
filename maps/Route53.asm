	object_const_def
	const ROUTE53_FRUIT_TREE1
	const ROUTE53_FRUIT_TREE2
	const ROUTE53_HIKER

Route53_MapScripts:
	def_scene_scripts

	def_callbacks

Route53HikerScript:
	faceplayer
	opentext
	writetext Route53HikerText
	waitbutton
	closetext
	end

FoothillCavesSign:
	jumptext FoothillCavesSignText

Route53Sign:
	jumptext Route53SignText

Route53FruitTree1:
	fruittree FRUITTREE_ROUTE_53_1

Route53FruitTree2:
	fruittree FRUITTREE_ROUTE_53_2

Route53HikerText:
	text "I'm packing up"
	line "my campsite right"
	cont "now."

	para "Sorry, could you"
	line "come back later?"
	done

FoothillCavesSignText:
	text "FOOTHILL CAVES"
	done

Route53SignText:
	text "ROUTE 53"
	done

Route53_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event   7,  1, ROUTE_51_ROUTE_53_GATE, 3
	warp_event	12, 11, DIGLETTS_CAVE, 1
	warp_event	10, 19, DIGLETTS_CAVE, 2

	def_coord_events

	def_bg_events
	bg_event  10, 12, BGEVENT_READ, FoothillCavesSign
	bg_event   8, 20, BGEVENT_READ, FoothillCavesSign
	bg_event   9, 29, BGEVENT_READ, Route53Sign

	def_object_events
	object_event 13,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route53FruitTree1, -1
	object_event  4, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route53FruitTree2, -1
	object_event  9, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route53HikerScript, EVENT_ROUTE_53_HIKER
