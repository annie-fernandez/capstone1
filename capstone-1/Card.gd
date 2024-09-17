# card.gd
extends Node

class_name Card

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
