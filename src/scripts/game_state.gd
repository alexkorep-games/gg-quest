extends Node

var coins = 0
var checkpoint_player_position = Vector2(0, 0)	

func save_game():
	var game_state = {
		"coins": coins,
		"checkpoint_player_position": {
			"x": checkpoint_player_position.x,
			"y": checkpoint_player_position.y
		}
	}
	var save_file = File.new()
	save_file.open("user://save_game.save", File.WRITE)
	save_file.store_line(to_json(game_state))
	save_file.close()

func load_game():
	var save_file = File.new()
	if save_file.file_exists("user://save_game.save"):
		save_file.open("user://save_game.save", File.READ)
		var text = save_file.get_as_text()
		var result = parse_json(text)
		save_file.close()
		if result:
			coins = result["coins"]
			var pos = result["checkpoint_player_position"]
			checkpoint_player_position = Vector2(pos.x, pos.y)


func new_game():
	coins = 0
	checkpoint_player_position = Vector2(0, 0)	
	var save_file = File.new()
	if save_file.file_exists("user://save_game.save"):
		save_file.remove("user://save_game.save")

func get_coins():
	return coins

func collect_coin():
	coins += 1
	save_game()

func set_checkpoint_player_position(position):
	checkpoint_player_position = position
	print("Checkpoint set to: ", checkpoint_player_position)
	save_game()

func get_checkpoint_player_position():
	return checkpoint_player_position
