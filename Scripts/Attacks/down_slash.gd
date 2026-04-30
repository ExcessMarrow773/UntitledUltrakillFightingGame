extends Node2D

@onready var collider = $Area2D
@onready var character = self.get_parent()
@export var damage = 20.0
@export var knockback_magnitude = 500

var collisions = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	#if body == character: return
	
	if (character.PLAYER_ID == body.PLAYER_ID): return
	print(character.PLAYER_ID, body.PLAYER_ID, self.get_parent().PLAYER_ID)
	body.health -= damage
	#var knockback = body.get_parent().position - character.position
	#knockback = knockback.normalized()
	#knockback.x *= knockback_magnitude; knockback.y *= knockback_magnitude
	#body.velocity.y = 0
	#body.velocity += knockback
	#body.velocity.x = abs(body.velocity.x) * character.direction_round
	
	body.velocity += character.velocity
	body.stun = true
	if (character.direction_round == body.direction_round):
		body.direction_round *= -1
		
		#print(knockback)
		#print(body.velocity)
		
