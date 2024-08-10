extends Node2D

func _ready():
	sound_check()

func _on_first_page_button_pressed():
	$pressed.play()
	get_tree().change_scene("res://scenes/how_to_play.tscn")

func sound_check():
	if GlobalVars.sound_on == true:
		$normal_sound.stream_paused = false
		$pressed.stream_paused = false
	if GlobalVars.sound_on == false:
		$normal_sound.stream_paused = true
		$pressed.stream_paused = true
