extends Node2D

func _ready():
	sound_check()
	load_menu()
	if GlobalVars.one_time_chack == true:
		var sistem = OS.get_name()
		print(sistem)
		if sistem == "Windows":
			GlobalVars.game_device = "computer_game"
		elif sistem == "Android":
			GlobalVars.game_device = "mobile_game"
			

func load_menu():
	GlobalVars.load_data()
	print ( GlobalVars.data["menu"])
	var menu_loaded = GlobalVars.data["menu"]
	if menu_loaded == -1:
		$sellect_background.visible = true
		if not GlobalVars.last_selected_menu == -1:
			_set_menu(GlobalVars.last_selected_menu)
		else:
			_set_menu(0)
	else:
		$sellect_background.visible = false
		_show_background(menu_loaded)

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


func _on_shop_button_pressed():
	$shop_wondow.visible = true


func _on_cradits_pressed():
	get_tree().change_scene("res://scenes/cradits_scene.tscn")
	$pressed.play()


func _set_menu(selected:int):
	$background1.visible = false
	$background2.visible = false
	$background3.visible = false
	$background4.visible = false
	
	$"%high_light1".visible = false
	$"%high_light2".visible = false
	$"%high_light3".visible = false
	$"%high_light4".visible = false
	
	_show_background(selected)
			
	


func _show_background(selected):
	match selected:
		0:
			GlobalVars.data["menu"] = 0
			$background1.visible = true
			$"%high_light1".visible = true
		1:
			GlobalVars.data["menu"] = 1
			$background2.visible = true
			$"%high_light2".visible = true
		2:
			GlobalVars.data["menu"] = 2
			$background3.visible = true
			$"%high_light3".visible = true
		3:
			GlobalVars.data["menu"] = 3
			$background4.visible = true
			$"%high_light4".visible = true
	
	
	GlobalVars.save_data()

func _on_background1_pressed():
	_set_menu(0)
	

func _on_background2_pressed():
	_set_menu(1)

func _on_background3_pressed():
	_set_menu(2)

func _on_background4_pressed():
	_set_menu(3)

func _on_ok_pressed():
	$sellect_background.visible = false


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/leaderboard.tscn")
