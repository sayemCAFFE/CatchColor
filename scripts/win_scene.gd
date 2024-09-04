extends Node2D

func _ready():
	$normal_sound.play()

func _on_nextLevel_pressed():
	$pressed.play()
	GlobalVars.current_level += 1
	if GlobalVars.current_level > GlobalVars.levels.size()-1:
		print("game complete")
		GlobalVars.current_level = 0
		get_tree().change_scene("res://scenes/game_scene.tscn")
	else:
		get_tree().change_scene("res://scenes/game_scene.tscn")
	

func _on_main_menu_pressed():
	$pressed.play()
	get_tree().change_scene("res://scenes/main_menu.tscn")
