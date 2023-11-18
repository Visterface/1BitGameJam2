extends Node3D

var bullet_scene = preload("res://Scenes/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fire():
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.transform = $Marker3D.global_transform
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
