extends ChickenState

# Minimum speed before we consider them "stopped" and switch to Idle
@export var stop_threshold: float = 1.0

var velocity_vector: Vector2 = Vector2.ZERO

func enter():
	print("he launched")
	print(chicken.velocity)
	#@TODO Make chicken non-collision, stop Launch after 2 Seconds
	%ChickenAnimationPlayer.play("Spawn")
	%ChickenAnimation.play("Launch")

func update(delta: float):
	# 1. Apply Velocity
	print(chicken.velocity)
	chicken.move_and_slide()
	
	# 3. Visuals
	if chicken.velocity.x != 0:
		%ChickenAnimation.flip_h = chicken.velocity.x < 0

func exit():
	pass
