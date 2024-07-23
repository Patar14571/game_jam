extends CharacterBody2D


@export var SPEED : float = 300.0
@export var JUMP_VELOCITY : float = -400.0
@export var SWIM_JUMP : float = -200
@export var SWIM_GRAVITY_FACTOR : float = 0.25
@export var SWIM_VELOCTIY_CAP : float = 200

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_in_water : bool = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		if(!is_in_water):
			velocity.y += gravity * delta
		else:
			velocity.y = clampf(velocity.y + (gravity * delta * SWIM_GRAVITY_FACTOR), -SWIM_VELOCTIY_CAP, SWIM_VELOCTIY_CAP )

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		if is_in_water == true:
			velocity.y += SWIM_JUMP

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_water_detection_2d_water_state_changed(is_in_water):
	self.is_in_water = is_in_water
	print(is_in_water)