extends Node
class_name State

func enter() -> void:
	pass

func exit() -> void:
	pass

func process(_delta: float) -> State:
	return self

func process_physics(_delta: float) -> State:
	return self
