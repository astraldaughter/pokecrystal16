	object_const_def
	const CAMPANULAPOKECENTER1F_NURSE
	const CAMPANULAPOKECENTER1F_FISHER
	const CAMPANULAPOKECENTER1F_GENTLEMAN
	const CAMPANULAPOKECENTER1F_TEACHER

CampanulaPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CampanulaPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CampanulaPokecenter1FFisherScript:
	jumptextfaceplayer CampanulaPokecenter1FFisherText

CampanulaPokecenter1FGentlemanScript:
	jumptextfaceplayer CampanulaPokecenter1FGentlemanText

CampanulaPokecenter1FTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .CommCenterOpen
	writetext CampanulaPokecenter1FTeacherText
	waitbutton
	closetext
	end

.CommCenterOpen:
	writetext CampanulaPokecenter1FTeacherText_CommCenterOpen
	waitbutton
	closetext
	end

CampanulaPokecenter1FFisherText:
	text "That PC is really"
	line "handy. It lets me"

	para "store as many"
	line "#MON as I want."

	para "Best of all?"
	line "It's totally free!"
	done

CampanulaPokecenter1FGentlemanText:
	text "That PC is free"
	line "for any trainer"
	cont "to use."

	para "It's quite"
	line "indispensable!"
	done

CampanulaPokecenter1FTeacherText:
	text "The COMMUNICATION"
	line "CENTER upstairs"
	cont "was just built."

	para "But they're still"
	line "finishing it up."
	done

CampanulaPokecenter1FTeacherText_CommCenterOpen:
	text "The COMMUNICATION"
	line "CENTER upstairs"
	cont "was just built."

	para "I traded #MON"
	line "there already!"
	done

CampanulaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CAMPANULA_TOWN, 2
	warp_event  4,  7, CAMPANULA_TOWN, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CampanulaPokecenter1FNurseScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CampanulaPokecenter1FFisherScript, -1
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CampanulaPokecenter1FGentlemanScript, -1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CampanulaPokecenter1FTeacherScript, -1
