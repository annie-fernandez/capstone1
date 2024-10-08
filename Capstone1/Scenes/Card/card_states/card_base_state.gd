extends CardState

func enter() -> void:
	if not card.is_node_ready():
		await card.ready

	card.reparent_requested.emit(card)
	card.color.color = Color.WEB_GREEN
	card.state.text = "BASE"
	card.pivot_offset = Vector2.ZERO
	

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
			card.pivot_offset = card.get_global_mouse_position() - card.global_position
			transition_requested.emit(self, CardState.State.CLICKED)
