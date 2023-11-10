	object_const_def
	const MRPOKEMONSHOUSE_SCIENTIST

MrPokemonsHouse_MapScripts:
	def_scene_scripts
	scene_script MrPokemonsHouseMeetMrPokemonScene, SCENE_MRPOKEMONSHOUSE_MEET_MR_POKEMON
	scene_script MrPokemonsHouseNoopScene,          SCENE_MRPOKEMONSHOUSE_NOOP

	def_callbacks

MrPokemonsHouseMeetMrPokemonScene:
	sdefer MrPokemonsHouseMrPokemonEventScript
	end

MrPokemonsHouseNoopScene:
	end

MrPokemonsHouseMrPokemonEventScript:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_SCIENTIST, 15
	turnobject MRPOKEMONSHOUSE_SCIENTIST, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	writetext MrPokemonIntroText3
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NIVALE_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_MRPOKEMONSHOUSE_NOOP
	setmapscene CAMPANULA_TOWN, SCENE_CAMPANULATOWN_MEET_RIVAL
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end


MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonIntroText1:
	text "Oh! You must be"
	line "<PLAY_G>."

	para "PROF.FIR sent"
	line "you, right?"
	done

MrPokemonIntroText2:
	text "This is what I"
	line "want PROF.FIR to"
	cont "look at."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> received"
	line "FIELD NOTES."
	done

MrPokemonIntroText3:
	text "It's a writeup"
	line "of some notes"
	cont "from my fieldwork."

	para "I thought that"
	line "PROF.FIR would"
	cont "be interested."

	para "For #MON evolu-"
	line "tion, PROF.FIR is"
	cont "the authority."
	
	para "Oh! What's this?"
	line "A rare #MON!"

	para "Ah, I see!"

	para "I think I get why"
	line "PROF.FIR gave you"

	para "a #MON for this"
	line "errand."

	para "To researchers"
	line "like PROF.FIR and"

	para "I, #MON are our"
	line "friends."

	para "He knew that you'd"
	line "be the sort to"

	para "treat #MON with"
	line "love and respect."

	para "Hm…"

	para "You seem to be"
	line "trustworthy."

	para "What would you say"
	line "to helping me out?"

	para "This here is the"
	line "latest version of"
	cont "#DEX."

	para "It automatically"
	line "records data on"

	para "#MON you've"
	line "seen or caught."

	para "It's a hi-tech"
	line "encyclopedia!"
	done

MrPokemonsHouse_MrPokemonHealText:
	text "Before you go"
	line "back to PROF.FIR…"

	para "Let your #MON"
	line "have some rest."
	done

MrPokemonText_ImDependingOnYou:
	text "I'm depending on"
	line "you!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "Life is delight-"
	line "ful! Always new"

	para "discoveries to be"
	line "made!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done

MrPokemonText_GimmeTheScale:
	text "Hm? That SCALE!"
	line "What's that?"
	cont "A red GYARADOS?"

	para "That's rare! "
	line "I, I want it…"

	para "<PLAY_G>, would you"
	line "care to trade it?"

	para "I can offer this"
	line "EXP.SHARE I got"
	cont "from PROF.OAK."
	done

MrPokemonText_Disappointed:
	text "That's disappoint-"
	line "ing. That happens"
	cont "to be very rare."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "It's packed with"
	line "foreign textbooks."

	para "Can't even read"
	line "their titles…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "It's a big com-"
	line "puter. Looks like"
	cont "it's broken…"
	done

MrPokemonsHouse_StrangeCoinsText:
	text "A whole pile of"
	line "strange coins!"

	para "Must be from"
	line "another region…"
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_52, 1
	warp_event  3,  7, ROUTE_52, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	def_object_events
	object_event  3,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
