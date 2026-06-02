extends Node
class_name StateMachine

@export
var initial_state: State
var current_state: State

func init():
	if !initial_state:
		push_error("%s (child of %s) was not provided an initial state.")
		return

	current_state = initial_state
	current_state.enter()

func process(delta: float):
	var next_state = current_state.process(delta)
	if next_state != current_state:
		change_state(next_state)

func process_physics(delta: float):
	var next_state = current_state.process_physics(delta)
	if next_state != current_state:
		change_state(next_state)

func change_state(next_state: State):
	current_state.exit()
	current_state = next_state
	current_state.enter()
