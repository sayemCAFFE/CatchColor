extends Control

var add_score = 1

func _ready():
	GlobalSignals.connect("update_score", self, "_update_score")
	GlobalSignals.connect("Sign_show", self, "_Sign_show")
	GlobalSignals.connect("life_lost", self, "_life_lost")
	GlobalSignals.connect("score_lost",self, "_score_lost")
	GlobalSignals.connect("life_update", self, "_life_update")
	GlobalSignals.connect("double_point", self, "_double_point")
	GlobalSignals.connect("vise_verse_do", self, "_vise_verse_do")
	GlobalSignals.connect("coin_show", self, "_coin_show")
	$Levels.text = "Level : "+str(GlobalVars.current_level)
	GlobalVars.my_score = 0
	GlobalVars.my_life = 3
	GlobalSignals.connect("high_score_show", self, "_high_score_show")
#	$high_score.text = ""+str(GlobalVars.high_score)
	$high_score.text = ""+str(GlobalVars.data["high_score"])
	game_type()
	game_device()
	sound_check()
	print(GlobalVars.speed_range)
	var game_device = false

func _vise_verse_do():
	GlobalVars.left_to_right = true
	GlobalVars.right_to_left = true
	$vise_varse_time.start()

func _coin_show():
	$"%coin_show".text = "$"+str(GlobalVars.data["coins"])
	$"%fade_in".interpolate_property($"%coin_panel", "modulate:a", 0.0, 1.0, 1.0)
	$"%fade_in".start()

func sound_check():
	if GlobalVars.sound_on == true:
		$error.stream_paused = false
		$collect.stream_paused = false
		$player_hit.stream_paused = false
	if GlobalVars.sound_on == false:
		$error.stream_paused = true
		$collect.stream_paused = true
		$player_hit.stream_paused = true

func _double_point():
	add_score = 2
	$doublescoretime.start()

func _life_update():
	GlobalVars.my_life += 1
	$life_power.play()
	$lifeLabel.text = ""+str(GlobalVars.my_life) 

func game_device():
	$"%right".visible = true
	$"%left".visible = true
#	if GlobalVars.game_device == "computer_game":
#		$"%right".visible = false
#		$"%left".visible = false
#	if GlobalVars.game_device == "mobile_game":
#		$"%right".visible = true
#		$"%left".visible = true


func game_type():
	if GlobalVars.game_type == "level_game":
		$lifeLabel.visible = true
		$scoreLabel.visible = true
		$BackButton.visible = true
		$Levels.visible = true
		$high_score.visible = false
	if GlobalVars.game_type == "endless_game":
		$lifeLabel.visible = true
		$scoreLabel.visible = true
		$BackButton.visible = true
		$Levels.visible = false
		$high_score.visible = true

func _Sign_show(state):
	if state:
		$"%sign_label".visible = true
		$"%sign_label".text = "! Color Choice Error !"
	else:
		$"%sign_label".visible = false
		$collect.play()

func _update_score():
	GlobalVars.my_score += add_score
	$scoreLabel.text = ""+str(GlobalVars.my_score)


func _life_lost():
	GlobalVars.my_life -= 1
	$player_hit.play()
	$lifeLabel.text = ""+str(GlobalVars.my_life)
	if GlobalVars.my_life == 0:
		if GlobalVars.game_type == "endless_game":
			if GlobalVars.my_score > GlobalVars.data["high_score"] :
				
				GlobalVars.data["high_score"] = GlobalVars.my_score
				GlobalVars.save_data()
				
		GlobalVars.speed_range = Vector2(300,300)
		GlobalVars.endless_speed_range = Vector2(300,300)
		get_tree().change_scene("res://scenes/game_over.tscn")

#		GlobalVars.data["high_score"] += 1000
#		GlobalSignals.emit_signal("coin_update")
#		GlobalVars.save_data()

func _score_lost():
	$error.play()
	GlobalVars.my_score -= 1
	$scoreLabel.text = ""+str(GlobalVars.my_score)
	

func _on_BackButton_pressed():
	$pressed.play()
	GlobalVars.speed_range = Vector2(300,300)
	GlobalVars.endless_speed_range = Vector2(300,300)
	get_tree().change_scene("res://scenes/main_menu.tscn")

func _on_right_button_down():
	if GlobalVars.right_to_left == true:
		GlobalSignals.emit_signal("move_left")
	if GlobalVars.right_to_left == false:
		GlobalSignals.emit_signal("move_right")

func _on_right_button_up():
	if GlobalVars.right_to_left == true:
		GlobalSignals.emit_signal("left_stop")
	if GlobalVars.right_to_left == false:
		GlobalSignals.emit_signal("right_stop")

func _on_left_button_up():
	if GlobalVars.left_to_right == true:
		GlobalSignals.emit_signal("right_stop")
	if GlobalVars.left_to_right == false:
		GlobalSignals.emit_signal("left_stop")

func _on_left_button_down():
	if GlobalVars.left_to_right == true:
		GlobalSignals.emit_signal("move_right")
	if GlobalVars.left_to_right == false:
		GlobalSignals.emit_signal("move_left")

func _on_doublescoretime_timeout():
	add_score = 1

func _on_vise_varse_time_timeout():
	GlobalVars.left_to_right = false
	GlobalVars.right_to_left = false

func _on_fade_in_tween_completed(object, key):
	var fade_out = create_tween()
	fade_out.tween_property($"%coin_panel", "modulate:a", 0.0, 4.0)
