extends Control

var score_label_scene = preload("res://scenes/score.tscn")
var all_scores = []

func _ready():
	yield(SilentWolf.Scores.get_high_scores(3), "sw_scores_received")
#	print("Scores: " + str(SilentWolf.Scores.scores))
	all_scores = SilentWolf.Scores.scores
	show_scores()
	

func show_scores():
	for score in all_scores:
		var player_name = score["player_name"]
		var player_score = str(score["score"])
		print (player_name +"   "+player_score)
		var score_label = score_label_scene.instance()
		score_label.text = player_name +"     "+player_score
		$ScrollContainer/VBoxContainer.add_child(score_label)
		
	
	

