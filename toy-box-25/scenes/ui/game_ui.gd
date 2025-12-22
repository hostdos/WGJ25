extends Control

func _ready():
	GameManager.amount_chickens_changed.connect(_update_chicken_amount)
	%AddChickenButton.pressed.connect(_add_chicken)

func _update_chicken_amount(new_amount_chickens: int):
	%AmountChickens.text = str(new_amount_chickens)

func _add_chicken():
	GameManager.amount_chickens = GameManager.amount_chickens + 1
