extends Control

var touches = {}
var pressed_actions = {
	"jump": false,
	"ui_left": false,
	"ui_right": false
}

func _unhandled_input(event):

	if event is InputEventScreenTouch:
		if event.pressed: # Down.
			touches[event.index] = event.position
		else: # Up.
			touches.erase(event.index)
		get_tree().set_input_as_handled()

	elif event is InputEventScreenDrag: # Movement.
		touches[event.index] = event.position
		get_tree().set_input_as_handled()

func has_control_touches(control):
	for i in touches:
		if control.get_global_rect().has_point(touches[i]):
			return true
	return false

func _process(_delta):
	var controls = {
		"%Jump": "jump",
		"%Left": "ui_left",
		"%Right": "ui_right"
	}
	for control in controls:
		var action = controls[control]
		var node = get_node(control)
		var action_pressed = pressed_actions[action]
		if has_control_touches(node):
			if not action_pressed:
				print("press")
				pressed_actions[action] = true
				Input.action_press(action)
				if "color" in node:
					node.color = Color(1, 1, 1, 1)
		else:
			if action_pressed:
				print("release")
				pressed_actions[action] = false
				if "color" in node:
					node.color = Color(1, 1, 1, 0.5)
				Input.action_release(action)
