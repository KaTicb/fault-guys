extends StaticBody3D

var is_body_inside: bool = false

@export var wind_speed: float = 1

func _on_body_entered(body: Node3D) -> void:
	if body:
		if body.has_method("take_damage"):
			$WindArea/WindParticles.emitting = true
			is_body_inside = true
			print("en")
			body.is_deviate = true
			while is_body_inside:
				rotation.y = deg_to_rad(randi_range(0, 360))
				
				body.deviation = transform.basis.x.normalized() * wind_speed
				print(body.velocity)
				await get_tree().create_timer(2).timeout
				


func _on_body_exited(body: Node3D) -> void:
	if body:
		if body.has_method("take_damage"):
			$WindArea/WindParticles.emitting = false
			body.deviation = Vector3.ZERO
			is_body_inside = false
			print("ex")
