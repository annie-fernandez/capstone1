class_name CardStateMachine
extends Node

@export var initial_state: CardState

#for storing current states and holding all available states
var current_state: CardState
var states:={}
 

func init(card: Card) -> void:
	for child in get_children():
		if child is CardState:
			states[child.state] = child
			child.transition_requested.connect(on_transition_requested)
			child.card = card
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

#if there's already a state
func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)

func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()

func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()

func on_transition_requested(from: CardState, to: CardState.State) -> void:
	if from != current_state:
		return
	
	var new_state: CardState = states[to]
	if not new_state:
		return

#if already in state, exit that state and enter new one
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state
