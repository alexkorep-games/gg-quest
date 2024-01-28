extends Control


var time_start = 0
var finished = false
var level_code := ""

# Called when the node enters the scene tree for the first time.
func _ready():
	# Remember current time
	time_start = OS.get_ticks_msec()
	finished = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if finished:
		return
	var time_msec = OS.get_ticks_msec() - time_start
	var time_str = GameState.format_msec(time_msec)
	get_node("%TimerLabel").text = time_str

func finish():
	finished = true
	var time_msec = OS.get_ticks_msec() - time_start
	var best_time = GameState.get_best_time(level_code)
	if not best_time or time_msec < best_time:
		# New best time!
		get_node("%AnimationPlayer").play("end_level")
		GameState.set_best_time(level_code, time_msec)

func _on_LevelTrigger_triggered():
	finish()
