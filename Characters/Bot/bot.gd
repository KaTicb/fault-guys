extends CharacterBody3D

@export
var movement_speed: float = 5

@export
var jump_velocity: float = 6

@export
var mouse_sensitivity: float = 0.3


func _input(event):
	if event is InputEventMouseMotion:
		rotate(Vector3.UP, deg_to_rad(-event.relative.x * mouse_sensitivity))
		

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_right", "ui_left", "ui_down" , "ui_up")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * movement_speed
		velocity.z = direction.z * movement_speed
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		velocity.z = move_toward(velocity.z, 0, movement_speed)
		
	$AnimationTree.set("parameters/conditions/walk", (velocity.x != 0 || velocity.z != 0) && is_on_floor())
	$AnimationTree.set("parameters/conditions/tpose", velocity.x == 0 && velocity.z == 0 && is_on_floor())
	$AnimationTree.set("parameters/conditions/tpose", !is_on_floor())

	move_and_slide()
