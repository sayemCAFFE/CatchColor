extends Area2D


func _ready():
	GlobalSignals.connect("red_color_Off", self , "_red_color_Off")
	GlobalSignals.connect("red_color", self, "_red_color")

func _red_color():
	$current_color.visible = true
	

func _red_color_Off():
	$current_color.visible = false


func _on_red_buttonM_pressed():
	GlobalVars.Red_allow = true
	GlobalVars.Blue_allow = false
	GlobalVars.Green_allow = false
	GlobalSignals.emit_signal("red_color")
	GlobalSignals.emit_signal("blue_color_Off")
	GlobalSignals.emit_signal("green_color_Off")
