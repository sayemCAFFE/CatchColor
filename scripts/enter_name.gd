extends Control

func _ready():
	pass
#	get_tree().create_timer(1.0).timeout
#	$LineEdit.grab_focus()
	

func _on_Button_pressed():
	var player_name = $LineEdit.text.strip_edges()
	if player_name != "":
		SilentWolf.Scores.persist_score(player_name, GlobalVars.my_score)
