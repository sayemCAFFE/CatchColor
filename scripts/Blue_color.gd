extends Area2D

func _ready():
	GlobalSignals.connect("blue_color_Off",self, "_blue_color_Off")
	GlobalSignals.connect("blue_color", self , "_blue_color")

func _blue_color():
	$current_color.visible = true

func _blue_color_Off():
	$current_color.visible = false


func _on_blue_buttonM_pressed():
	GlobalVars.Red_allow = false
	GlobalVars.Blue_allow = true
	GlobalVars.Green_allow = false
	GlobalSignals.emit_signal("blue_color")
	GlobalSignals.emit_signal("red_color_Off")
	GlobalSignals.emit_signal("green_color_Off")
