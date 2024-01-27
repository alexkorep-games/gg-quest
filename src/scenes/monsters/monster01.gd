extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("%AnimationPlayer").play("Idle")


func _on_Monster01_body_entered(body):
	if body.is_in_group("Player"):
		body.destroy()

