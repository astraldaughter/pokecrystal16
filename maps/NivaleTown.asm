	object_const_def
	const NIVALETOWN_TEACHER
	const NIVALETOWN_FISHER

NivaleTown_MapScripts:
	def_scene_scripts
	scene_script NivaleTownNoop1Scene, SCENE_NIVALETOWN_TEACHER_STOPS_YOU
	scene_script NivaleTownNoop2Scene, SCENE_NIVALETOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NivaleTownFlypointCallback

NivaleTownNoop1Scene:
	end

NivaleTownNoop2Scene:
	end

NivaleTownFlypointCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NivaleTown_TeacherStopsYouScene1:
	playmusic MUSIC_MOM
	turnobject NIVALETOWN_TEACHER, RIGHT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement NIVALETOWN_TEACHER, NivaleTown_TeacherRunsToYouMovement1
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NIVALETOWN_TEACHER, PLAYER
	applymovement NIVALETOWN_TEACHER, NivaleTown_TeacherBringsYouBackMovement1
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NivaleTown_TeacherStopsYouScene2:
	playmusic MUSIC_MOM
	turnobject NIVALETOWN_TEACHER, RIGHT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement NIVALETOWN_TEACHER, NivaleTown_TeacherRunsToYouMovement2
	turnobject PLAYER, UP
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NIVALETOWN_TEACHER, PLAYER
	applymovement NIVALETOWN_TEACHER, NivaleTown_TeacherBringsYouBackMovement2
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NivaleTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

NivaleTownFisherScript:
	jumptextfaceplayer Text_TechnologyIncredible

NivaleTownSign:
	jumptext NivaleTownSignText

NivaleTownPlayersHouseSign:
	jumptext NivaleTownPlayersHouseSignText

NivaleTownElmsLabSign:
	jumptext NivaleTownElmsLabSignText

NivaleTownElmsHouseSign:
	jumptext NivaleTownElmsHouseSignText

NivaleTown_TeacherRunsToYouMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

NivaleTown_TeacherRunsToYouMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

NivaleTown_TeacherBringsYouBackMovement1:
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end

NivaleTown_TeacherBringsYouBackMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end

NivaleTown_RivalPushesYouAwayMovement:
	turn_head UP
	step DOWN
	step_end

NivaleTown_RivalShovesYouOutMovement:
	turn_head UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

NivaleTown_RivalReturnsToTheShadowsMovement:
	step RIGHT
	step_end

Text_GearIsImpressive:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Text_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

Text_YourMonIsAdorable:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

Text_TechnologyIncredible:
	text "Technology"
	line "is incredible!"

	para "You can talk"
	line "with people all"
	cont "over the world."
	done

NivaleTownSignText:
	text "NIVALE TOWN"

	para "A Town of Gentle"
	line "Winds and Fresh"
	cont "Starts"
	done

NivaleTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NivaleTownElmsLabSignText:
	text "FIR #MON LAB"
	done

NivaleTownElmsHouseSignText:
	text "FIR'S HOUSE"
	done

NivaleTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 13, ELMS_LAB, 1
	warp_event 11,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 13, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event  5,  5, ELMS_HOUSE, 1

	def_coord_events
	coord_event  16,  8, SCENE_NIVALETOWN_TEACHER_STOPS_YOU, NivaleTown_TeacherStopsYouScene1
	coord_event  16,  9, SCENE_NIVALETOWN_TEACHER_STOPS_YOU, NivaleTown_TeacherStopsYouScene2

	def_bg_events
	bg_event  7,  9, BGEVENT_READ, NivaleTownSign
	bg_event  9,  5, BGEVENT_READ, NivaleTownPlayersHouseSign
	bg_event 11, 13, BGEVENT_READ, NivaleTownElmsLabSign
	bg_event  3,  5, BGEVENT_READ, NivaleTownElmsHouseSign

	def_object_events
	object_event 12,  8, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NivaleTownTeacherScript, -1
	object_event  6,  8, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NivaleTownFisherScript, -1
