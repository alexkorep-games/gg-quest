extends Area2D

signal collected(tile)

var fading_out = false	
export var tile := Vector2(0, 0)

func _on_Coin_body_entered(body):
	if fading_out:
		return

	if body.is_in_group("Player"):
		$AnimationPlayer.play("collect")
		fading_out = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "collect":
		emit_signal("collected", tile)
		queue_free()
