extends ProgressBar

@onready var character = $"../Bot"


func _process(delta: float) -> void:
	value = character.hp
