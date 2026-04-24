extends CharacterBody2D

@export var JUMP_VELOCITY := -400
@export var SPEED = 320
@export var MAX_HEALTH = 100
@export_enum("Player 1", "Player 2") var PLAYER_ID: int


@onready var sprite2d = self.get_child(1)

var lastX = 0
var lastY = 0
var device

var health = MAX_HEALTH
var playerInput: float
var direction := 0
var attack := false
var animation = ""
var is_attacking

## Attacks
var down_slash_attack = preload("res://Scenes/Attacks/down_slash.tscn")




func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

func _input(event):
	device = event.device
	
	if device == PLAYER_ID:
		direction = Input.get_axis("move_left", "move_right")
		attack = Input.is_action_pressed("attack")
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif Input.is_action_just_pressed("restart"):
			death()

func _physics_process(delta: float) -> void:
	var did_move = (lastX != position.x) or (lastY != position.y)
	var anim_flip = direction < 0
	
	
	if direction == 0 and !is_attacking:
		animation = "idle"
		$AnimatedSprite2D.play("idle")
	elif !is_attacking:
		animation = "walk"
		$AnimatedSprite2D.play("walk")
		
	if attack and !is_attacking:
		is_attacking = true
		animation = "attack"
		$AnimatedSprite2D.play("attack")
		var scene_instance = down_slash_attack.instantiate()
		add_child(scene_instance)
		
		if $AnimatedSprite2D.flip_h: scene_instance.scale.x *= -1
		
		await $AnimatedSprite2D.animation_finished
		remove_child(scene_instance)

	if direction < 0 and !is_attacking:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.offset.x = -8
	elif !is_attacking and (animation != "attack"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.offset.x = 0
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = direction * SPEED
	

	# Handles respawn/ restart
	if Input.is_action_just_pressed("restart"):
		death()

	lastY = position.y
	lastX = position.x

	move_and_slide()
	
	if (health <= 0):
		death()
	

func death():
	self.visible = false
	await wait(1.0)
	self.visible = true
	self.position = $"../Node2D".position


func _on_animated_sprite_2d_animation_finished() -> void:
	if animation == "attack":
		is_attacking = false
		
	animation = ""
