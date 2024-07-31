extends RigidBody2D

var current_speed = 0.0

func _ready():
	pass


func _on_RedArea_body_entered(body):
	if body.is_in_group("player"):
		if GlobalVars.Red_allow == true:
			queue_free()
			print("collect")
			GlobalSignals.emit_signal("Sign_show", false)
			GlobalSignals.emit_signal("update_score")
		else:
			GlobalSignals.emit_signal("Sign_show", true)
			$redError.visible = true
			GlobalSignals.emit_signal("life_lost")
			$Timer.start()
	if body.is_in_group("floor"):
		if GlobalVars.my_score == 0:
			queue_free()
		else:
			GlobalSignals.emit_signal("score_lost")
			queue_free()
			print("miss")


func _on_Timer_timeout():
	queue_free()
