extends Button

func _ready():
	self.pressed.connect(_play_button_pressed_sound)

func _play_button_pressed_sound():
	SfxMusicPlayer.play_sound(SfxMusicPlayer.SoundType.BUTTON_CLICK)
