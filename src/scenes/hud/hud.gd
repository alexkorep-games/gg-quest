extends Control

func _process(delta):
	get_node("%CoinsLabel").text = str(GameState.get_coins())
	
