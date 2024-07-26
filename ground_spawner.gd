extends Node

var _quantity = 0
var _ground_a
var _ground_b
var ground: PackedScene = preload("res://ground.tscn")

func _ready() -> void:
	_ground_a = ground.instantiate()
	_ground_b = ground.instantiate()
	add_child(_ground_a)
	add_child(_ground_b)

# TODO: ground doesn't generate when player presses play and then resize window
func spawn() -> void:
	_ground_a.position.x = get_viewport().size.x * _quantity
	_ground_a.position.y = get_viewport().size.y - 84
	_ground_b.position.x = get_viewport().size.x * (_quantity + 1)
	_ground_b.position.y = get_viewport().size.y - 84
	if _ground_a.did_leave_screen:
		_quantity += 1
		_ground_a.did_leave_screen = false
