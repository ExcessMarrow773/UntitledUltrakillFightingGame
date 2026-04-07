extends Camera2D
@onready var p1 = %Player1
@onready var p2 = %Player2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = (p1.position + p2.position) / 2
	
