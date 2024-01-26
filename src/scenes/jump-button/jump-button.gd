extends Button


export var action_name = "ui_up"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	# simulate "up" input event
	Input.action_press(action_name)
