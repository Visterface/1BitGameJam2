extends CharacterBody3D

@onready var camera = $Camera3D
const SPEED = 2.0
const JUMP_VELOCITY = 4.5
var life = SignalHandler.life
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var mouse_sensitivity = 0.002

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	SignalHandler.emit_signal("player_pos", self.position)
	if SignalHandler.kills_needed <= 70 and SignalHandler.kills_needed > 28:
		$Camera3D/RocketLauncher.visible = false
		$Camera3D/MashineGun.visible = true
	elif SignalHandler.kills_needed <= 28 and SignalHandler.kills_needed > 4:
		$Camera3D/MashineGun.visible = false
		$Camera3D/pistol.visible = true
	elif SignalHandler.kills_needed <= 4:
		$Camera3D/pistol.visible = false
		$Camera3D/Sword.visible = true
		
func get_weapon():
	var weapons = $Camera3D.get_children()
	for weapon in weapons:
		if weapon.is_visible_in_tree():
			return weapon

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	
func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))
	if Input.is_action_just_pressed("fire"):
		get_weapon().fire()

func get_damage(damage):
	life = life - damage
	SignalHandler.life = life

