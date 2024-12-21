extends RigidBody2D

var speed_range = Vector2(300,380)

func _ready():
	LIVES_letter_change()


func _on_lives_letter_body_entered(body):
	if body.is_in_group("player"):
		GlobalVars.lives_letter_count += 1
		print(GlobalVars.lives_letter_count)
		LIVES_letter_change()
		queue_free()
	if body.is_in_group("floor"):
		queue_free()

func LIVES_letter_change():
	if GlobalVars.lives_letter_count == 0:
		GlobalVars.LIVES_text = "L"
		$text_label.text = ""+str(GlobalVars.LIVES_text)
		GlobalSignals.emit_signal("L_letter_active")
	if GlobalVars.lives_letter_count == 1:
		GlobalVars.LIVES_text = "I"
		$text_label.text = ""+str(GlobalVars.LIVES_text)
		GlobalSignals.emit_signal("I_letter_active")
	if GlobalVars.lives_letter_count == 2:
		GlobalVars.LIVES_text = "V"
		$text_label.text = ""+str(GlobalVars.LIVES_text)
		GlobalSignals.emit_signal("V_letter_active")
	if GlobalVars.lives_letter_count == 3:
		GlobalVars.LIVES_text = "E"
		$text_label.text = ""+str(GlobalVars.LIVES_text)
		GlobalSignals.emit_signal("E_letter_active")
	if GlobalVars.lives_letter_count == 4:
		GlobalVars.LIVES_text = "S"
		$text_label.text = ""+str(GlobalVars.LIVES_text)
		GlobalSignals.emit_signal("S_letter_active")
	if GlobalVars.lives_letter_count > 4:
		GlobalVars.lives_letter_count = 0
		queue_free()



