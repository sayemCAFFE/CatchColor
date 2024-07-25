extends Node2D

func _ready():
	pass

func _on_game_button_pressed():
	get_tree().change_scene("res://scenes/game_scene.tscn")


func _on_How_To_Play_pressed():
	get_tree().change_scene("res://scenes/how_to_play.tscn")
