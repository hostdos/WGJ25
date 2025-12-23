extends ChickenState

@export var idle_duration_range: Vector2 = Vector2(1.0, 3.0)
var timer: float = 0.0

func enter():
	%ChickenAnimation.play("Idle") # Or "idle" if you have it
	%ChickenAnimation.stop() # Stop animating to stand still
	%ChickenAnimation.frame = 1 # Stand on specific frame
	
# Randomize how long we idle
	timer = randf_range(idle_duration_range.x, idle_duration_range.y)

func update(delta: float):
	timer -= delta
	if timer <= 0:
		# Randomly choose what to do next
		var roll = randf()
		if roll < 0.7:
			transition_to("Walk")
		else:
			transition_to("Idle")
