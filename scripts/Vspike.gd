extends RigidBody2D

var speed_range = Vector2(400,450)

func _ready():
	pass


func _on_enemyArea_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		GlobalSignals.emit_signal("life_lost")
		print("life_lost")
	if body.is_in_group("floor"):
		queue_free()
