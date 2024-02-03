extends Area2D

signal collected(idx)

var fading_out = false	
export var idx := 0

func _on_Coin_body_entered(body):
	if fading_out:
		return

	if body.is_in_group("Player"):
		$AnimationPlayer.play("collect")
		fading_out = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "collect":
		emit_signal("collected", idx)
		queue_free()
