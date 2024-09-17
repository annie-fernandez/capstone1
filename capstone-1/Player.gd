# player.gd
extends Node

class_name Player

var max_health: int
var current_health: int
var energy: int
var max_energy: int
var block: int = 0

var deck: Deck

@warning_ignore("shadowed_variable")
func set_properties(max_health: int, max_energy: int, starting_deck: Array):
	self.max_health = max_health
	self.current_health = max_health
	self.max_energy = max_energy
	self.energy = max_energy
	
	# Initialize deck with the starting deck
	deck = Deck.new(starting_deck)

func draw_hand():
	deck.draw_hand()

func play_card(card_index: int, enemy):
	if card_index >= 0 and card_index < deck.get_hand().size():
		var card = deck.get_hand()[card_index]
		card.play_card(self, enemy)
		deck.discard_card(card_index)

func take_damage(damage: int):
	var effective_damage = max(0, damage - block)
	current_health -= effective_damage
	block = 0

func add_block(amount: int):
	block += amount
