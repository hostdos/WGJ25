extends AudioStreamPlayer

enum SoundType {
	BUTTON_CLICK,
}

func play_sound(sound_type: SoundType):
	match sound_type:
		SoundType.BUTTON_CLICK:
			stream = load("res://assets/sound_music/sfxpack/sfxpack_8.wav")
	if stream != null:
		play()
