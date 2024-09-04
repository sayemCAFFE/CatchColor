extends RigidBody2D

var speed_range = Vector2(200,300)

func _ready():
	pass

func _on_smile_enemy_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		GlobalSignals.emit_signal("life_lost")
		print("life_lost")
	if body.is_in_group("floor"):
		queue_free()
