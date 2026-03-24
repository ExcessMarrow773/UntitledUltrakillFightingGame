extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var death_plane: Area2D = $"../Death Plane"

@export var MAX_SPEED := 300
@export var JUMP_VELOCITY := -350



var SPEED = 0
var ACCELERATION = 500
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
	var did_move = (lastX == position.x) and (lastY == position.y)
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
	#if direction: # Adjust the threshold (0.1) as needed:
		#$AnimatedSprite2D.flip_h = flip(direction)
		
		if did_move:
			SPEED = min(SPEED + ACCELERATION * delta, MAX_SPEED)
			
		velocity.x = direction * SPEED
		
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		SPEED = 0
	
	move_and_slide()
	lastY = position.y
	lastX = position.x
	if Input.is_action_just_pressed("quit"): get_tree().quit()
	
