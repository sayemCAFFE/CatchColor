extends RigidBody2D

var speed_range = Vector2(600,800)

func _ready():
	pass


func _on_enemyArea_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		print("life_lost")
	if body.is_in_group("floor"):
		queue_free()
