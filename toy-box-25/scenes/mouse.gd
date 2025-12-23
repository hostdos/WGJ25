extends Node2D

var move_speed: float = 60.0

func _process(delta):
	var closest_chicken: Chicken = get_closest_uncooked_chicken()
	var target_position: Vector2
	
	if closest_chicken == null:
		target_position = Vector2(
			randf_range(0.0, 400.0),
			randf_range(0.0, 360.0))
	else:
		target_position = closest_chicken.global_position
		if global_position.distance_to(closest_chicken.global_position) <= 50.0:
			closest_chicken.start_panic()
	
		if global_position.distance_to(closest_chicken.global_position) <= 2.0:
			closest_chicken.cook_him()
	
	var direction: Vector2 = (target_position - global_position).normalized()
	global_position += direction * move_speed * delta

func get_closest_uncooked_chicken() -> Chicken:
	var start_position = position

	var closest_chicken: Chicken = null
	var closest_range: int = INF

	var chickens = get_tree().get_nodes_in_group("chicken")
	for chicken in chickens:
		if not chicken is Chicken:
			continue
		
		if chicken.get_chicken_state() is CoockedState:
			continue
		
		var distance = start_position.distance_to(chicken.global_position)
		if distance < closest_range:
			closest_range = distance
			closest_chicken = chicken

	if closest_chicken:
		return closest_chicken
	else:
		return null
