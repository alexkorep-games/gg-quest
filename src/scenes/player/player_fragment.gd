extends RigidBody2D


export var body_scale = Vector2.ONE

func _process(delta):
	get_node("%Polygon2D").scale = body_scale
	get_node("%CollisionPolygon2D").scale = body_scale
