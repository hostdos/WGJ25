extends ChickenState

@export var speed: float = 30.0
@export var walk_duration_range: Vector2 = Vector2(1.0, 3.0)

var walk_timer: float = 0.0
var move_dir: Vector2

func enter():
	%ChickenAnimation.play("Walking")
	#get rand direction
	move_dir = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	walk_timer = randf_range(walk_duration_range.x, walk_duration_range.y)

func update(delta: float):
	chicken.velocity = move_dir * speed
	chicken.move_and_slide()	
	
	#Flip Sprite accordingly
	if chicken.velocity.x != 0:
		%ChickenAnimation.flip_h = chicken.velocity.x >0
		
	walk_timer -= delta
	if walk_timer <= 0:
		transition_to("Idle")
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
