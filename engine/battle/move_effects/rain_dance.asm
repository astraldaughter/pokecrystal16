BattleCommand_StartRain:
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_DAMP_ROCK
	jr nz, .NormalDuration
	ld a, 8
	jr .continue

.NormalDuration
	ld a, 5

.continue
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextbox
