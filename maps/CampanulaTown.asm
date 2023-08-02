	object_const_def
	const CAMPANULATOWN_GRAMPS
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

CampanulaTownGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	yesorno
	iffalse .No
	sjump .Yes
.Yes:
	writetext GuideGentTourText1
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow CAMPANULATOWN_GRAMPS, PLAYER
	applymovement CAMPANULATOWN_GRAMPS, GuideGentMovement1
	opentext
	writetext GuideGentPokecenterText
	waitbutton
	closetext
	applymovement CAMPANULATOWN_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	opentext
	writetext GuideGentMartText
	waitbutton
	closetext
	applymovement CAMPANULATOWN_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	opentext
	writetext GuideGentRoute52Text
	waitbutton
	closetext
	applymovement CAMPANULATOWN_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	opentext
	writetext GuideGentSeaText
	waitbutton
	closetext
	applymovement CAMPANULATOWN_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CAMPANULATOWN_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement CAMPANULATOWN_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CAMPANULATOWN_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CAMPANULA
	waitsfx
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"

.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

CampanulaRivalSceneSouth:
	moveobject CAMPANULATOWN_RIVAL, 39, 7
CampanulaRivalSceneNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear CAMPANULATOWN_RIVAL
	applymovement CAMPANULATOWN_RIVAL, CampanulaTown_RivalWalksToYou
	turnobject PLAYER, RIGHT
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
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext CampanulaTeacherText_NoMapCard
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext CampanulaTeacherText_HaveMapCard
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

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CampanulaTownPokecenterSign:
	jumpstd PokecenterSignScript

CampanulaTownMartSign:
	jumpstd MartSignScript

GuideGentMovement1:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head UP
	step_end

GuideGentMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement4:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end

GuideGentMovement5:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

GuideGentMovement6:
	step UP
	step UP
	step_end

CampanulaTown_RivalWalksToYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CampanulaTown_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CampanulaTown_UnusedMovementData: ; unreferenced
	step LEFT
	turn_head DOWN
	step_end

CampanulaTown_RivalExitsStageLeft:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

GuideGentIntroText:
	text "You're a rookie"
	line "trainer, aren't"
	cont "you? I can tell!"

	para "That's OK! Every-"
	line "one is a rookie"
	cont "at some point!"

	para "If you'd like, I"
	line "can teach you a"
	cont "few things."
	done

GuideGentTourText1:
	text "OK, then!"
	line "Follow me!"
	done

GuideGentPokecenterText:
	text "This is a #MON"
	line "CENTER. They heal"

	para "your #MON in no"
	line "time at all."

	para "You'll be relying"
	line "on them a lot, so"

	para "you better learn"
	line "about them."
	done

GuideGentMartText:
	text "This is a #MON"
	line "MART."

	para "They sell BALLS"
	line "for catching wild"

	para "#MON and other"
	line "useful items."
	done

GuideGentRoute52Text:
	text "ROUTE 30 is out"
	line "this way."

	para "Trainers will be"
	line "battling their"

	para "prized #MON"
	line "there."
	done

GuideGentSeaText:
	text "This is the sea,"
	line "as you can see."

	para "Some #MON are"
	line "found only in"
	cont "water."
	done

GuideGentGiftText:
	text "Here…"

	para "It's my house!"
	line "Thanks for your"
	cont "company."

	para "Let me give you a"
	line "small gift."
	done

GotMapCardText:
	text "<PLAYER>'s #GEAR"
	line "now has a MAP!"
	done

GuideGentPokegearText:
	text "#GEAR becomes"
	line "more useful as you"
	cont "add CARDS."

	para "I wish you luck on"
	line "your journey!"
	done

GuideGentNoText:
	text "Oh… It's something"
	line "I enjoy doing…"

	para "Fine. Come see me"
	line "when you like."
	done

CampanulaRivalText_Seen:
	text "<……> <……> <……>"

	para "You got a #MON"
	line "at the LAB."

	para "What a waste."
	line "A wimp like you."

	para "<……> <……> <……>"

	para "Don't you get what"
	line "I'm saying?"

	para "Well, I too, have"
	line "a good #MON."

	para "I'll show you"
	line "what I mean!"
	done

RivalCampanulaWinText:
	text "Humph. Are you"
	line "happy you won?"
	done

CampanulaRivalText_YouLost:
	text "<……> <……> <……>"

	para "My name's ???."

	para "I'm going to be"
	line "the world's great-"
	cont "est #MON"
	cont "trainer."
	done

RivalCampanulaLossText:
	text "Humph. That was a"
	line "waste of time."
	done

CampanulaRivalText_YouWon:
	text "<……> <……> <……>"

	para "My name's ???."

	para "I'm going to be"
	line "the world's great-"
	cont "est #MON"
	cont "trainer."
	done

CampanulaTeacherText_NoMapCard:
	text "Did you talk to"
	line "the old man by the"
	cont "#MON CENTER?"

	para "He'll put a MAP of"
	line "JOHTO on your"
	cont "#GEAR."
	done

CampanulaTeacherText_HaveMapCard:
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
	text "CAMPANULA CITY"

	para "The City of Cute,"
	line "Fragrant Flowers"
	done

GuideGentsHouseSignText:
	text "GUIDE GENT'S HOUSE"
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
	coord_event 23,  6, SCENE_CAMPANULATOWN_MEET_RIVAL, CampanulaRivalSceneNorth
	coord_event 23,  7, SCENE_CAMPANULATOWN_MEET_RIVAL, CampanulaRivalSceneSouth

	def_bg_events
	bg_event 17,  9, BGEVENT_READ, CampanulaTownSign
	bg_event  5, 11, BGEVENT_READ, GuideGentsHouseSign
	bg_event 22,  7, BGEVENT_READ, CampanulaTownMartSign
	bg_event 16,  7, BGEVENT_READ, CampanulaTownPokecenterSign

	def_object_events
	object_event 22,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CampanulaTownGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 29,  6, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CAMPANULA_TOWN
	object_event 17, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CampanulaTeacherScript, -1
	object_event 11,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CampanulaYoungsterScript, -1
	object_event  5, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
