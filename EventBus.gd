extends Node

@export var time_finish: String = " "

signal finish_progress(time)

func _ready() -> void:
	finish_progress.connect(_on_finish_progress)


func _on_finish_progress(time):  
	time_finish = "Time: " + str(time).pad_decimals(2)
