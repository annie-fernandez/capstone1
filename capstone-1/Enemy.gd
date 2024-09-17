# enemy.gd
extends Node

class_name Enemy

var max_health: int
var current_health: int
var damage: int

@warning_ignore("shadowed_variable")
func set_properties(max_health: int, damage: int):
	self.max_health = max_health
	self.current_health = max_health
	self.damage = damage

@warning_ignore("shadowed_variable")
func take_damage(damage: int):
	current_health -= damage
	if current_health <= 0:
		die()

func die():
	print("Enemy is defeated!")

func attack_player(player):
	player.take_damage(damage)
