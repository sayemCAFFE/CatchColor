extends RigidBody2D

var speed_range = Vector2(600,800)
var current_speed = 0.0

func _ready():
	pass


func _on_RedArea_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		print("collect")
	if body.is_in_group("floor"):
		queue_free()
		print("miss")

