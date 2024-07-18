extends Area2D

func _ready():
	GlobalSignals.connect("blue_color_Off",self, "_blue_color_Off")
	GlobalSignals.connect("blue_color", self , "_blue_color")

func _blue_color():
	$current_color.visible = true

func _blue_color_Off():
	$current_color.visible = false
