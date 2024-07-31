extends Node2D

func _ready():
	pass

func _on_level_button_pressed():
	GlobalVars.game_type = "level_game"
	get_tree().change_scene("res://scenes/game_scene.tscn")

func _on_endless_button_pressed():
	GlobalVars.game_type = "endless_game"
	get_tree().change_scene("res://scenes/endless_game.tscn")	

func _on_how_to_play_pressed():
	get_tree().change_scene("res://scenes/how_to_play.tscn")
