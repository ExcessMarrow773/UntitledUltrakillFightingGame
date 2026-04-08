extends Camera2D
@onready var p1 = %Player1
@onready var p2 = %Player2

@export var zoom_threshold: float = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_camera_rect() -> Rect2:
	var center = self.get_screen_center_position()
	var size = get_viewport_rect().size * zoom
	return Rect2(center - size / 2, size)

func is_on_screen(point: Vector2) -> bool:
	var screen_rect = get_camera_rect()
	return screen_rect.has_point(point)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = (p1.position + p2.position) / 2
	if is_on_screen(p1.position) and is_on_screen(p2.position):
		pass
	elif (!is_on_screen(p1.position) or !is_on_screen(p2.position)):
		zoom -= Vector2(0.1, 0.1)
	else:
		zoom += Vector2(0.1, 0.1)
	#zoom.x = min(zoom_threshold, zoom.x)
	#zoom.y = min(zoom_threshold, zoom.y)
