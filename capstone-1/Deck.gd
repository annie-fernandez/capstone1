# deck.gd
extends Node

class_name Deck

var draw_pile: Array = []
var discard_pile: Array = []
var hand: Array = []

var max_hand_size: int = 5

func _init(starting_deck: Array):
	# Initialize the draw pile with the starting deck
	draw_pile = starting_deck.duplicate()
	shuffle_draw_pile()

func shuffle_draw_pile():
	draw_pile.shuffle()

func draw_card():
	if draw_pile.size() == 0:
		reshuffle_discard_into_draw()
	if draw_pile.size() > 0:
		var card = draw_pile.pop_back()
		hand.append(card)
		return card
	return null

func reshuffle_discard_into_draw():
	draw_pile = discard_pile.duplicate()
	discard_pile.clear()
	shuffle_draw_pile()

func draw_hand():
	hand.clear()
	for i in range(max_hand_size):
		draw_card()

func discard_card(index: int):
	if index >= 0 and index < hand.size():
		@warning_ignore("unused_variable")
		var card = hand[index]
		discard_pile.append(hand.pop_at(index))

func reset_deck():
	# Combine the hand and discard pile back into the deck
	draw_pile = hand.duplicate() + discard_pile
	discard_pile.clear()
	hand.clear()
	shuffle_draw_pile()

func get_hand():
	return hand
