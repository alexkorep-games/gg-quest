extends BaseLevel

func _ready():
	var best_time_label = get_node("%BestTimeLabel")
	if best_time_label:
		var time_msec = GameState.get_best_time(level_code)
		best_time_label.text = "Best time: " + (GameState.format_msec(time_msec) 
			if time_msec else "none")
	var hud = get_node("%HUD")
	if hud:
		hud.level_code = level_code

