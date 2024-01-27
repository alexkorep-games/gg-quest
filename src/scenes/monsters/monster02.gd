extends Area2D

func _ready():
	get_node("%AnimationPlayer").play("Idle")

func _on_Monster02_body_entered(body):
	if body.is_in_group("Player"):
		body.destroy()
