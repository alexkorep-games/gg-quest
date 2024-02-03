extends Node2D

var has_been_saved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("%RoomsGrid").hide()
	# Initial player position, if no save games are present
	var player = get_node("%Player")
	
	if GameState.checkpoint_player_position != Vector2(0, 0):
		player.position = GameState.checkpoint_player_position

func _on_Checkpoint_save(position):
	has_been_saved = true
	GameState.set_checkpoint_player_position(position)

func load_game():
	GameState.load_game()
	var player = get_node("%Player")
	player.position = GameState.get_checkpoint_player_position()
	print(player.position)
	player.velocity = Vector2(0, 0)
	
func _on_Player_destroyed():
	if has_been_saved:
		load_game()
	else:
		get_tree().reload_current_scene()

func _on_NewGameButton_pressed():
	# Delete savegame
	GameState.new_game()
	get_tree().reload_current_scene()
