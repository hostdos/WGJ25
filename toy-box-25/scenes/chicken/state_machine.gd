extends Node

@export var initial_state: ChickenState
var current_state: ChickenState

func _ready() -> void:
	# Wait for owner (Chicken) to be ready
	await owner.ready
	
# Assign the chicken reference to all children states
	for child in get_children():
		if child is ChickenState:
			child.chicken = owner
			child.animation = owner.find_child("AnimatedSprite2D")
			child.collider = owner.find_child("CollisionPolygon2D")
	
	# Start the first state
	if initial_state:
		change_state(initial_state.name)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
		
func change_state(new_state_name: String):
	var new_state = get_node_or_null(new_state_name)
	
	if new_state:
		if current_state:
			current_state.exit()    
		current_state = new_state
		current_state.enter()


func _on_base_chicken_mouse_entered() -> void:
	pass # Replace with function body.
