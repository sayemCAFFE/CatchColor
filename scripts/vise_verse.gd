extends RigidBody2D

var speed_range = Vector2(300,400)

func _ready():
	pass

func _on_vise_verse2_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("vise_verse_do")
		GlobalSignals.emit_signal("life_lost")
		queue_free()
	if body.is_in_group("floor"):
		queue_free()
