class_name Chicken
extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#make chicken mouse interactable
	input_pickable = true
	# 2. Connect the mouse hover signal
	%ClickArea.mouse_entered.connect(_on_mouse_entered)
	%ClickArea.input_event.connect(_on_input_event)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		cook_him()

func start_panic():
	%StateMachine.change_state("Panic")

func _on_mouse_entered() -> void:
	if %StateMachine.current_state != %Cooked:
		start_panic()

func cook_him():
	if %StateMachine.current_state == %Cooked:
		GameManager.amount_poulet += 1
		SfxMusicPlayer.play_sound(SfxMusicPlayer.SoundType.POULET_PICKUP)
		self.queue_free()
	if %StateMachine.current_state != %Cooked:
		%StateMachine.change_state("Cooked")

func panic_him():
	%StateMachine.change_state("Panic")

func launch():
	%StateMachine.change_state("Launch")

func get_chicken_state() -> ChickenState:
	return %StateMachine.current_state
