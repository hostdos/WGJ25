extends Node2D

class_name ChickenSpawner
@export var spawn_state: ChickenState
@export var chicken_scene: PackedScene
@export var launch_velocity: float = 50.0
var spawn_queue: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.amount_chickens_changed.connect(queue_chicken)
	GameManager.global_timer.timeout.connect(queue_check)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func queue_check():
	if spawn_queue > 0:
		spawn_chicken(1)

func queue_chicken(amount: int):
	if amount >= 0:
		spawn_queue += amount

func spawn_chicken(amount: int = 1):
	#check if chicken is upgraded?
	for i in range(amount):
		var instance = chicken_scene.instantiate()
		instance.scale = Vector2(0.1,0.1)
		spawn_queue -= amount
		if GameManager.amount_chickens > 0:
			GameManager.amount_chickens -= amount
		
		# set pos
		instance.global_position = get_random_position()
		
		# launch the mfer
		instance.find_child("StateMachine").initial_state = spawn_state
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
	var sling_vector = launched_chicken.global_position - %SlingPoint.global_position
	
	var launch_velocity = sling_vector.normalized() * launch_velocity
	
	launched_chicken.velocity = launch_velocity
