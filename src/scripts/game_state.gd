extends Node

var best_times_per_level = {}

func _ready():
	load_game()

func save_game():
	var save_file = File.new()
	save_file.open("user://save_game.save", File.WRITE)
	save_file.store_line(to_json(best_times_per_level))
	save_file.close()

func load_game():
	var save_file = File.new()
	if save_file.file_exists("user://save_game.save"):
		save_file.open("user://save_game.save", File.READ)
		var text = save_file.get_as_text()
		best_times_per_level = parse_json(text)
		if not best_times_per_level:
			best_times_per_level = {}
		save_file.close()

func set_best_time(level, time):
	if best_times_per_level.has(level):
		if best_times_per_level[level] > time:
			best_times_per_level[level] = time
	else:
		best_times_per_level[level] = time
	save_game()

func get_best_time(level):
	if best_times_per_level.has(level):
		return best_times_per_level[level]
	else:
		return 0

func format_msec(time_msec):
	var minutes = str(int(time_msec / 60000))
	var sec = str(int(time_msec / 1000) % 60).pad_zeros(2)
	var msec = str(int(time_msec) % 1000)
	var time_str = minutes + ":" + sec + "." + msec
	return time_str
