extends Control

var my_score = 0
var my_life = 3

func _ready():
	GlobalSignals.connect("update_score", self, "_update_score")
	GlobalSignals.connect("Sign_show", self, "_Sign_show")
	GlobalSignals.connect("life_lost", self, "_life_lost")

func _Sign_show(state):
	if state:
		$"%sign_label".visible = true
		$"%sign_label".text = "! Color Choice Error !"
	else:
		$"%sign_label".visible = false

func _update_score():
	my_score += 1
	$scoreLabel.text = "Score : "+str(my_score)

func _life_lost():
	my_life -= 1
	$lifeLabel.text = "Life : "+str(my_life)
	if my_life == 0:
		get_tree().change_scene("res://scenes/game_over.tscn")


func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/Main_menu.tscn")
