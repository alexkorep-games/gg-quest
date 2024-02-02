extends Node2D

var has_been_saved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()

func _on_Checkpoint_save(position):
	has_been_saved = true
	save_game(position)

func save_game(position):
	var game_state = {
		"player": {
			"position": {
				"x": position.x,
				"y": position.y
			}
		}
	}
	# Save state to the file
	var file = File.new()
	file.open("user://savegame.save", File.WRITE)
	file.store_line(to_json(game_state))
	file.close()

func load_game():
	var file = File.new()
	if file.file_exists("user://savegame.save"):
		file.open("user://savegame.save", File.READ)
		var game_state = parse_json(file.get_as_text())
		file.close()
		if game_state and "player" in game_state:
			var player = get_node("%Player")
			var x = game_state["player"]["position"]["x"]
			var y = game_state["player"]["position"]["y"]
			player.position.x = int(x)
			player.position.y = int(y)
			player.velocity = Vector2(0, 0)
			print("Loaded game state")
	else:
		print("No savegame found")

func _on_Player_destroyed():
	if has_been_saved:
		load_game()
	else:
		get_tree().reload_current_scene()

func _on_NewGameButton_pressed():
	# Delete savegame
	var file = File.new()
	if file.file_exists("user://savegame.save"):
		file.open("user://savegame.save", File.WRITE)
		file.close()
	get_tree().reload_current_scene()
