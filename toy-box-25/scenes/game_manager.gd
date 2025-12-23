extends Node

signal amount_chickens_changed(new_amount_chickens: int)

signal amount_poulet_changed(new_amount_poulet: int)

var amount_poulet: int = 0:
	set(new_amount_poulet):
		var amount_gained = new_amount_poulet - amount_poulet
		amount_poulet = new_amount_poulet
		amount_poulet_changed.emit(amount_gained)

var amount_chickens: int = 0:
	set(new_amount_chickens):
		var amount_gained = new_amount_chickens - amount_chickens
		amount_chickens = new_amount_chickens
		amount_chickens_changed.emit(amount_gained)

@onready var global_timer: Timer = %GlobalClock
