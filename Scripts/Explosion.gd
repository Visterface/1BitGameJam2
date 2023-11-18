extends Node3D

var damage = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite3D.play("default")

func _on_area_3d_body_entered(body):
	if body.is_in_group("enemy"):
		body.hurt(20)


func _on_animated_sprite_3d_animation_finished():
	queue_free()
