extends Node3D


func rotate_by_character():
	if Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_left"):
			rotation.y = 3 * PI / 4
		elif Input.is_action_pressed("ui_right"):
			rotation.y = - 3 * PI / 4
		else:
			rotation.y = PI
			
	elif Input.is_action_pressed("ui_up"):
		if Input.is_action_pressed("ui_left"):
			rotation.y = PI / 4
		elif Input.is_action_pressed("ui_right"):
			rotation.y = - PI / 4
		else:
			rotation.y = 0
		
	elif Input.is_action_pressed("ui_left"):
		rotation.y = PI / 2
	elif Input.is_action_pressed("ui_right"):
		rotation.y = -PI / 2
