extends CharacterBody3D

var player = null
var life = 20
var run_speed = 1.3
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalHandler.connect("player_pos", handle_player_pos)
	$AnimatedSprite3D.play("default")
func handle_player_pos(player_pos):
	player = player_pos
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	if player:
		velocity = position.direction_to(player) * run_speed
	move_and_slide()
	
func hurt(damage):
	life = life - damage
	if life <=0:
		SignalHandler.kills_needed -= 1
		print(SignalHandler.kills_needed)
		queue_free()


func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		body.get_damage(1)
