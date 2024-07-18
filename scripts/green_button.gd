extends Area2D

func _ready():
	GlobalSignals.connect("green_color_Off", self, "_green_color_Off")
	GlobalSignals.connect("green_color", self , "_green_color")

func _green_color():
	$current_color.visible = true

func _green_color_Off():
	$current_color.visible = false
