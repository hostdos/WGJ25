extends Node

signal amount_chickens_changed(new_amount_chickens: int)
signal amount_poulet_changed(new_amount_poulet: int)
signal amount_mice_changed(new_amount_mice: int)
signal amount_robot_changed(new_amount_robot: int)

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
		
var amount_mice: int = 0:
	set(new_amount_mice):
		var amount_gained = new_amount_mice - amount_mice
		amount_mice = new_amount_mice
		amount_mice_changed.emit(amount_gained)

var amount_robot: int = 0:
	set(new_amount_robot):
		var amount_gained = new_amount_robot - amount_robot
		amount_robot = new_amount_robot
		amount_robot_changed.emit(amount_gained)

@onready var global_timer: Timer = %GlobalClock
