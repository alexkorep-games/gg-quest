extends Label
tool

export var level_name = ""

func _ready():
	text = level_name

func _process(_delta):
	text = level_name
