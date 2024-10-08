## MainScene.gd
extends Node
var PlayerScene = preload("res://Capstone1/Scenes/Player/Player.tscn")  # Adjust path as needed
var EnemyScene = preload("res://Capstone1/Scenes/Enemy/Enemy.tscn")    # Adjust path as needed

var player: Player
var enemy: Enemy

func _ready():
	# Instance player and enemy
	player = PlayerScene.instantiate()
	enemy = EnemyScene.instantiate()
	
	# Set their properties after instantiation
	player.set_properties(50, 3, create_deck())
	enemy.set_properties(30, 5)
	
	# Add them to the scene tree
	add_child(player)
	add_child(enemy)
	
	# Initialize the game
	start_player_turn()
#
#var player: Player
#var enemy: Enemy
#
#var hand_size: int = 5

#func _ready():
	#player = Player.new(50, 3, create_deck())
	#enemy = Enemy.new(30, 5)
	#start_player_turn()

func start_player_turn():
	player.energy = player.max_energy
	player.draw_hand()
	print("Player's turn!")

func player_play_card(card_index: int):
	player.play_card(card_index, enemy)
	if enemy.current_health <= 0:
		end_battle()
	else:
		end_player_turn()

func end_player_turn():
	start_enemy_turn()

func start_enemy_turn():
	enemy.attack_player(player)
	if player.current_health <= 0:
		end_game()
	else:
		start_player_turn()

func end_battle():
	print("Battle won!")

func end_game():
	print("Game over!")

func create_deck():
	return [
		Card.new("Strike", "Deal 6 damage", 1, "attack", 6, 0),
		Card.new("Defend", "Gain 5 block", 1, "defense", 0, 5),
		Card.new("Bash", "Deal 8 damage and apply 2 Vulnerable", 2, "attack", 8, 0)
	]
