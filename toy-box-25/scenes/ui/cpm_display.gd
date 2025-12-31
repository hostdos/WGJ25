extends HBoxContainer
@onready var label: Label = %cpmlabel

# A list to store the time (in msec) of every chicken cooked
var kill_timestamps: Array[int] = [] 

func _ready() -> void:
	# Connect to the global signal from GameManager
	# (Assuming GameManager still emits 'score_updated' when a chicken dies)
	GameManager.amount_poulet_cooked.connect(_on_chicken_cooked)

func _on_chicken_cooked(_new_total_score: int) -> void:
	# 1. Add the current timestamp to our local list
	kill_timestamps.append(Time.get_ticks_msec())

func _process(_delta: float) -> void:
	# 2. Define the cutoff time (Current time - 60 seconds)
	var now = Time.get_ticks_msec()
	var cutoff = now - 60000 
	
	# 3. Clean up old kills
	# Remove any timestamps from the front of the list if they are older than the cutoff
	while kill_timestamps.size() > 0 and kill_timestamps[0] < cutoff:
		kill_timestamps.pop_front()
	
	# 4. The size of the list = exact amount of kills in the last 60s
	var current_cpm = kill_timestamps.size()
	
	label.text = "CPM: %d" % current_cpm
