extends Control
@export var Player1:CharacterBody2D
@export var Player2:CharacterBody2D

@onready var Player1_healthBar = $"Player1 Health"
@onready var Player2_healthBar = $"Player2 Health"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player1_healthBar.max_value = Player1.MAX_HEALTH
	Player2_healthBar.max_value = Player2.MAX_HEALTH

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var p1_target_health:float = Player1.health
	var p2_target_health:float = Player2.health
	
	var weight = randf_range(0.05, 0.1)
	
	Player1_healthBar.value = lerp(Player1_healthBar.value, p1_target_health, weight)
	Player2_healthBar.value = lerp(Player2_healthBar.value, p2_target_health, weight)
