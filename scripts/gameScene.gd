extends Node2D

onready var collect_timer = $CollectTimer

func _ready():
	_reset_collect_timer()


func _reset_collect_timer():
	var rnd_time:float = rand_range(1,3)
	collect_timer.wait_time = rnd_time
	collect_timer.start()

func _drop_items(scene):
	var item = scene.instance()
	add_child(item)
	item.linear_velocity.y = rand_range(item.speed_range.x, item.speed_range.y)  
#	var left = randi() % 2
#	if left == 0:
#		item.global_position = $LeftPos.global_position
#	else:
#		item.global_position = $RightPos.global_position

 
func _get_collect():
	var level = GlobalVars.levels[GlobalVars.current_level]
	var collect_items = level["color"]
	var collect_count = collect_items.size()
	var rng = randi() % collect_count
	var to_drop = collect_items[rng]
	_drop_items(GlobalVars.collect_types[to_drop])

func _get_enemy():
	var level = GlobalVars.levels[GlobalVars.current_level]
	var enemy_items = level["enemy"]
	var enemy_count = enemy_items.size()
	var rng = randi() % enemy_count
	var to_drop = enemy_items[rng]
	_drop_items(GlobalVars.enemy_types[to_drop])



func _on_CollectTimer_timeout():
	print("Collect Timer Done")
	_get_collect()


func _on_EnemyTimer_timeout():
	_get_enemy()
