extends Node2D

func _ready():
	var fragments = get_node("%Fragments")
	for child in fragments.get_children():
		# set random velocity of Rigidbody2D
		child.linear_velocity = Vector2(rand_range(-100, 100), rand_range(-100, -200))
		child.angular_velocity = rand_range(-10, 10)
		child.body_scale = Vector2(rand_range(0.8, 2), rand_range(0.8, 2))
	get_node("%Timer").start()

func _on_Timer_timeout():
	queue_free()
	get_tree().reload_current_scene()
