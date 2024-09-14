extends Arrow


func _process(delta: float) -> void:
	target = $"../Enemy".position - $"../Watchman".position
