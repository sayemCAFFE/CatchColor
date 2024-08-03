extends Node2D

func _ready():
	pass

func _on_computer_button_pressed():
	GlobalSignals.emit_signal("computer_game")
	get_tree().change_scene("res://scenes/main_menu.tscn")


func _on_mobile_button_pressed():
	GlobalSignals.emit_signal("mobile_game")
	get_tree().change_scene("res://scenes/main_menu.tscn")

