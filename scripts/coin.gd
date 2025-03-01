extends RigidBody2D

var speed_range = Vector2(200,250)


func _on_coin_area_body_entered(body):
	if body.is_in_group("player"):
		GlobalVars.data["coins"] += 10000
#		GlobalVars.coins += 100
		GlobalSignals.emit_signal("coin_update")
		GlobalVars.save_data()
		queue_free()
		GlobalSignals.emit_signal("coin_show")
	if body.is_in_group("floor"):
		queue_free()
