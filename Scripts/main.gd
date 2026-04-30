extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("test")

func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("quit"):
	#	get_tree().quit()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
