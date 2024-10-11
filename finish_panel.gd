extends Control


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)


func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_panel.tscn")
