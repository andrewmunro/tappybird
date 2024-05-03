extends CharacterBody2D

const GRAVITY = 1000
const JUMP_VELOCITY = -400.0
const MAX_VEL = 600

@onready var animated_sprite = $AnimatedSprite2D

var game_started = false
var target_rotation: float = 0.0
var time = 0

func start():
	game_started = true

func _physics_process(delta):
	time += delta * 5
	
	if game_started:
		# Add the gravity.
		velocity.y += GRAVITY * delta
		
		if velocity.y > MAX_VEL:
			velocity.y = MAX_VEL
	else:
		position.y += sin(time * 1) * 1
		
	# Handle jump
	if Input.is_action_just_pressed("tap"):
		velocity.y = JUMP_VELOCITY

	# update display rotation
	rotation = deg_to_rad(velocity.y * 0.08)

	move_and_slide()
