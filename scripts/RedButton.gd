extends Area2D


func _ready():
	GlobalSignals.connect("red_color", self, "_red_color")

func _red_color():
	$current_color.visible = true
	


