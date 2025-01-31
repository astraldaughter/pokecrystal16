BattleCommand_StartSandstorm:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .failed

	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_SMOOTH_ROCK
	jr nz, .NormalDuration
	ld a, 8
	jr .continue

.NormalDuration
	ld a, 5

.continue
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SandstormBrewedText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
