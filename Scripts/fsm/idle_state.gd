extends State

class_name IdleState

func enter():
	print("entering idlestate")

func handle_input(event: InputEvent):
	if Input.get_axis("move_left", "move_right") != 0:
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
	elif Input.is_action_just_pressed("attack"):
		state_machine.change_state("atkstate")
		
