extends Node2D

func _ready():
	GlobalSignals.connect("L_letter_active", self, "_L_letter_active")
	GlobalSignals.connect("I_letter_active", self, "_I_letter_active")
	GlobalSignals.connect("V_letter_active",self, "_V_letter_active")
	GlobalSignals.connect("E_letter_active" ,self, "_E_letter_active")
	GlobalSignals.connect("S_letter_active", self, "_S_letter_active")


func _L_letter_active():
	$L_letter.text = "L"

func _I_letter_active():
	$I_letter.text = "I"

func _V_letter_active():
	$V_letter.text = "V"

func _E_letter_active():
	$E_letter.text = "E"

func _S_letter_active():
	$S_letter.text = "S"




