extends Control

func _ready():
	GlobalSignals.connect("update_score", self, "_update_score")
	GlobalSignals.connect("Sign_show", self, "_Sign_show")
	GlobalSignals.connect("life_lost", self, "_life_lost")
	GlobalSignals.connect("score_lost",self, "_score_lost")
	$Levels.text = "Level : "+str(GlobalVars.current_level)

func _Sign_show(state):
	if state:
		$"%sign_label".visible = true
		$"%sign_label".text = "! Color Choice Error !"
	else:
		$"%sign_label".visible = false

func _update_score():
	GlobalVars.my_score += 1
	$scoreLabel.text = "Score : "+str(GlobalVars.my_score)
	if GlobalVars.my_score == 10:
		GlobalVars.current_level += 1
		if GlobalVars.current_level > GlobalVars.levels.size()-1:
			print("game complete")
			GlobalVars.current_level = 0
			get_tree().change_scene("res://scenes/gameScene.tscn")
		else:
			get_tree().change_scene("res://scenes/gameScene.tscn")

func _life_lost():
	GlobalVars.my_life -= 1
	$lifeLabel.text = "Life : "+str(GlobalVars.my_life)
	if GlobalVars.my_life == 0:
		get_tree().change_scene("res://scenes/game_over.tscn")

func _score_lost():
	GlobalVars.my_score -= 1
	$scoreLabel.text = "Score : "+str(GlobalVars.my_score)
	

func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/Main_menu.tscn")
