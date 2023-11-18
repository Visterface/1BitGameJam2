extends StaticBody3D


var speed = 45
# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.basis.x *speed *delta

func _on_area_3d_body_entered(body):
	if body.is_in_group("enemy") or body.name =="world_body":
		if body.is_in_group("enemy"):
			body.hurt(5)
		queue_free()
