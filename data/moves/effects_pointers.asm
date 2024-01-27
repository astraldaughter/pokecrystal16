MoveEffectsPointers:
; entries correspond to EFFECT_* constants
	table_width 2, MoveEffectsPointers
	dw NormalHit
	dw DoSleep
	dw PoisonHit
	dw LeechHit
	dw BurnHit
	dw FreezeHit
	dw ParalyzeHit
	dw Selfdestruct
	dw DreamEater
	dw MirrorMove
	dw AttackUp
	dw DefenseUp
	dw SpeedUp
	dw SpecialAttackUp
	dw SpecialDefenseUp
	dw AccuracyUp
	dw EvasionUp
	dw NormalHit
	dw AttackDown
	dw DefenseDown
	dw SpeedDown
	dw SpecialAttackDown
	dw SpecialDefenseDown
	dw AccuracyDown
	dw EvasionDown
	dw ResetStats
	dw Bide
	dw Rampage
	dw ForceSwitch
	dw MultiHit
	dw Conversion
	dw FlinchHit
	dw Heal
	dw Toxic
	dw PayDay
	dw LightScreen
	dw TriAttack
	dw NormalHit
	dw OHKOHit
	dw RazorWind
	dw SuperFang
	dw StaticDamage
	dw TrapTarget
	dw NormalHit
	dw MultiHit
	dw NormalHit
	dw Mist
	dw FocusEnergy
	dw RecoilHit
	dw DoConfuse
	dw AttackUp2
	dw DefenseUp2
	dw SpeedUp2
	dw SpecialAttackUp2
	dw SpecialDefenseUp2
	dw AccuracyUp2
	dw EvasionUp2
	dw Transform
	dw AttackDown2
	dw DefenseDown2
	dw SpeedDown2
	dw SpecialAttackDown2
	dw SpecialDefenseDown2
	dw AccuracyDown2
	dw EvasionDown2
	dw Reflect
	dw DoPoison
	dw DoParalyze
	dw AttackDownHit
	dw DefenseDownHit
	dw SpeedDownHit
	dw SpecialAttackDownHit
	dw SpecialDefenseDownHit
	dw AccuracyDownHit
	dw EvasionDownHit
	dw SkyAttack
	dw ConfuseHit
	dw PoisonMultiHit
	dw NormalHit
	dw Substitute
	dw HyperBeam
	dw Rage
	dw Mimic
	dw Metronome
	dw LeechSeed
	dw Splash
	dw Disable
	dw StaticDamage
	dw Psywave
	dw Counter
	dw Encore
	dw PainSplit
	dw Snore
	dw Conversion2
	dw LockOn
	dw Sketch
	dw DefrostOpponent
	dw SleepTalk
	dw DestinyBond
	dw Reversal
	dw Spite
	dw FalseSwipe
	dw HealBell
	dw NormalHit
	dw TripleKick
	dw Thief
	dw MeanLook
	dw Nightmare
	dw FlameWheel
	dw Curse
	dw NormalHit
	dw Protect
	dw Spikes
	dw Foresight
	dw PerishSong
	dw Sandstorm
	dw Endure
	dw Rollout
	dw Swagger
	dw FuryCutter
	dw Attract
	dw Return
	dw Present
	dw Frustration
	dw Safeguard
	dw SacredFire
	dw Magnitude
	dw BatonPass
	dw Pursuit
	dw RapidSpin
	dw NormalHit
	dw NormalHit
	dw MorningSun
	dw Synthesis
	dw Moonlight
	dw HiddenPower
	dw RainDance
	dw SunnyDay
	dw DefenseUpHit
	dw AttackUpHit
	dw SpecialAttackUpHit
	dw AllUpHit
	dw FakeOut
	dw BellyDrum
	dw PsychUp
	dw MirrorCoat
	dw SkullBash
	dw Twister
	dw Earthquake
	dw FutureSight
	dw Gust
	dw Stomp
	dw Solarbeam
	dw ParalyzeHit ; for Thunder, purposefully with different EFFECT_* constant
	dw Teleport
	dw BeatUp
	dw Fly
	dw DefenseCurl
	dw MeteorBeam
	dw Superpower
	dw CalmMind
	dw DragonDance
	dw FreezeHit ; for Blizzard, purposefully with different EFFECT_* constant
	dw Hail
	assert_table_length NUM_MOVE_EFFECTS
