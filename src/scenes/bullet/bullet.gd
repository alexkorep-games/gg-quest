extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bullet_body_entered(body):
	if body.is_in_group("Player"):
		body.destroy()
		queue_free()

func _on_Bullet_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body_rid, body, body_shape_index, local_shape_index)


func _on_LIfeTimer_timeout():
	queue_free()
