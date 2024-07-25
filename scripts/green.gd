extends RigidBody2D

var speed_range = Vector2(250,350)
var current_speed = 0.0

func _ready():
	pass

func _on_greenArea_body_entered(body):
	if body.is_in_group("player"):
		if GlobalVars.Green_allow == true:
			queue_free()
			print("collect")
			GlobalSignals.emit_signal("Sign_show", false)
			GlobalSignals.emit_signal("update_score")
		else:
			$greenError.visible = true
			GlobalSignals.emit_signal("Sign_show", true)
			GlobalSignals.emit_signal("life_lost")
			$Timer.start()
	if body.is_in_group("floor"):
		GlobalSignals.emit_signal("life_lost")
		queue_free()
		print("miss")


func _on_Timer_timeout():
	queue_free()
