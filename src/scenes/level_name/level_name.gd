extends Label

export var level_name = ""

func _ready():
	text = level_name

func _on_Timer_timeout():
	hide()
