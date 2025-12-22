extends HBoxContainer

@export var chickens_needed: int

var idle_upgrade_level: int = 0

func _ready():
	_update_ui(GameManager.amount_chickens)
	GameManager.amount_chickens_changed.connect(_update_ui)
	%UpgradeButton.pressed.connect(_on_upgrade_button_clicked)
	%Timer.timeout.connect(_on_timer_timeout)
	
func _process(delta):
	if %Timer.time_left > 0:
		%ProgressBar.value = 1.0 - (%Timer.time_left / %Timer.wait_time)
	
func _update_ui(amount_chickens: int):
	%UpgradeButton.disabled = amount_chickens < chickens_needed

func _on_upgrade_button_clicked():
	if GameManager.amount_chickens >= chickens_needed:
		GameManager.amount_chickens = GameManager.amount_chickens - chickens_needed
		idle_upgrade_level = idle_upgrade_level + 1
		_on_idle_upgrade_level_changed()

func _on_idle_upgrade_level_changed():
	%Timer.wait_time = 9.0
	if %Timer.is_stopped():
		%Timer.start()


func _on_timer_timeout():
	GameManager.amount_chickens = GameManager.amount_chickens + idle_upgrade_level
