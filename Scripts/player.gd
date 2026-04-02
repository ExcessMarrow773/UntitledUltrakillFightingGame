extends CharacterBody2D

@export var MAX_SPEED := 300
@export var JUMP_VELOCITY := -500
@export var SPEED = 500

var CLIMB_SPEED = 200.0
var lastX = 0
var lastY = 0

func _ready() -> void:
	pass

func flip(direction):
	if direction == -1:
		return true
	else:
		return false

func _physics_process(delta: float) -> void:
	var did_move = (lastX != position.x) or (lastY != position.y)
	var direction := Input.get_axis("move_left", "move_right")
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handles respawn/ restart
	if Input.is_action_just_pressed("restart"):
		velocity = Vector2(0, 0)

	# Get the input direction and handle the movement/deceleration.
	velocity.x = direction * SPEED

	move_and_slide()
	lastY = position.y
	lastX = position.x
	if Input.is_action_just_pressed("quit"): get_tree().quit()
	
