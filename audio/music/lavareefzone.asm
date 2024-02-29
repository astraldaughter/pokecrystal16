Music_LavaReefZone:
	channel_count 4
	channel 1, Music_LavaReefZone_Ch1
	channel 2, Music_LavaReefZone_Ch2
	channel 3, Music_LavaReefZone_Ch3
	channel 4, Music_LavaReefZone_Ch4

Music_LavaReefZone_Ch1:
	tempo 256
	volume 7, 7
	note_type 12, 15, 8
.mainLoop:
	duty_cycle 2
	tempo 150
	octave 3
	volume_envelope 6, 8
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	duty_cycle 1
	octave 3
	volume_envelope 9, 3
	note A_, 2
	octave 4
	note C_, 1
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note G_, 1
	note F_, 2
	note E_, 2
	note A_, 2
	octave 4
	note C_, 1
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note E_, 1
	note G_, 2
	note E_, 2
	note_type 12, 12, 2
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	rest 2
	volume_envelope 9, 3
	note F_, 3
	note F_, 3
	note A_, 2
	volume_envelope 12, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	rest 2
	volume_envelope 9, 3
	note G_, 3
	rest 1
	octave 4
	note D_, 6
	octave 3
	note A_, 2
	note G_, 2
	note G_, 1
	rest 1
	note A_, 2
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	rest 1
	note B_, 1
	note A_, 1
	rest 1
	note B_, 2
	note B_, 1
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	note D_, 1
	rest 1
	note D_, 2
	note E_, 2
	octave 3
	note B_, 2
	note B_, 2
	octave 4
	duty_cycle 0
	volume_envelope 12, 7
	vibrato 16, 1, 2
	sound_call .sub2
	octave 4
	sound_call .sub2
	octave 3
	note_type 12, 12, 7
	sound_loop 0, .mainLoop

.sub1:
	duty_cycle 1
	octave 3
	volume_envelope 9, 3
	vibrato 0, 0, 0
	note A_, 2
	octave 4
	note C_, 1
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note G_, 1
	note F_, 2
	note E_, 2
	note A_, 2
	octave 4
	note C_, 1
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note E_, 1
	note G_, 2
	note E_, 2
	octave 2
	sound_ret

.sub2:
	duty_cycle 1
	vibrato 8, 2, 1
	note E_, 2
	octave 3
	note A_, 1
	octave 4
	note E_, 1
	rest 2
	octave 3
	note A_, 6
	octave 4
	note C_, 4
	octave 3
	note B_, 1
	rest 1
	note B_, 1
	octave 4
	note D_, 1
	octave 3
	rest 1
	note B_, 1
	octave 4
	note C_, 10
	sound_ret

Music_LavaReefZone_Ch2:
	note_type 12, 15, 8
.mainLoop:
	rest 16
	rest 16
	rest 16
	rest 14
	octave 4
	vibrato 16, 1, 2
	volume_envelope 15, 7
	sound_call .sub1
	octave 4
	sound_call .sub1
	note_type 12, 15, 7
	octave 4
	note E_, 1
	note F_, 1
	note G_, 6
	note C_, 10
	note G_, 4
	note A_, 1
	rest 1
	note G_, 12
	note A_, 2
	note G_, 1
	rest 1
	note A_, 1
	rest 1
	octave 5
	note C_, 3
	octave 4
	note B_, 1
	rest 2
	note A_, 1
	rest 1
	note B_, 3
	octave 5
	note C_, 1
	rest 2
	note D_, 1
	rest 1
	note C_, 4
	octave 4
	note B_, 4
	octave 5
	sound_call .sub2
	octave 5
	sound_call .sub2
	octave 4
	note_type 12, 15, 7
	sound_loop 0, .mainLoop

.sub1:
	note D_, 1
	note D#, 1
	note E_, 3
	note G_, 1
	rest 2
	note C_, 6
	note E_, 1
	rest 1
	octave 3
	note A_, 3
	octave 4
	note C_, 1
	note E_, 12
	note D_, 1
	note D#, 1
	note E_, 3
	note G_, 1
	rest 2
	note C_, 6
	note E_, 1
	rest 1
	note D_, 3
	note C_, 1
	octave 3
	note A_, 12
	sound_ret

.sub2:
	note E_, 2
	octave 4
	note A_, 1
	octave 5
	note E_, 1
	octave 4
	rest 2
	note A_, 6
	octave 5
	note C_, 4
	octave 4
	note B_, 1
	rest 1
	note B_, 1
	octave 5
	note D_, 1
	rest 1
	octave 4
	note B_, 1
	octave 5
	note C_, 10
	sound_ret

Music_LavaReefZone_Ch3:
	note_type 12, 1, 0
.mainLoop:
	volume_envelope 1, 7
	octave 2
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	octave 2
	volume_envelope 1, 0
	note A_, 1
	rest 1
	note G_, 1
	note A_, 8
	rest 5
	note F_, 1
	rest 1
	note F_, 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 8
	rest 1
	note_type 12, 1, 7
	rest 1
	volume_envelope 1, 0
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	rest 10
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	rest 3
	octave 3
	note C_, 4
	octave 2
	note G_, 4
	note A_, 1
	rest 1
	note G_, 1
	note A_, 1
	rest 2
	octave 3
	note C_, 1
	rest 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	rest 2
	note D_, 1
	rest 1
	note C_, 1
	note D_, 1
	rest 2
	note E_, 1
	rest 1
	note D_, 1
	note E_, 1
	rest 2
	note G_, 4
	octave 2
	note G_, 4
	sound_call .sub2
	rest 4
	sound_call .sub2
	octave 2
	note_type 12, 1, 0
	rest 4
	sound_loop 0, .mainLoop

.sub1:
	octave 2
	volume_envelope 1, 0
	note A_, 1
	rest 1
	note G_, 1
	note A_, 8
	rest 5
	note F_, 1
	rest 1
	note F_, 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 8
	rest 1
	octave 3
	sound_ret

.sub2:
	note A_, 1
	rest 1
	note A_, 1
	note A_, 1
	octave 3
	rest 2
	note C_, 1
	rest 1
	note C_, 1
	note C_, 1
	rest 2
	note D_, 1
	note C_, 1
	octave 2
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 3
	note A_, 6
	sound_ret

Music_LavaReefZone_Ch4:
	toggle_noise 0
	drum_speed 12
.mainLoop:
	toggle_noise
	toggle_noise 3
	drum_note 2, 1
	rest 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 3, 4
	rest 4
	drum_note 3, 4
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	drum_note 2, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 3, 4
	rest 4
	drum_note 3, 1
	drum_note 1, 1
	drum_note 11, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 1, 1
	drum_note 1, 1
	drum_note 3, 4
	drum_note 12, 4
	drum_note 3, 4
	drum_note 1, 1
	drum_note 1, 1
	drum_note 1, 1
	drum_note 1, 1
	drum_note 3, 4
	drum_note 12, 4
	drum_note 3, 2
	drum_note 12, 2
	drum_note 1, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 3, 2
	drum_note 1, 2
	drum_note 1, 1
	drum_note 1, 3
	drum_note 3, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 2, 2
	drum_note 1, 2
	drum_note 3, 1
	drum_note 1, 3
	drum_note 1, 3
	octave 8
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_speed 12
	sound_call .sub2
	sound_call .sub2
	octave 8
	drum_speed 12
	sound_call .sub2
	octave 8
	drum_speed 12
	sound_call .sub2
	octave 8
	drum_speed 12
	sound_loop 0, .mainLoop

.sub1:
	drum_note 2, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 3, 4
	rest 4
	drum_note 3, 1
	drum_note 1, 1
	drum_note 11, 2
	sound_ret

.sub2:
	drum_note 1, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 3, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 2, 2
	drum_note 2, 1
	drum_note 2, 1
	drum_note 3, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 2, 1
	sound_ret
