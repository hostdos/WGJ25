extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#make chicken mouse interactable
	input_pickable = true
	# 2. Connect the mouse hover signal
	mouse_entered.connect(_on_mouse_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_panic():
	find_child("StateMachine").change_state("Panic")

func _on_mouse_entered() -> void:
	print("trying to start panic")
	start_panic()
