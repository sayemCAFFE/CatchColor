extends Node2D

func _ready():
	pass 


func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")
