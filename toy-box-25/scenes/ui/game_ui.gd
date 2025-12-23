extends Control

var upgrade_size: int = 1
const color_selected: Color = Color(0.4, 0.85, 0.5, 0.65)
const color_unselected: Color = Color(0.13, 0.13, 0.13, 1.0)

func _ready():
	GameManager.amount_poulet_changed.connect(_update_poulet_amount)
	GameManager.amount_chickens_changed.connect(_update_chicken_amount)
	%TimerIdleUpgrade.on_progress_bar_full.connect(_add_chickens)
	%MouseIdleUpgrade.on_upgraded.connect(_add_mouse)
	%RobotIdleUpgrade.on_upgraded.connect(_upgrade_timer.bind(%RobotIdleUpgrade))
	%RobotIdleUpgrade.on_progress_bar_full.connect(_send_robot)
	%AddChickenButton.pressed.connect(_add_chicken)

func _update_chicken_amount(_new_chickens: int):
	%AmountChickens.text = str(GameManager.amount_chickens)

func _update_poulet_amount(_new_poulets: int):
	%AmountPoulets.text = str(GameManager.amount_poulet)

func _send_robot():
	GameManager.amount_robot += 1

func _add_chicken():
	GameManager.amount_chickens += 1

func _add_chickens():
	GameManager.amount_chickens += %TimerIdleUpgrade.idle_upgrade_level

func _add_mouse():
	GameManager.amount_mice += 1
<<<<<<< HEAD
=======

func _init_upgrade_size_buttons():
	%Upgrade1Button.pressed.connect(_on_upgrade_size_button_pressed.bind(1))
	%Upgrade10Button.pressed.connect(_on_upgrade_size_button_pressed.bind(10))
	%Upgrade25Button.pressed.connect(_on_upgrade_size_button_pressed.bind(25))
	%UpgradeMaxButton.pressed.connect(_on_upgrade_size_button_pressed.bind(99))
	_update_upgrade_size_buttons()
	
func _on_upgrade_size_button_pressed(upgrade_size: int):
	self.upgrade_size = upgrade_size
	_update_upgrade_size_buttons()

func _update_upgrade_size_buttons():
	_set_button_background_color(%Upgrade1Button, color_unselected)
	_set_button_background_color(%Upgrade10Button, color_unselected)
	_set_button_background_color(%Upgrade25Button, color_unselected)
	_set_button_background_color(%UpgradeMaxButton, color_unselected)
	match upgrade_size:
		1:
			_set_button_background_color(%Upgrade1Button, color_selected)
		10:
			_set_button_background_color(%Upgrade10Button, color_selected)
		25:
			_set_button_background_color(%Upgrade25Button, color_selected)
		99:
			_set_button_background_color(%UpgradeMaxButton, color_selected)

func _set_button_background_color(button: Button, color: Color):
	for state in ["normal", "hover", "pressed", "disabled"]:
		var style := StyleBoxFlat.new()
		style.bg_color = color
		button.add_theme_stylebox_override(state, style)

func _upgrade_timer(upgrade_node: Node):
	upgrade_node._upgrade_timer()
>>>>>>> df718ca (insane various changes)
