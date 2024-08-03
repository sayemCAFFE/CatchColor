extends Node2D

func _ready():
	pass 


func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")


func _on_next_page_button_pressed():
	get_tree().change_scene("res://scenes/next_page.tscn")
