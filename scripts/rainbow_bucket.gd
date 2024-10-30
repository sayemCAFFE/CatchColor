extends RigidBody2D

var speed_range = Vector2(230,300)

func _ready():
	pass

func _on_rainbow_bucket_area_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("rainbow_bucket_active")
		GlobalVars.rainbow_bucket_allow = true
		GlobalVars.Blue_allow = true
		GlobalVars.Red_allow = true
		GlobalVars.Green_allow = true
		GlobalSignals.emit_signal("blue_color")
		GlobalSignals.emit_signal("red_color")
		GlobalSignals.emit_signal("green_color")
		queue_free()
	if body.is_in_group("floor"):
		queue_free()
