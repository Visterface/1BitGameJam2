extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire():
	$AnimationPlayer.play("new_animation")

func _on_area_3d_body_entered(body):
	if body.is_in_group("enemy") or body.name =="world_body":
		if body.is_in_group("enemy"):
			body.hurt(10)