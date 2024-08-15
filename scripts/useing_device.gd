extends Node2D

var sound_text : String

func _ready():
	sound_buttons_state()
	sound_check()

func sound_check():
	if GlobalVars.sound_on == true:
		$normal_sound.stream_paused = false
		$pressed.stream_paused = false
	if GlobalVars.sound_on == false:
		$normal_sound.stream_paused = true
		$pressed.stream_paused = true

func _on_computer_button_pressed():
	GlobalVars.one_time_chack = false
	GlobalVars.game_device = "computer_game"
	get_tree().change_scene("res://scenes/main_menu.tscn")
	print("computer")

func _on_mobile_button_pressed():
	GlobalVars.one_time_chack = false
	GlobalVars.game_device = "mobile_game"
	get_tree().change_scene("res://scenes/main_menu.tscn")
	print("mobile")

func _on_back_button_pressed():
	$pressed.play()
	get_tree().change_scene("res://scenes/main_menu.tscn")

func sound_buttons_state():
	$"%on_icon".visible = GlobalVars.sound_on
	$"%on_icon2".visible = not GlobalVars.sound_on

func _on_on_pressed():
	GlobalVars.sound_on = true
	sound_check()
	sound_buttons_state()

func _on_off_pressed():
	GlobalVars.sound_on = false
	sound_check()
	sound_buttons_state()
