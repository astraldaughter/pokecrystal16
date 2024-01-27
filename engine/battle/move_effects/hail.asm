BattleCommand_StartHail:
; starthail

	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .failed

	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_ICY_ROCK
	jr nz, .NormalDuration
	ld a, 8
	jr .continue

.NormalDuration
	ld a, 5

.continue
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, ItStartedToHailText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed