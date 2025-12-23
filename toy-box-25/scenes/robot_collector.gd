extends Node2D

@export var CollectionPoint: Vector2
var has_collected: bool = false
var move_speed: float = 70.0
var target_chicken: Chicken

func _process(delta):

	if target_chicken == null:
		target_chicken = get_closest_cooked_chicken()
	var target_position: Vector2 = CollectionPoint
	if has_collected:
		target_position = CollectionPoint
	
	if target_chicken != null and global_position.distance_to(target_chicken.global_position) <= 2.0:
		target_chicken.cook_him()
		has_collected = true
		go_home()
	
	var direction: Vector2 = (target_position - global_position).normalized()
	global_position += direction * move_speed * delta
	
	if global_position.distance_to(CollectionPoint) <= 1.0 and has_collected == true:
		queue_free()

func get_closest_cooked_chicken() -> Chicken:
	var start_position = position

	var closest_chicken: Chicken = null
	var closest_range: int = INF

	var chickens = get_tree().get_nodes_in_group("chicken")
	for chicken in chickens:
		if not chicken is Chicken:
			continue
		
		if not chicken.get_chicken_state() is CoockedState or chicken.is_in_group("pickedup"):
			continue
		
		var distance = start_position.distance_to(chicken.global_position)
		if distance < closest_range:
			closest_range = distance
			closest_chicken = chicken

	if closest_chicken:
		closest_chicken.add_to_group("pickedup")
		return closest_chicken
	else:
		return null

func go_home():
	var target_position = CollectionPoint
