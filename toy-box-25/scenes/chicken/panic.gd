extends ChickenState

@export var panic_duration: Vector2 = Vector2(2.0, 4.0)
@export var panic_speed: float = 60.0
# New variable to control how twitchy the turn is
@export var wander_strength: float = 25.0

var move_dir: Vector2
var walk_timer: float = 0.0

func _ready():
	pass

func enter():
	if %PanicTimer.is_stopped():
		%ChickenAnimation.play("Panic") # Or "idle" if you have it
		move_dir = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
		walk_timer = randf_range(panic_duration.x, panic_duration.y)
		%PanicTimer.start()
		
	# Randomize how long we idle

func update(delta: float):
	# Vary direction by a bit every update
	var rotation_amount = deg_to_rad(randf_range(-10, 10))
	move_dir = move_dir.rotated(rotation_amount * wander_strength * delta)
	chicken.velocity = move_dir * panic_speed
	
	chicken.move_and_slide()	
	
	#Flip Sprite accordingly
	if chicken.velocity.x != 0:
		%ChickenAnimation.flip_h = chicken.velocity.x >0
		
	walk_timer -= delta
	if walk_timer <= 0:
		
		transition_to("Idle")
