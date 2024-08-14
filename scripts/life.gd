extends Area2D

export var speed_range = Vector2(300,400)

func _ready():
	pass

func _on_life_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("life_update")
		queue_free()
