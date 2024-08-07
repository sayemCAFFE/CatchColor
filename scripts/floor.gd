extends StaticBody2D

func _ready():
	pass 

func _on_floor_body_entered(body):
	if body.is_in_group("color"):
		$hit_drop.play()
	if body.is_in_group("enemy"):
		$hit_drop.play()
