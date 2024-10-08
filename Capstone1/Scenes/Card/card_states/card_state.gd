extends Node

class_name CardState

#holds all possible states
enum State {BASE, CLICKED, DRAGGING,AIMING, RELEASED}

signal transition_requested(from: CardState, to: State)

@export var state: State

var card: Card

func enter() -> void:
	pass 

func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	pass

func on_mouse_entered() -> void:
	pass

func on_mouse_exited() -> void:
	pass 
