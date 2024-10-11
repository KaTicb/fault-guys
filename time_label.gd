extends Label

@export var time_elapsed = 0.0


func _process(delta: float) -> void:
	time_elapsed += delta
	text = "Time: " + str(time_elapsed).pad_decimals(2)
