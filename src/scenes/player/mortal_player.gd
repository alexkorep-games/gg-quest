extends Player

signal destroyed

var player_fragments_scene = preload("res://scenes/player/player_fragments.tscn")
var player_fragments = null

var old_collision_layer = 0
var old_collision_mask = 0

func make_disabled():
	hide()
	set_physics_process(false)
	old_collision_layer = collision_layer
	old_collision_mask = collision_mask
	collision_layer = 0
	collision_mask = 0

func make_enabled():
	show()
	set_physics_process(true)
	collision_layer = old_collision_layer
	collision_mask = old_collision_mask

func destroy():
	if visible:
		make_disabled()
		player_fragments = player_fragments_scene.instance()
		player_fragments.set_position(position)
		get_parent().add_child(player_fragments)
		player_fragments.connect("animation_finished", self, "on_destroyed")

func on_destroyed():
	if player_fragments:
		player_fragments.queue_free()
		player_fragments = null

	emit_signal("destroyed")
	make_enabled()
	
func _physics_process(_delta):
	for i in range(get_slide_count()):
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("danger"):
			destroy()
			break
