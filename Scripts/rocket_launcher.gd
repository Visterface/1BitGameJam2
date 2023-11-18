extends Node3D

var rocket_scene = preload("res://Scenes/rocket.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fire():
	var rocket = rocket_scene.instantiate()
	add_child(rocket)
	rocket.transform = $Marker3D.global_transform
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
