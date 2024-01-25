	object_const_def

Route53EdelweissGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route53EdelweissGateOfficerScript:
    jumptextfaceplayer Route53EdelweissGateOfficerText

Route53EdelweissGateOfficerText:
    text "While you're in"
    line "EDELWEISS CITY,"

    para "why not check out"
    line "the RUINS?"
    done

Route53EdelweissGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_53, 4
	warp_event  5,  0, ROUTE_53, 5
	warp_event  4,  7, EDELWEISS_CITY, 1
	warp_event  5,  7, EDELWEISS_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
   	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route53EdelweissGateOfficerScript, -1
