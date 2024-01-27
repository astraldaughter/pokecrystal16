BattleCommand_StartSun:
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_HEAT_ROCK
	jr nz, .NormalDuration
	ld a, 8
	jr .continue

.NormalDuration
	ld a, 5

.continue
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextbox
