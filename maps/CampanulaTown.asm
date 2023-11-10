	object_const_def
	const CAMPANULATOWN_RIVAL
	const CAMPANULATOWN_TEACHER
	const CAMPANULATOWN_YOUNGSTER
	const CAMPANULATOWN_FISHER

CampanulaTown_MapScripts:
	def_scene_scripts
	scene_script CampanulaTownNoop1Scene, SCENE_CAMPANULATOWN_NOOP
	scene_script CampanulaTownNoop2Scene, SCENE_CAMPANULATOWN_MEET_RIVAL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CampanulaTownFlypointCallback

CampanulaTownNoop1Scene:
	end

CampanulaTownNoop2Scene:
	end

CampanulaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_CAMPANULA
	endcallback

CampanulaRivalSceneSouth:
	moveobject CAMPANULATOWN_RIVAL, 5, 9
CampanulaRivalSceneNorth:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear CAMPANULATOWN_RIVAL
    applymovement CAMPANULATOWN_RIVAL, CampanulaTown_RivalWalksToYou
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CampanulaRivalText_Seen
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext RivalCampanulaWinText, RivalCampanulaLossText
	setlasttalked CAMPANULATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Totodile:
	winlosstext RivalCampanulaWinText, RivalCampanulaLossText
	setlasttalked CAMPANULATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Chikorita:
	winlosstext RivalCampanulaWinText, RivalCampanulaLossText
	setlasttalked CAMPANULATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CampanulaRivalText_YouWon
	waitbutton
	closetext
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CampanulaRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	playsound SFX_TACKLE
	applymovement PLAYER, CampanulaTown_RivalPushesYouOutOfTheWay
	turnobject PLAYER, LEFT
	applymovement CAMPANULATOWN_RIVAL, CampanulaTown_RivalExitsStageLeft
	disappear CAMPANULATOWN_RIVAL
	setscene SCENE_CAMPANULATOWN_NOOP
	special HealParty
	playmapmusic
	end

CampanulaTeacherScript:
	faceplayer
	opentext
	writetext CampanulaTeacherText
	waitbutton
	closetext
	end

CampanulaYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CampanulaYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CampanulaYoungsterText_HavePokedex
	waitbutton
	closetext
	end

MysticWaterGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CAMPANULA
	iftrue .After
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse .Exit
	setevent EVENT_GOT_MYSTIC_WATER_IN_CAMPANULA
.After:
	writetext MysticWaterGuyTextAfter
	waitbutton
.Exit:
	closetext
	end

CampanulaTownSign:
	jumptext CampanulaTownSignText

CampanulaTownPokecenterSign:
	jumpstd PokecenterSignScript

CampanulaTownMartSign:
	jumpstd MartSignScript

CampanulaTown_RivalWalksToYou:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

CampanulaTown_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CampanulaTown_RivalExitsStageLeft:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	step_end

CampanulaRivalText_Seen:
	text "<……> <……> <……>"

	para "You must be"
	line "PROF.FIR's pet"
	cont "trainer."

	para "Gotta say, not"
	line "what I expected."

	para "<……> <……> <……>"

	para "Don't you get what"
	line "I'm saying?"

	para "Put it this way,"
	line "you're outmatched."

	para "I'll show you"
	line "what I mean!"
	done

RivalCampanulaWinText:
	text "Hmph. You just"
	line "got lucky."

	done

CampanulaRivalText_YouLost:
	text "<……> <……> <……>"

	para "The name's ???."

	para "Commit it to"
	line "memory."

	para "I'm going to be"
	line "the best trainer"
	cont "in NOSTA."
	done

RivalCampanulaLossText:
	text "Hmph. Waste of my"
	line "time."

	done

CampanulaRivalText_YouWon:
	text "<……> <……> <……>"

	para "The name's ???."

	para "Commit it to"
	line "memory."

	para "I'm going to be"
	line "the best trainer"
	cont "in NOSTA."
	done

CampanulaTeacherText:
	text "When you're with"
	line "#MON, going"
	cont "anywhere is fun."
	done

CampanulaYoungsterText_NoPokedex:
	text "MR.#MON's house"
	line "is still farther"
	cont "up ahead."
	done

CampanulaYoungsterText_HavePokedex:
	text "I battled the"
	line "trainers on the"
	cont "road."

	para "My #MON lost."
	line "They're a mess! I"

	para "must take them to"
	line "a #MON CENTER."
	done

MysticWaterGuyTextBefore:
	text "A #MON I caught"
	line "had an item."

	para "I think it's"
	line "MYSTIC WATER."

	para "I don't need it,"
	line "so do you want it?"
	done

MysticWaterGuyTextAfter:
	text "Back to fishing"
	line "for me, then."
	done

CampanulaTownSignText:
	text "CAMPANULA TOWN"

	para "The Town With A"
	line "Fragrant Breeze"
	done

CampanulaTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21,  7, CAMPANULA_MART, 2
	warp_event 15,  7, CAMPANULA_POKECENTER_1F, 1
	warp_event  9,  7, CAMPANULA_GYM_SPEECH_HOUSE, 1
	warp_event  7, 11, GUIDE_GENTS_HOUSE, 1
	warp_event 27,  9, CAMPANULA_EVOLUTION_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 10,  8, SCENE_CAMPANULATOWN_MEET_RIVAL, CampanulaRivalSceneNorth
	coord_event 10,  9, SCENE_CAMPANULATOWN_MEET_RIVAL, CampanulaRivalSceneSouth

	def_bg_events
	bg_event 17,  9, BGEVENT_READ, CampanulaTownSign
	bg_event 22,  7, BGEVENT_READ, CampanulaTownMartSign
	bg_event 16,  7, BGEVENT_READ, CampanulaTownPokecenterSign

	def_object_events
	object_event  5,  8, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CAMPANULA_TOWN
	object_event 16, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CampanulaTeacherScript, -1
	object_event 12, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CampanulaYoungsterScript, -1
	object_event 32, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
