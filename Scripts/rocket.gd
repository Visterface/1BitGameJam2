extends Node3D

var explosion_scene = preload("res://Scenes/explosion.tscn")
var speed = 15
# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.basis.x *speed *delta


func _on_area_3d_body_entered(body):
	if body.is_in_group("enemy") or body.name =="world_body":
		var explosion = explosion_scene.instantiate()
		get_tree().get_root().add_child(explosion)
		explosion.position = self.position
		queue_free()
	


func _on_timer_timeout():
	var explosion = explosion_scene.instantiate()
	get_tree().get_root().add_child(explosion)
	explosion.position = self.position
	queue_free()

