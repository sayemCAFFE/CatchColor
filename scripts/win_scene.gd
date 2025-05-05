extends Node2D

func _ready():
	GlobalSignals.connect("win_sound", self, "_win_sound")
	

func _win_sound():
	
	$normal_sound.stream_paused = false
	$normal_sound.play()

func _on_nextLevel_pressed():
	$pressed.play()
	
	GlobalVars.left_to_right = false
	GlobalVars.right_to_left = false
	
	GlobalVars.current_level += 1
	if GlobalVars.current_level > GlobalVars.levels.size()-1:
		print("game complete")
		GlobalVars.current_level = 0
		get_tree().change_scene("res://scenes/game_scene.tscn")
	else:
		get_tree().change_scene("res://scenes/game_scene.tscn")
	

func _on_main_menu_pressed():
	$pressed.play()
	
	GlobalVars.left_to_right = false
	GlobalVars.right_to_left = false
	
	get_tree().change_scene("res://scenes/main_menu.tscn")
