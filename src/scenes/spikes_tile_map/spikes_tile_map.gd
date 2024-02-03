extends TileMap

var bullet_scene = preload("res://scenes/bullet/bullet.tscn")

export var bullet_accuraty_degrees = 45
export var bullet_strength = 200

var loop_tile_ids = {
	0: 1,
	1: 0,
	2: 3,
	3: 2,
	4: 5,
	5: 4,
	6: 7,
	7: 6
}

var gun_tile_ids = [8]

func _on_Timer_timeout():
	pass
	for tile in get_used_cells():
		var tile_id = get_cellv(tile)
		if tile_id in loop_tile_ids:
			set_cellv(tile, loop_tile_ids[tile_id])

func _on_GunTimer_timeout():
	for tile in get_used_cells():
		var tile_id = get_cellv(tile)
		if tile_id in gun_tile_ids:
			var bullet = bullet_scene.instance()
			get_parent().add_child(bullet)
			bullet.global_position = map_to_world(tile) + Vector2(8, -1)
			# Shot it to the rundom direction up
			var angle = bullet_accuraty_degrees * (randf() - 0.5) / 180 * PI
			bullet.linear_velocity = Vector2(0, -1).rotated(angle) * bullet_strength
			

