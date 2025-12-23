extends Node2D

@export var speed: float = 30.0
@export var wobbly: float = 50.0
@export var turn_radius: float = 90.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Instantly search a chicken that is not in group "pickedup"
	var all_chickens = get_tree().get_nodes_in_group("chicken")
	for chick in all_chickens:
		if not chick.is_in_group("pickedup"):
			pickup_chicken(chick)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func pickup_chicken(chick):
	pass
