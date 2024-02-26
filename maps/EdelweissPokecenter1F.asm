	object_const_def
	const EDELWEISSPOKECENTER1F_NURSE
	const EDELWEISSPOKECENTER1F_GAMEBOY_KID
	const EDELWEISSPOKECENTER1F_GENTLEMAN
	const EDELWEISSPOKECENTER1F_YOUNGSTER

EdelweissPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

EdelweissPokecenterNurse:
	jumpstd PokecenterNurseScript

EdelweissPokecenter1FGameboyKidScript:
	jumptextfaceplayer EdelweissPokecenter1FGameboyKidText

EdelweissPokecenter1FGentlemanScript:
	jumptextfaceplayer EdelweissPokecenter1FGentlemanText

EdelweissPokecenter1FYoungsterScript:
	jumptextfaceplayer EdelweissPokecenter1FYoungsterText

EdelweissPokecenter1FGameboyKidText:
	text "The PCs in every"
	line "#MON CENTER"
	cont "are linked."

	para "That's all thanks"
	line "to a guy named"

	para "BILL from the"
	line "KANTO region."
	done

EdelweissPokecenter1FGentlemanText:
	text "We're quite"
	line "fortunate here"
	cont "in NOSTA."

	para "I hear other"
	line "regions have"
	
	para "problems with"
	line "powerful criminal"
	cont "gangs."
	done

EdelweissPokecenter1FYoungsterText:
	text "My buddy traded me"
	line "a #MON he'd"
	cont "raised."

	para "It wouldn't obey"
	line "me because I"
	
	para "didn't have any"
	line "BADGES."
	done

EdelweissPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, EDELWEISS_CITY, 5
	warp_event  4,  7, EDELWEISS_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EdelweissPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EdelweissPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EdelweissPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EdelweissPokecenter1FYoungsterScript, -1
