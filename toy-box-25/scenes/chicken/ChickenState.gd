class_name ChickenState
extends Node

# The state knows about the chicken so it can move it
var chicken: CharacterBody2D
var animation: AnimatedSprite2D
var collider: CollisionPolygon2D

# Called when the State Machine enters this state
func enter():
	pass

# Called when the State Machine exits this state
func exit():
	pass

# Called every physics frame (replacing _physics_process)
func update(_delta: float):
	pass
	
# Helper to switch states
func transition_to(state_name: String):
	get_parent().change_state(state_name)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
