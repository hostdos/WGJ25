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
	var soundinstance = AudioStreamPlayer.new()
	soundinstance.bus = "Sfx"
	match sound_type:
		SoundType.BUTTON_CLICK:
			soundinstance.stream = load("res://assets/sound_music/sfxpack/sfxpack_8.wav")
		SoundType.CHICKEN_COOKED:
			soundinstance.stream = load("res://assets/sound_music/sfxpack/sfxpack_44.wav")
			soundinstance.volume_db -= 4.0
		SoundType.CHICKEN_SPAWN:
			soundinstance.volume_db -= 10.0
			soundinstance.stream = load("res://assets/sound_music/sfxpack/sfxpack_63.wav")
		SoundType.CHICKEN_PANIC:
			soundinstance.volume_db -= 8.0
			soundinstance.stream = load("res://assets/sound_music/sfxpack/sfxpack_52.wav")
		SoundType.POULET_PICKUP:
			soundinstance.volume_db -= 4.0
			soundinstance.stream = load("res://assets/sound_music/sfxpack/sfxpack_61.wav")
	if stream != null:
		match randomize:
			RandomizeStrength.NONE:
				soundinstance.pitch_scale = 1
			RandomizeStrength.BASIC:
				soundinstance.pitch_scale = randf_range(min_pitch, max_pitch)
			RandomizeStrength.HEAVY:
				soundinstance.pitch_scale = randf_range((min_pitch * min_pitch), (max_pitch * max_pitch))
			RandomizeStrength.EXTREME:
				soundinstance.pitch_scale = randf_range((min_pitch * min_pitch * min_pitch), (max_pitch * max_pitch * max_pitch))
	get_parent().add_child(soundinstance)
	soundinstance.play()
	# Wait for the signal to be emitted, then run the next line of code
	await soundinstance.finished
	# After the sound finishes, free the audio player node
	soundinstance.queue_free()
