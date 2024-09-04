extends RigidBody2D

var speed_range = Vector2(250,350)

func _ready():
	pass

func _on_speed_area_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("speed_power")
		queue_free()
	if body.is_in_group("floor"):
		queue_free()
