extends Node2D

func _ready():
	sound_check()
	if GlobalVars.one_time_chack == true:
		var sistem = OS.get_name()
		print(sistem)
		if sistem == "Windows":
			GlobalVars.game_device = "computer_game"
		elif sistem == "Android":
			GlobalVars.game_device = "mobile_game"

func sound_check():
	if GlobalVars.sound_on == true:
		$normal_sound.stream_paused = false
		$pressed.stream_paused = false
	if GlobalVars.sound_on == false:
		$normal_sound.stream_paused = true
		$pressed.stream_paused = true

func _on_level_button_pressed():
	$pressed.play()
	GlobalVars.game_type = "level_game"
	get_tree().change_scene("res://scenes/game_scene.tscn")

func _on_endless_button_pressed():
	$pressed.play()
	GlobalVars.game_type = "endless_game"
	get_tree().change_scene("res://scenes/endless_game.tscn")	

func _on_how_to_play_pressed():
	$pressed.play()
	get_tree().change_scene("res://scenes/how_to_play.tscn")

func _on_settings_pressed():
	$pressed.play()
	get_tree().change_scene("res://scenes/settings.tscn")
