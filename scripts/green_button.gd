extends Area2D

func _ready():
	GlobalSignals.connect("green_color", self , "_green_color")

func _green_color():
	$current_color.visible = true
