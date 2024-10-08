extends CardState

func enter() -> void:
	card.color.color = Color.ORANGE
	card.state.text = "CLICKED"
	card.drop_point_detector.monitoring = true
	

func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.State.DRAGGING)
	
