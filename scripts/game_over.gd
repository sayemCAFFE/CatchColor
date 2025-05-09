extends Node2D

func _ready():
	sound_check()
	$"%Button".visible = true
	$"%Sprite2".visible = false
	$normal_sound.play()
	$my_score_label.text = ""+str(GlobalVars.my_score)


func _on_menuButton_pressed():
	GlobalVars.left_to_right = false
	GlobalVars.right_to_left = false
	
#	get_tree().change_scene()
	
	$pressed.play()
	get_tree().change_scene("res://scenes/main_menu.tscn")

func sound_check():
	if GlobalVars.sound_on == true:
		$normal_sound.stream_paused = false
		$pressed.stream_paused = false
	if GlobalVars.sound_on == false:
		$normal_sound.stream_paused = true
		$pressed.stream_paused = true
	

func _on_Button_pressed():
	var player_name = $"%LineEdit".text.strip_edges()
	if player_name != "":
		$Control/Button.disabled = true
		SilentWolf.Scores.persist_score(player_name, GlobalVars.my_score)
	$"%Button".visible = false
	$"%Sprite2".visible = true

