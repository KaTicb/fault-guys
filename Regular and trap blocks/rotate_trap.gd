extends CSGCombiner3D

@export var rotation_speed = 2

func _process(delta: float) -> void:
	if rotation_degrees.y > 360:
		rotation_degrees.y -= 360
	rotation_degrees.y += rotation_speed
