extends Node3D

var bullet_scene = preload("res://Scenes/bullet.tscn")
var shootable = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if shootable and Input.is_action_pressed("fire"):
		shootable = false
		var bullet = bullet_scene.instantiate()
		add_child(bullet)
		bullet.transform = $Marker3D.global_transform
		await get_tree().create_timer(0.1).timeout
		shootable = true

func fire():
	shootable = true

