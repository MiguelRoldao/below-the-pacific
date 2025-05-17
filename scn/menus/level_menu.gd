class_name LevelMenu extends Control

# button scenes
@onready var button_resume = $CenterContainer/VBoxContainer/ButtonResume
@onready var button_exit = $CenterContainer/VBoxContainer/ButtonExit

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	button_resume.button_up.connect(resume_game)
	button_exit.button_up.connect(exit_game)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("pause"):
		get_viewport().set_input_as_handled()
		resume_game()

func resume_game() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	queue_free()

func exit_game() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
