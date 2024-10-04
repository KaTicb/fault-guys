extends Node3D


func rotate_by_character():
	if Input.is_action_pressed("ui_down"):
		rotation.y = PI
	elif Input.is_action_pressed("ui_up"):
		rotation.y = 0
	elif Input.is_action_pressed("ui_left"):
		rotation.y = PI / 2
	elif Input.is_action_pressed("ui_right"):
		rotation.y = -PI / 2
