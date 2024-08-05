extends Node2D

func _ready():
	pass

func _on_computer_button_pressed():
	GlobalVars.game_device = "computer_game"
	get_tree().change_scene("res://scenes/main_menu.tscn")
	print("computer")

func _on_mobile_button_pressed():
	GlobalVars.game_device = "mobile_game"
	get_tree().change_scene("res://scenes/main_menu.tscn")
	print("mobile")

