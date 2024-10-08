extends MeshInstance3D

var is_body_inside: bool = false
var is_block_active: bool = false
var is_delay: bool = false
var material: StandardMaterial3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body:
		if body.has_method("take_damage"):
			is_body_inside = true
			is_block_active = true
			if !is_delay:
				block_activity(body)
			print("en")


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body:
		if body.has_method("take_damage"):
			is_body_inside = false
			print("ex")


func make_unique_buttons():
	material = get("surface_material_override/0").duplicate()
	set("surface_material_override/0", material)


func _ready() -> void:
	make_unique_buttons()


func block_activity(body: CharacterBody3D = null):
	if is_block_active:

		material.albedo_color = Color.ORANGE
		
		is_delay = true
		await get_tree().create_timer(1).timeout

		material.albedo_color = Color.RED
		if is_body_inside and body:
				body.take_damage(50)

		await get_tree().create_timer(5).timeout
		
		is_delay = false
		material.albedo_color = Color.WHITE
		is_block_active = false
