# card.gd
class_name Card
extends Node



signal reparent_requested(which_card: Card)


@onready var color: ColorRect = $Color
@onready var state: Label = $State
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine

func _ready() -> void: 
	card_state_machine.init(self)

func _input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()

var card_name: String
var description: String
var energy_cost: int
var card_type: String # "attack", "defense", etc.
var damage: int = 0
var block: int = 0

@warning_ignore("shadowed_variable_base_class", "shadowed_variable")
func _init(name: String, description: String, energy_cost: int, card_type: String, damage: int = 0, block: int = 0):
	self.card_name = card_name
	self.description = description
	self.energy_cost = energy_cost
	self.card_type = card_type
	self.damage = damage
	self.block = block

func play_card(player, enemy):
	if energy_cost <= player.energy:
		player.energy -= energy_cost
		match card_type:
			"attack":
				enemy.take_damage(damage)
			"defense":
				player.add_block(block)
	else:
		print("Not enough energy to play this card!")
