extends Node2D

func _ready():
	$normal_sound.play()

func _on_back_pressed():
	$pressed.play()
	get_tree().change_scene("res://scenes/main_menu.tscn")
