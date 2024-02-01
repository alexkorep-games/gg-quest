extends Area2D

signal save(position)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Checkpoint_body_entered(body):
	# If body belongs to the "Player" group
	if body.is_in_group("Player"):
		$AnimationPlayer.play("rotate")
		emit_signal("save", position)
