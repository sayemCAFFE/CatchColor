extends Node2D

onready var collect_timer = $"%CollectTimer"

var rng = RandomNumberGenerator.new()

func _ready():
	$win_scene.visible = false
	sound_check()
	GlobalSignals.connect("update_score", self, "_update_score")
	GlobalSignals.connect("score_lost", self, "_score_lost")
	_reset_collect_timer()
	if GlobalVars.game_type == "level_game":
		_level_background()

func _level_background():
	var texture = load(GlobalVars.levels[GlobalVars.current_level]["background_colour"])
	$"%background".texture = texture
	var texture_bw = load(GlobalVars.levels[GlobalVars.current_level]["background_bw"])
	$"%background2".texture = texture_bw

func sound_check():
	if GlobalVars.sound_on == true:
		$"%game_sound".stream_paused = false
		$"%pressed".stream_paused = false
	if GlobalVars.sound_on == false:
		$"%pressed".stream_paused = true
		$"%game_sound".stream_paused = true

func _update_score():
	if GlobalVars.game_type == "level_game":
		$"%backgroundcolor".scale.y += 0.05
		if $"%backgroundcolor".scale.y >= 0.95:
			$win_scene.visible = true
			$game.queue_free()
			if GlobalVars.speed_range < Vector2(620,620):
				GlobalVars.speed_range += Vector2(20,20)
				print(GlobalVars.speed_range)
			else:
				GlobalVars.speed_range = Vector2(620,620)
				print(GlobalVars.speed_range)


func _score_lost():
	if GlobalVars.game_type == "level_game":
		if $"%backgroundcolor".scale.y > 0.0:
			$"%backgroundcolor".scale.y -= 0.05

func _reset_collect_timer():
	var rnd_time:float = rand_range(1,3)
	collect_timer.wait_time = rnd_time
	collect_timer.start()

func _drop_item(scene):
	var item = scene.instance()
	$"%colors".add_child(item)
	var random_pos = Vector2(rng.randf_range(20,370), rng.randf_range(10,10))
	item.global_position = Vector2(random_pos.x, random_pos.y)
	item.linear_velocity.y = rand_range(item.speed_range.x, item.speed_range.y)
	
 
func _drop_color(scene):
	var item = scene.instance()
	$"%colors".add_child(item)
	var random_pos = Vector2(rng.randf_range(10,370), rng.randf_range(0,0))
	item.global_position = Vector2(random_pos.x, random_pos.y)
	item.linear_velocity.y = rand_range(GlobalVars.speed_range.x, GlobalVars.speed_range.y)
	

func _get_collect():
	var level = GlobalVars.levels[GlobalVars.current_level]
	var collect_items = level["color"]
	var collect_count = collect_items.size()
	var rng = randi() % collect_count
	var to_drop = collect_items[rng]
	_drop_color(GlobalVars.collect_types[to_drop])

func _get_enemy():
	var level = GlobalVars.levels[GlobalVars.current_level]
	var enemy_items = level["enemy"]
	var enemy_count = enemy_items.size()
	var rng = randi() % enemy_count
	var to_drop = enemy_items[rng]
	_drop_item(GlobalVars.enemy_types[to_drop])

func _get_power_up():
	var level = GlobalVars.endless_levels[GlobalVars.endless_current]
	var power_up_items = level["power_up"]
	var power_up_count = power_up_items.size()
	var rng = randi() % power_up_count
	var to_drop = power_up_items[rng]
	_drop_item(GlobalVars.power_up_types[to_drop])

func _on_CollectTimer_timeout():
	print("Collect Timer Done")
	_get_collect()


func _on_EnemyTimer_timeout():
	_get_enemy()

func _on_power_up_timer_timeout():
	_get_power_up()
