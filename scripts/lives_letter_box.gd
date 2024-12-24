extends Node2D

func _ready():
	GlobalSignals.connect("lives_letter_collected", self, "_lives_letter_collected")

func _lives_letter_collected(letter):
	match letter:
		"L":
			$L_letter.text = "L"
		"I":
			$I_letter.text = "I"
		"V":
			$V_letter.text = "V"
		"E":
			$E_letter.text = "E"
		"S":
			$S_letter.text = "S"
			print ("you got extra lives")
			GlobalVars.lives_letter_count = 0
			GlobalVars.my_life += 4
			GlobalSignals.emit_signal("life_update")
			_reser_letter_box()

func _reser_letter_box():
	$L_letter.text = "X"
	$I_letter.text = "X"
	$V_letter.text = "X"
	$E_letter.text = "X"
	$S_letter.text = "X"





