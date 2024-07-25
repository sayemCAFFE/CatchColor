extends Area2D


func _ready():
	GlobalSignals.connect("red_color_Off", self , "_red_color_Off")
	GlobalSignals.connect("red_color", self, "_red_color")

func _red_color():
	$current_color.visible = true
	

func _red_color_Off():
	$current_color.visible = false
