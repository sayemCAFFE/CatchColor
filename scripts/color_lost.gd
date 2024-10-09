extends RigidBody2D

var speed_range = Vector2(320,430)

func _ready():
	pass

func _on_color_lost2_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		GlobalSignals.emit_signal("life_lost")
		GlobalSignals.emit_signal("all_color_lost")
		print("life_lost")
	if body.is_in_group("floor"):
		queue_free()
