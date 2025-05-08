extends Panel


func set_labels(the_name, the_score, position):
	$PlayerName.text = position + ": "+the_name
	$Score.text = the_score

