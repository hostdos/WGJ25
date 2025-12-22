extends CanvasLayer

func _ready():
	%StartButton.pressed.connect(_on_start_button_pressed)
	%ExitButton.pressed.connect(_on_exit_button_pressed)

func _on_start_button_pressed():
	print("Start Button pressed")
	get_tree().change_scene_to_file("res://scenes/map.tscn")

func _on_exit_button_pressed():
	print("Quit Button pressed")
	get_tree().quit()
