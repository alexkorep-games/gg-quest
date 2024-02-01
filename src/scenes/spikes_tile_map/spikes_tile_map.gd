extends TileMap

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

func _on_Timer_timeout():
	for tile in get_used_cells():
		var tile_id = get_cellv(tile)
		set_cellv(tile, loop_tile_ids[tile_id])
