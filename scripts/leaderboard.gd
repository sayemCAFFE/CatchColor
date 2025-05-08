extends Control

var score_label_scene = preload("res://scenes/score_row.tscn")
#var score_label_scene = preload("res://scenes/score_row.tscn")
var all_scores = []

func _ready():
	$Label4.visible = true
	yield(SilentWolf.Scores.get_high_scores(20), "sw_scores_received")
#	print("Scores: " + str(SilentWolf.Scores.scores))
	all_scores = SilentWolf.Scores.scores
	show_scores()
	

#func show_scores():
#	for score in all_scores:
#		var player_name = score["player_name"]
#		var player_score = str(score["score"])
#		print (player_name +"   "+player_score)
#		var score_label = score_label_scene.instance()
#		score_label.text = player_name +"     "+player_score
#		$"%VBoxContainer".add_child(score_label)
		
func show_scores():
	var position = 1
	for score in all_scores:
		var player_name = score["player_name"]
		var player_score = str(score["score"])
		var score_label = score_label_scene.instance()
		score_label.set_labels(player_name, player_score, str(position))
		$Label4.visible = false
		$"%VBoxContainer".add_child(score_label)
		position += 1
		
	


func _on_back_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")
