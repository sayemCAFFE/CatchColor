extends Node2D

func _ready():
	pass


func _on_menuButton_pressed():
	get_tree().change_scene("res://scenes/Main_menu.tscn")
