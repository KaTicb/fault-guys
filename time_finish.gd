extends Label


func _ready() -> void:
	EventBus.finish_progress.connect(_finish_progress)
	

func _finish_progress(time):  
	text = "Time: " + str(time).pad_decimals(2)
