extends Node2D

class_name ChickenSpawner
@export var chicken_scene: PackedScene
@export var launch_velocity: float = 3.0
var spawn_timer: Timer
var spawn_queue: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.amount_chickens_changed.connect(queue_chicken)
	spawn_timer = %SpawnTimer
	spawn_timer.timeout.connect(queue_check)
	spawn_timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func queue_check():
	if spawn_queue > 0:
		spawn_chicken(1)

func queue_chicken(amount: int):
	spawn_queue += amount

func spawn_chicken(amount: int = 1):
	#check if chicken is upgraded?
	for i in range(amount):
		var instance = chicken_scene.instantiate()
		spawn_queue -= amount
		
		# set pos
		instance.global_position = get_random_position()
		
		# launch the mfer
		launch_him(instance)
		
		# add chicken as child of main scene instead of spawner
		get_parent().call_deferred("add_child",instance)

func get_random_position():
	#Random XY inside area2d
	var capsule : Rect2 = %SpawnCollider.shape.get_rect()
	var x = randi_range(capsule.position.x, capsule.position.x + capsule.size.x)
	var y = randi_range(capsule.position.y, capsule.position.y + capsule.size.y)
	
	return %SpawnPoint.global_position + Vector2(x,y)
	
func launch_him(launched_chicken):
	var sling_vector = %SlingPoint.global_position - launched_chicken.global_position	
	
	var launch_velocity = sling_vector * launch_velocity
	
	launched_chicken.call_deferred("launch", launch_velocity)
