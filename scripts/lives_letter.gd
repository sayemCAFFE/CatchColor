extends RigidBody2D

var use_word  = ["L", "I", "V", "E", "S"]
var use_letter = ""

var speed_range = Vector2(300,380)

func _ready():
	_set_letter()


func _on_lives_letter_body_entered(body):
	if body.is_in_group("player"):
		GlobalVars.lives_letter_count += 1
		print(GlobalVars.lives_letter_count)
		_collected()
		queue_free()
	if body.is_in_group("floor"):
		queue_free()

func _set_letter():
	use_letter = use_word[GlobalVars.lives_letter_count]
	$text_label.text = use_letter

func _collected():
	GlobalSignals.emit_signal("lives_letter_collected", use_letter)
	queue_free()

