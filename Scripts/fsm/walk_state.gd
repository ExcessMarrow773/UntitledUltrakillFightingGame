extends State

class_name WalkState

func physics_update(delta: float):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("move_left", "move_right")

	if not character.is_on_floor():
		character.velocity += character.get_gravity() * delta

	character.velocity.x = direction * character.SPEED
	character.move_and_slide()

	
func enter():
	$AnimatedSprite2D.play("walk")

func exit():
	$AnimatedSprite2D.stop("walk")
