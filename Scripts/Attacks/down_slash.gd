extends Node2D

@onready var collider = $Area2D
@onready var character = self.get_parent()
@export var damage = 5.0

var collisions = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	collisions.append(area)
	

func _on_area_2d_area_exited(area: Area2D) -> void:
	collisions.remove(area)
