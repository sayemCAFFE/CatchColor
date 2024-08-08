extends Node2D

var sound_text : String

func _ready():
	pass

func _on_computer_button_pressed():
	GlobalVars.one_time_chack = false
	GlobalVars.game_device = "computer_game"
	get_tree().change_scene("res://scenes/main_menu.tscn")
	print("computer")

func _on_mobile_button_pressed():
	GlobalVars.one_time_chack = false
	GlobalVars.game_device = "mobile_game"
	get_tree().change_scene("res://scenes/main_menu.tscn")
	print("mobile")

func _on_back_button_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")


func _on_On_pressed():
	GlobalVars.sound_on = true
	$"%on_icon".visible = true
	$"%on_icon2".visible = false
	GlobalVars.sound_off = false
	print("sound_on")

func _on_Off_pressed():
	$"%on_icon".visible = false
	$"%on_icon2".visible = true
	GlobalVars.sound_off = true
	GlobalVars.sound_on = false
	print("sound_off")
