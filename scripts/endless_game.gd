extends Node2D

onready var collect_timer = $CollectTimer

var rng = RandomNumberGenerator.new()

func _ready():
	_reset_collect_timer()

func _reset_collect_timer():
	var rnd_time:float = rand_range(1,3)
	collect_timer.wait_time = rnd_time
	collect_timer.start()

func _drop_item(scene):
	var item = scene.instance()
	$"%colors".add_child(item)
	var random_pos = Vector2(rng.randf_range(10,430), rng.randf_range(0,0))
	item.global_position = Vector2(random_pos.x, random_pos.y)
	item.linear_velocity.y = rand_range(item.speed_range.x, item.speed_range.y)
	
 
func _drop_color(scene):
	var item = scene.instance()
	$"%colors".add_child(item)
	var random_pos = Vector2(rng.randf_range(10,430), rng.randf_range(0,0))
	item.global_position = Vector2(random_pos.x, random_pos.y)
	item.linear_velocity.y = rand_range(GlobalVars.endless_speed_range.x, GlobalVars.endless_speed_range.y)
	

func _get_collect():
	var level = GlobalVars.endless_levels[GlobalVars.endless_current]
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



func _on_CollectTimer_timeout():
	print("Collect Timer Done")
	_get_collect()


func _on_EnemyTimer_timeout():
	_get_enemy()


func _on_collect_speed_timer_timeout():
	if GlobalVars.game_type == "endless_game":
		if GlobalVars.endless_speed_range < Vector2(620,620):
			GlobalVars.endless_speed_range += Vector2(20,20)
			print(GlobalVars.endless_speed_range)
		else:
			GlobalVars.endless_speed_range = Vector2(620,620)
			print(GlobalVars.endless_speed_range)
	
