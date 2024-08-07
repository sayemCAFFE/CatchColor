extends Node2D

func _ready():
	pass

func _on_computer_button_pressed():
	GlobalVars.game_device = "computer_game"
	GlobalVars.one_time_chack = false
	get_tree().change_scene("res://scenes/main_menu.tscn")
	print("computer")

func _on_mobile_button_pressed():
	GlobalVars.game_device = "mobile_game"
	GlobalVars.one_time_chack = false
	get_tree().change_scene("res://scenes/main_menu.tscn")
	print("mobile")

