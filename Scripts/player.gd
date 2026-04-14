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
var attack := false
var animation = ""
var is_attacking

func _input(event):
	device = event.device
	if device == PLAYER_ID:
		direction = Input.get_axis("move_left", "move_right")
		attack = Input.is_action_pressed("attack")
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

func _physics_process(delta: float) -> void:
	var did_move = (lastX != position.x) or (lastY != position.y)
	if direction == 0 and !is_attacking:
		animation = "idle"
		$AnimatedSprite2D.play("idle")
	elif !is_attacking:
		animation = "walk"
		$AnimatedSprite2D.play("walk")
		
	if attack:
		is_attacking = true
		animation = "attack"
		$AnimatedSprite2D.play("attack")
	
	if direction < 0 and !is_attacking:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.offset.x = -8
	elif !is_attacking and (animation != "attack"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.offset.x = 0
	

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



func _on_animated_sprite_2d_animation_finished() -> void:
	if animation == "attack":
		is_attacking = false
		
	animation = ""
