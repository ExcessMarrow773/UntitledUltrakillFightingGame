extends Camera2D
@onready var p1 = %Player1
@onready var p2 = %Player2
#@export var zoom_max = 0.5
@export var zoom_increment = 0.01
var zoom_increment_vector = Vector2(zoom_increment, zoom_increment)

@export var zoom_threshold: float = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = (p1.position + p2.position) / 2
	
	if get_window().size.x / zoom.x < p1.position.distance_to(p2.position) * zoom.x :
		zoom -= zoom_increment_vector
	if get_window().size.x / zoom.x > p1.position.distance_to(p2.position) * zoom.x :
		zoom += zoom_increment_vector
	
	#print("w" + str(get_window().size.x))
	#print(p1.position.distance_to(p2.position))
	#print(zoom)
	#zoom.x = max(zoom_max, zoom.x)
	#zoom.y = max(zoom_max, zoom.y)
