extends Node2D


func _ready():
	pass

func _on_first_page_button_pressed():
	get_tree().change_scene("res://scenes/how_to_play.tscn")
