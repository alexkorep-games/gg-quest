extends Player

var player_fragments_scene = preload("res://scenes/player/player_fragments.tscn")

func destroy():
	if visible:
		hide()
		set_physics_process(false)
		collision_layer = 0
		collision_mask = 0
		var player_fragments = player_fragments_scene.instance()
		player_fragments.set_position(position)
		get_parent().add_child(player_fragments)
