extends RigidBody2D

var speed_range = Vector2(250,350)

func _on_life_area_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("life_update")
		queue_free()
	if body.is_in_group("floor"):
		queue_free()
