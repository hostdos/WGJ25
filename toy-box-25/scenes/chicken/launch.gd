extends ChickenState

# Deceleration (friction) so they eventually stop sliding
@export var drag: float = 2.0 
# Minimum speed before we consider them "stopped" and switch to Idle
@export var stop_threshold: float = 10.0

var velocity_vector: Vector2 = Vector2.ZERO

func enter():
	print("he launched")
	chicken.collision_layer = 8
	chicken.collision_mask = 8
	chicken.animation.play("Launch")
	# Make them spin while flying! (Optional fun effect)
	chicken.animation.speed_scale = 3.0

func set_initial_velocity(v: Vector2):
	velocity_vector = v

func update(delta: float):
	# 1. Apply Velocity
	chicken.velocity = velocity_vector
	chicken.move_and_slide()
	
	# 2. Apply Drag (Slow down over time)
	# lerp the velocity towards Zero
	velocity_vector = velocity_vector.lerp(Vector2.ZERO, drag * delta)
	
	# 3. Visuals
	if chicken.velocity.x != 0:
		chicken.animation.flip_h = chicken.velocity.x < 0

	# 4. Check if stopped
	if velocity_vector.length() < stop_threshold:
		chicken.collision_layer = 1
		chicken.collision_mask = 1
		transition_to("Idle")

func exit():
	chicken.animation.speed_scale = 1.0
