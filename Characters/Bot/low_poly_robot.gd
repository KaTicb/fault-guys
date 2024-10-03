extends Node3D


func rotate_by_character(y, x):
	if Input.is_action_pressed("ui_down"):
		rotation.y = PI
	if Input.is_action_pressed("ui_up"):
		rotation.y = 0
	if Input.is_action_pressed("ui_left"):
		rotation.y = PI / 2
	if Input.is_action_pressed("ui_right"):
		rotation.y = -PI / 2
