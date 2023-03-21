BattleCommand_StartSnow:
; startsnow

	ld a, [wBattleWeather]
	cp WEATHER_SNOW
	jr z, .failed

	ld a, WEATHER_SNOW
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, ItStartedToSnowText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
