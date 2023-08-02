	object_const_def
	const ROUTE53_POKEFAN_M
	const ROUTE53_YOUNGSTER
	const ROUTE53_LASS
	const ROUTE53_FRUIT_TREE1
	const ROUTE53_FRUIT_TREE2
	const ROUTE53_POKE_BALL

Route53_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperTed:
	trainer CAMPER, TED, EVENT_BEAT_CAMPER_TED, CamperTedSeenText, CamperTedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperTedAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerErin1:
	trainer PICNICKER, ERIN1, EVENT_BEAT_PICNICKER_ERIN, PicnickerErin1SeenText, PicnickerErin1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_ERIN
	endifjustbattled
	opentext
	checkflag ENGINE_ERIN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_PICNICKER_ERIN
	iftrue Route53NumberAcceptedF
	checkevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerErinAfterBattleText
	promptbutton
	setevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	scall Route53AskNumber1F
	sjump .AskForNumber

.AskedAlready:
	scall Route53AskNumber2F
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_ERIN
	ifequal PHONE_CONTACTS_FULL, Route53PhoneFullF
	ifequal PHONE_CONTACT_REFUSED, Route53NumberDeclinedF
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	scall Route53RegisteredNumberF
	sjump Route53NumberAcceptedF

.WantsBattle:
	scall Route53RematchF
	winlosstext PicnickerErin1BeatenText, 0
	readmem wErinFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, ERIN1
	startbattle
	reloadmapafterbattle
	loadmem wErinFightCount, 1
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, ERIN2
	startbattle
	reloadmapafterbattle
	loadmem wErinFightCount, 2
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, ERIN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	checkevent EVENT_ERIN_CALCIUM
	iftrue .HasCalcium
	checkevent EVENT_GOT_CALCIUM_FROM_ERIN
	iftrue .GotCalciumAlready
	scall Route53RematchGiftF
	verbosegiveitem CALCIUM
	iffalse ErinNoRoomForCalcium
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	sjump Route53NumberAcceptedF

.GotCalciumAlready:
	end

.HasCalcium:
	opentext
	writetext PicnickerErin2BeatenText
	waitbutton
	verbosegiveitem CALCIUM
	iffalse ErinNoRoomForCalcium
	clearevent EVENT_ERIN_CALCIUM
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	sjump Route53NumberAcceptedF

Route53AskNumber1F:
	jumpstd AskNumber1FScript
	end

Route53AskNumber2F:
	jumpstd AskNumber2FScript
	end

Route53RegisteredNumberF:
	jumpstd RegisteredNumberFScript
	end

Route53NumberAcceptedF:
	jumpstd NumberAcceptedFScript
	end

Route53NumberDeclinedF:
	jumpstd NumberDeclinedFScript
	end

Route53PhoneFullF:
	jumpstd PhoneFullFScript
	end

Route53RematchF:
	jumpstd RematchFScript
	end

ErinNoRoomForCalcium:
	setevent EVENT_ERIN_CALCIUM
	jumpstd PackFullFScript
	end

Route53RematchGiftF:
	jumpstd RematchGiftFScript
	end

TrainerHikerBailey:
	trainer HIKER, BAILEY, EVENT_BEAT_HIKER_BAILEY, HikerBaileySeenText, HikerBaileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBaileyAfterBattleText
	waitbutton
	closetext
	end

Route53Sign:
	jumptext Route53SignText

Route53XSpeed:
	itemball X_SPEED

Route53FruitTree1:
	fruittree FRUITTREE_ROUTE_53_1

Route53FruitTree2:
	fruittree FRUITTREE_ROUTE_53_2

HikerBaileySeenText:
	text "Awright! I'll show"
	line "you the power of"
	cont "mountain #MON!"
	done

HikerBaileyBeatenText:
	text "Mercy! You showed"
	line "me your power!"
	done

HikerBaileyAfterBattleText:
	text "It's over. I don't"
	line "mind. We HIKERS"
	cont "are like that."
	done

CamperTedSeenText:
	text "I'm raising #-"
	line "MON too!"

	para "Will you battle"
	line "with me?"
	done

CamperTedBeatenText:
	text "Wha…?"
	done

CamperTedAfterBattleText:
	text "I did my best but"
	line "came up short."

	para "No excuses--I"
	line "admit I lost."
	done

PicnickerErin1SeenText:
	text "I raise #MON"
	line "too!"

	para "Will you battle"
	line "with me?"
	done

PicnickerErin1BeatenText:
	text "Oh, rats!"
	done

PicnickerErinAfterBattleText:
	text "I've been to many"
	line "GYMS, but the GYM"

	para "in GOLDENROD is my"
	line "favorite."

	para "It's filled with"
	line "pretty flowers!"
	done

PicnickerErin2BeatenText:
	text "Aww… I keep losing"
	line "all the time!"

	para "I'll just have to"
	line "try harder!"

	para "Anyway, thanks for"
	line "battling me again"

	para "and again. Here's"
	line "that present from"
	cont "the other time."
	done

Route53SignText:
	text "ROUTE 46"
	line "MOUNTAIN RD. AHEAD"
	done

Route53_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 33, ROUTE_51_ROUTE_53_GATE, 1
	warp_event  8, 33, ROUTE_51_ROUTE_53_GATE, 2
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_READ, Route53Sign

	def_object_events
	object_event 12, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBailey, -1
	object_event  4, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperTed, -1
	object_event  2, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerErin1, -1
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route53FruitTree1, -1
	object_event  8,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route53FruitTree2, -1
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route53XSpeed, EVENT_ROUTE_53_X_SPEED
