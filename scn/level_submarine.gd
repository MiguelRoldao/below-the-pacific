extends Node3D

@onready var pause_menu_res := preload("res://scn/level_menu.tscn")

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("pause"):
		get_viewport().set_input_as_handled()
		add_child(pause_menu_res.instantiate())
