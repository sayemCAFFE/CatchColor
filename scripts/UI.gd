extends Control

func _ready():
	GlobalSignals.connect("update_score", self, "_update_score")
	GlobalSignals.connect("Sign_show", self, "_Sign_show")
	GlobalSignals.connect("life_lost", self, "_life_lost")
	GlobalSignals.connect("score_lost",self, "_score_lost")
	$Levels.text = "Level : "+str(GlobalVars.current_level)
	GlobalVars.my_score = 0
	GlobalVars.my_life = 3
	GlobalSignals.connect("high_score_show", self, "_high_score_show")
	$high_score.text = "High Score : "+str(GlobalVars.high_score)
	game_type()
	print(GlobalVars.speed_range)


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

func _update_score():
	GlobalVars.my_score += 1
	$scoreLabel.text = "Score : "+str(GlobalVars.my_score)
	if GlobalVars.game_type == "level_game":
		if GlobalVars.my_score == 10:
			GlobalVars.current_level += 1
			if GlobalVars.speed_range < Vector2(620,620):
				GlobalVars.speed_range += Vector2(20,20)
				print(GlobalVars.speed_range)
			else:
				GlobalVars.speed_range = Vector2(620,620)
				print(GlobalVars.speed_range)
				
			if GlobalVars.current_level > GlobalVars.levels.size()-1:
				print("game complete")
				GlobalVars.current_level = 0
				get_tree().change_scene("res://scenes/game_scene.tscn")
			else:
				get_tree().change_scene("res://scenes/game_scene.tscn")

func _life_lost():
	GlobalVars.my_life -= 1
	$lifeLabel.text = "Life : "+str(GlobalVars.my_life)
	if GlobalVars.my_life == 0:
		if GlobalVars.my_score > GlobalVars.high_score :
			
			GlobalVars.high_score = GlobalVars.my_score
		get_tree().change_scene("res://scenes/game_over.tscn")

func _score_lost():
	GlobalVars.my_score -= 1
	$scoreLabel.text = "Score : "+str(GlobalVars.my_score)
	

func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")
