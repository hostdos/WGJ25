extends AudioStreamPlayer

enum SoundType {
	BUTTON_CLICK,
	CHICKEN_COOKED,
	CHICKEN_SPAWN,
	CHICKEN_PANIC,
	POULET_PICKUP,
	ROBOT_SEND,
	MOUSE_SEND
}

enum RandomizeStrength {
	NONE,
	BASIC,
	HEAVY,
	EXTREME
}

var min_pitch = 0.9
var max_pitch = 1.1
var default_volume = 0.0

func play_sound(sound_type: SoundType, randomize: RandomizeStrength = RandomizeStrength.BASIC):
	volume_db = default_volume
	match sound_type:
		SoundType.BUTTON_CLICK:
			stream = load("res://assets/sound_music/sfxpack/sfxpack_8.wav")
		SoundType.CHICKEN_COOKED:
			stream = load("res://assets/sound_music/sfxpack/sfxpack_44.wav")
		SoundType.CHICKEN_SPAWN:
			volume_db -= 10.0
			stream = load("res://assets/sound_music/sfxpack/sfxpack_63.wav")
		SoundType.CHICKEN_PANIC:
			volume_db -= 8.0
			stream = load("res://assets/sound_music/sfxpack/sfxpack_52.wav")
		SoundType.POULET_PICKUP:
			volume_db -= 8.0
			stream = load("res://assets/sound_music/sfxpack/sfxpack_61.wav")
	if stream != null:
		match randomize:
			RandomizeStrength.NONE:
				pitch_scale = 1
			RandomizeStrength.BASIC:
				pitch_scale = randf_range(min_pitch, max_pitch)
			RandomizeStrength.HEAVY:
				pitch_scale = randf_range((min_pitch * min_pitch), (max_pitch * max_pitch))
			RandomizeStrength.EXTREME:
				pitch_scale = randf_range((min_pitch * min_pitch * min_pitch), (max_pitch * max_pitch * max_pitch))
		print(volume_db)
		play()
