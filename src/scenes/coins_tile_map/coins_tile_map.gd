extends TileMap

signal collected
var coin_scene = preload("res://scenes/coins_tile_map/coin.tscn")

var coins = []
var coin_positions = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for tile in get_used_cells():
		var coin = coin_scene.instance()
		coin.position = map_to_world(tile) + cell_size / 2
		coin.tile = tile
		coin.visible = true
		coin.connect("collected", self, "_on_Coin_collected")
		add_child(coin)
		coins.append(coin)
		coin_positions.append(tile)
		set_cellv(tile, -1)

func _on_Coin_collected(tile):
	emit_signal("collected")
	var idx = coin_positions.find(tile)
	coin_positions.remove(idx)
	coins.remove(idx)
	GameState.collect_coin()


# TODO Display in HUD
# Save and load
# func save(obj):
# 	var coins = []
# 	for coin in get_children():
# 		coins.append(coin.position)
# 	return coins
