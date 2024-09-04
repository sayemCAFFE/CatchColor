extends RigidBody2D

var speed_range = Vector2(150,200)

var enemy_bullet_scene = preload("res://scenes/shooter_bullet.tscn")

func _ready():
	$shoot_timer.start()

func _on_shoot_timer_timeout():
	var enemy_bullet = enemy_bullet_scene.instance()
	get_parent().add_child(enemy_bullet)
	enemy_bullet.global_position = ($"%gun_pos".global_position)
	enemy_bullet.linear_velocity.y = rand_range(enemy_bullet.speed_range.x, enemy_bullet.speed_range.y)


func _on_shooter_area_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		GlobalSignals.emit_signal("life_lost")
		print("life_lost")
	if body.is_in_group("floor"):
		queue_free()

