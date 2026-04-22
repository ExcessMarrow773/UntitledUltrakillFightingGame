extends State

class_name IdleState


func enter():
	var character = state_machine.get_parent()
	#print("entering idlestate")
	#print(character.get_child(1))
	character.get_child(1).play("idle")

func handle_input(event: InputEvent):
	print(event)
	if Input.get_axis("move_left", "move_right") != 0:
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
	elif Input.is_action_just_pressed("attack"):
		state_machine.change_state("atkstate")

func exit():
	var character = state_machine.get_parent()
	#print("exiting idlestate")
	character.sprite2d.stop()
