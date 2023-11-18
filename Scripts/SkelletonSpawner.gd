extends Timer


var skelleton_scene = preload("res://Scenes/skelleton.tscn")
# Called when the node enters the scene tree for the first time.

func _on_timeout():
	var skelleton = skelleton_scene.instantiate()
	add_child( skelleton)
	skelleton.transform = $"..".global_transform
	$".".wait_time = randi_range(2,7)
