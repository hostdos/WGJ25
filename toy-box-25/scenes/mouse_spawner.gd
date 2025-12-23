extends Node

const MOUSE_SCENE = preload("res://scenes/mouse.tscn")

func _ready():
	GameManager.amount_mice_changed.connect(_spawn_mouse)
	
func _spawn_mouse(_amount_mice: int):
	var mouse_scene: Node2D = MOUSE_SCENE.instantiate()
	mouse_scene.position = Vector2(400, 100)
	get_tree().current_scene.add_child(mouse_scene)
