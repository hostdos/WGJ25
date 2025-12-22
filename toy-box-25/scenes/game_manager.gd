extends Node

signal amount_chickens_changed(new_amount_chickens: int)

var amount_chickens: int = 0:
	set(new_amount_chickens):
		amount_chickens = new_amount_chickens
		amount_chickens_changed.emit(amount_chickens)

func _ready():
	pass
