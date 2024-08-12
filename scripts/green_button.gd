extends Area2D

func _ready():
	GlobalSignals.connect("green_color_Off", self, "_green_color_Off")
	GlobalSignals.connect("green_color", self , "_green_color")

func _green_color():
	$current_color.visible = true

func _green_color_Off():
	$current_color.visible = false


func _on_green_buttonM_pressed():
	$pressed.play()
	GlobalVars.Green_allow = true
	GlobalVars.Red_allow = false
	GlobalVars.Blue_allow = false
	GlobalSignals.emit_signal("green_color")
	GlobalSignals.emit_signal("red_color_Off")
	GlobalSignals.emit_signal("blue_color_Off")
