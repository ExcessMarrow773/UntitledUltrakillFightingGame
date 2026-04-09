extends CharacterBody2D

@export var JUMP_VELOCITY := -400
@export var SPEED = 320
@export_enum("Player 1", "Player 2") var PLAYER_ID: int

var lastX = 0
var lastY = 0
var device

func _ready() -> void:
	pass

var playerInput: float
var direction := 0

func _input(event):
	device = event.device
	if device == PLAYER_ID:
		direction = Input.get_axis("move_left", "move_right")
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
func _physics_process(delta: float) -> void:
	var did_move = (lastX != position.x) or (lastY != position.y)
	if velocity == Vector2(0, 0):
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.stop()
	print(direction)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Individual input detection
	

	# Handles respawn/ restart
	if Input.is_action_just_pressed("restart"):
		velocity = Vector2(0, 0)

	# Get the input direction and handle the movement/deceleration.
	velocity.x = direction * SPEED

	lastY = position.y
	lastX = position.x
	move_and_slide()
