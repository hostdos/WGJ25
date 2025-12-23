extends HBoxContainer

@export var sprite_upgrade: Texture
@export var sprite_spending_currency: Texture
@export var base_price: int = 10
@export var base_interval: int = 5

signal on_upgraded
signal on_progress_bar_full

var idle_upgrade_level: int = 0

func _ready():
	_update_ui(GameManager.amount_poulet)
	GameManager.amount_poulet_changed.connect(_update_ui)
	%UpgradeButton.pressed.connect(_on_upgrade_button_clicked)
	%Timer.timeout.connect(_on_timer_timeout)
	_update_poulets_needed()
	%UpgradeSprite.texture = sprite_upgrade
	%SpendingCurrencySprite.texture = sprite_spending_currency
	
func _process(_delta):
	if base_interval > 0:
		if %Timer.time_left > 0:
			%ProgressBar.value = 1.0 - (%Timer.time_left / %Timer.wait_time)
	
func _update_ui(_new_poulets: int):
	%UpgradeButton.disabled = GameManager.amount_poulet < _get_price()

func _on_upgrade_button_clicked():
	if GameManager.amount_poulet >= _get_price():
		GameManager.amount_poulet = GameManager.amount_poulet - _get_price()
		idle_upgrade_level += 1
		_on_idle_upgrade_level_changed()

func _on_idle_upgrade_level_changed():
	on_upgraded.emit()
	if base_interval > 0:
		%Timer.wait_time = base_interval
		if %Timer.is_stopped():
			%Timer.start()
	_update_poulets_needed()
	%LevelLabel.text = str(idle_upgrade_level)

func _on_timer_timeout():
	on_progress_bar_full.emit()

func _update_poulets_needed():
	%UpgradeButton.text = str(_get_price()) + "     "

func _get_price():
	return base_price + idle_upgrade_level * (base_price / 2)
