extends Node2D

func _ready():
	GlobalSignals.connect("high_score_show", self, "_high_score_show")
	$high_scoreLabel.text = "High Score : "+str(GlobalVars.high_score)


func _on_menuButton_pressed():
	get_tree().change_scene("res://scenes/Main_menu.tscn")
