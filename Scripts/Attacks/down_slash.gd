extends Node2D

@onready var collider = $Area2D
@onready var charicter = self.get_parent()

var collisions = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	print(collisions)


func _on_area_2d_area_entered(area: Area2D) -> void:
	collisions.append(area)
	

func _on_area_2d_area_exited(area: Area2D) -> void:
	collisions.remove(area)
