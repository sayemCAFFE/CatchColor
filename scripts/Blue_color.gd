extends Area2D

func _ready():
	GlobalSignals.connect("blue_color", self , "_blue_color")

func _blue_color():
	$current_color.visible = true
