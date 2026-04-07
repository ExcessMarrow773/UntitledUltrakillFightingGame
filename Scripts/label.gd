extends Label

@onready var player1 = %Player1
@onready var player2 = %Player2
var player1x = player1.x
var player1y = player1.y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player1x = player1.x
	player1y = player1.y
	text = "p1 x:{player1x}\np1 y:{player1y}"
