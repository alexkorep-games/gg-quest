extends BaseLevel

var has_been_saved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Checkpoint_save():
	has_been_saved = true
	save_game()

func save_game():
	var player = get_node("%Player")
	var game_state = {
		"player": {
			"position": {
				"x": player.position.x,
				"y": player.position.y
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
		var player = get_node("%Player")
		var x = game_state["player"]["position"]["x"]
		var y = game_state["player"]["position"]["y"]
		print("x: ", x)
		print("y: ", y)
		player.position.x = int(x)
		player.position.y = int(y)
		print("Loaded game state")
	else:
		print("No savegame found")

func _on_Player_destroyed():
	if has_been_saved:
		load_game()
	else:
		get_tree().reload_current_scene()
