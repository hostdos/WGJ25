extends Node2D

@export var robot: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%RobotTimer.timeout.connect(send_robot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func send_robot():
	var new_bot = robot.instantiate()
	pass
