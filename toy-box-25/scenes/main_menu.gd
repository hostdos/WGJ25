extends CanvasLayer

@export var discordlink: String = "https://discord.gg/Fn7VE7xvZ3"

func _ready():
	%StartButton.pressed.connect(_on_start_button_pressed)
	%ExitButton.pressed.connect(_on_exit_button_pressed)
	%DiscordButton.pressed.connect(_on_discord_button_pressed)

func _on_start_button_pressed():
	print("Start Button pressed")
	%MainMenuAnimation.play("Intro")

func _on_exit_button_pressed():
	print("Quit Button pressed")
	get_tree().quit()

func _on_discord_button_pressed():
	OS.shell_open(discordlink)

func go_to_game():
	get_tree().change_scene_to_file("res://scenes/map.tscn")
