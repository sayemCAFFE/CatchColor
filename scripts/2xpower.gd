extends RigidBody2D

var speed_range = Vector2(300,360)

func _ready():
	pass

func _on_2xpower_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("double_point")
		queue_free()
	if body.is_in_group("floor"):
		queue_free()
