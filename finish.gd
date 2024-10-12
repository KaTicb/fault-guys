extends CSGCombiner3D


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body:
		if body.has_method("take_damage"):
			var time_elapsed = $"../TimeLabel".time_elapsed
			EventBus.finish_progress.emit(time_elapsed)
			get_tree().change_scene_to_file("res://finish_panel.tscn")
