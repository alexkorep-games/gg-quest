extends TileMap

signal collected
var coin_scene = preload("res://scenes/coins_tile_map/coin.tscn")

var coins = []

var EMPTY_TILE_ID = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var idx = 0
	for tile in get_used_cells():
		if not GameState.is_coin_collected(idx):
			var coin = coin_scene.instance()
			coin.position = map_to_world(tile) + cell_size / 2
			coin.idx = idx
			coin.visible = true
			coin.connect("collected", self, "_on_Coin_collected")
			add_child(coin)
			coins.append(coin)
		set_cellv(tile, EMPTY_TILE_ID)
		idx += 1

func _on_Coin_collected(idx):
	emit_signal("collected")
	coins.remove(idx)
	GameState.collect_coin(idx)
