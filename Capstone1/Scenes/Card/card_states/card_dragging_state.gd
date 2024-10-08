extends CardState

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		card.reparent(ui_layer)

	card.color.color = Color.NAVY_BLUE
	card.state.test = "DRAGGING"


func on_input(event: InputEvent) -> void:
	var mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	var confirm = event.is_action_released("left_mouse")

	if mouse_motion:
		card.global_position = card.get_global_mouse_position() - card.pivot_offset

	if cancel:
		transition_requested.emit(self, CardState.State.BASE)
	elif confirm:
		get_viewport().set_input_as_hadled()
		transition_requested.emit(self, CardState.State.RELEASED)
