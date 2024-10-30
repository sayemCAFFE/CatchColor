extends Node2D

func _ready():
	sound_check()
	$normal_sound.play()
	$my_score_label.text = ""+str(GlobalVars.my_score)


func _on_menuButton_pressed():
	$pressed.play()
	get_tree().change_scene("res://scenes/main_menu.tscn")

func sound_check():
	if GlobalVars.sound_on == true:
		$normal_sound.stream_paused = false
		$pressed.stream_paused = false
	if GlobalVars.sound_on == false:
		$normal_sound.stream_paused = true
		$pressed.stream_paused = true
