extends Node2D

@export var robot: PackedScene
@export var start_timer: float = 5.0
@export var timer_modulator: float = 0.9
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.amount_robot_changed.connect(_send_robot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _send_robot(amount: int):
	for i in amount:		
		var robot_scene: Node2D = robot.instantiate()
		robot_scene.CollectionPoint = %CollectPoint.global_position
		robot_scene.position = %CollectPoint.global_position
		get_tree().current_scene.add_child(robot_scene)
