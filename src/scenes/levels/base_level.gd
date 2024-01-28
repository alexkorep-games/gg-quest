extends Node2D
class_name BaseLevel
tool

export var level_code := ""
export var level_name := ""

func _process(_delta):
	var level_name_label = get_node("%LevelNameLabel")
	if level_name_label:
		level_name_label.level_name = level_name
