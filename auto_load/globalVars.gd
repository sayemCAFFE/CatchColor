extends Node

var path : String = "user://save.txt"

var speed_range = Vector2(300,300)
var endless_speed_range = Vector2(300,300)

var game_device : String

var LIVES_text : String
var lives_letter_count = 0

var game_type : String
var one_time_chack = true

var sound_on = true

var one_time = true

var Red_allow = false
var Blue_allow = false
var Green_allow = false

var rainbow_bucket_allow = false

var my_score = 0
var high_score = 0
var my_life = 3
var coins : int

var current_level:int = 1
var endless_current:int = 0

var left_to_right = false
var right_to_left = false

var bucket_textures = [
	preload("res://assests/others/buckets/gray_bucket.png"),
	preload("res://assests/others/buckets/glass_bucket.png"),
	preload("res://assests/others/buckets/bubble_bucket.png"),
	preload("res://assests/others/buckets/tigras_bucket.png"),
	preload("res://assests/others/buckets/gold_bucket.png"),
	preload("res://assests/others/buckets/nightstar_bucket.png"),
	preload("res://assests/others/buckets/spiksta.png"),
	preload("res://assests/others/buckets/circle_bucket.png"),
	preload("res://assests/others/buckets/itra_bucket.png"),
	preload("res://assests/others/buckets/smaha.png"),
	preload("res://assests/others/buckets/snake_bucket.png"),
	preload("res://assests/others/buckets/lion.png"),
	preload("res://assests/others/buckets/ninja_power.png"),
	preload("res://assests/others/buckets/colorfiled_bucket.png"),
	preload("res://assests/others/buckets/cosho.png"),
	preload("res://assests/others/buckets/crown.png")
]

var collect_types = {
	"Red": preload("res://scenes/red.tscn"),
	"Blue": preload("res://scenes/blue.tscn"),
	"Green": preload("res://scenes/green.tscn")
}

var coin_type = {
	"normal_coin" : preload("res://scenes/coin.tscn")
}

var enemy_types = {
	"Vspike": preload("res://scenes/vspike.tscn"),
	"smile_enemy": preload("res://scenes/smile_enemy.tscn"),
	"shooter": preload("res://scenes/shooter_enemy.tscn"),
	"vise_varse":preload("res://scenes/vise_verse.tscn"),
	"all_color_lost": preload("res://scenes/color_lost.tscn")
}

var power_up_types = {
	"life_power": preload("res://scenes/life.tscn"),
	"speed_power": preload("res://scenes/speed.tscn"),
	"rainbow_bucket": preload("res://scenes/rainbow_bucket.tscn"),
	"2xpower": preload("res://scenes/2xpower.tscn"),
	"LIVES_text": preload("res://scenes/lives_letter.tscn"),
	"test_coin" : preload("res://scenes/coin.tscn")
}

var data : Dictionary = {
	"items" : {
		"gray" : true,
		"glass" : false,
		"monste" : false,
		"tigres" : false,
		"star" : false,
		"night_star" : false,
		"spiksta" : false,
		"circle" : false,
		"ilra" : false,
		"smaha" : false,
		"snake" : false,
		"lion" : false,
		"ninja" : false,
		"rainbow" : false,
		"cosho" : false,
		"crown" : false
	},
	"selected_player_index" : 0,
	"coins" : 0,
	"high_score" : 0,
	"menu" : -1
}

var last_selected_menu = -1

func save_data():
	var file := File.new()
	file.open(path, File.WRITE)
	
	var game_data : Dictionary = {
		"data" : data
	}
	file.store_var(game_data)
	file.close()

func load_data():
	var file := File.new()
	file.open(path, File.READ)
	if !file.file_exists(path):
		print ("no save file")
		return
	var game_data = file.get_var()
	data = game_data["data"]
	file.close()

func get_coins_as_text():
	return "$" + str(data["coins"])

var none

var level1 = {
	"color":["Red"],
	"enemy":["Vspike"],
	"power_up":["speed_power"],
	"background_colour": "res://assests/main_background/colorful/background.png",
	"background_bw": "res://assests/main_background/black_white/background-modified.png"
}

var level2 = {
	"color":["Green","Blue"],
	"enemy":["smile_enemy","all_color_lost"],
	"power_up":["speed_power"],
	"background_colour": "res://assests/main_background/colorful/blue_home.png",
	"background_bw": "res://assests/main_background/black_white/blue_home-modified.png"
	}

var level3 = {
	"color":["Red","Blue"],
	"enemy":["Vspike","smile_enemy"],
	"power_up":["life_power"],
	"background_colour": "res://assests/main_background/colorful/color_background.png",
	"background_bw": "res://assests/main_background/black_white/color_background-modified.png"
	}

var level4 = {
	"color":["Green","Red"],
	"enemy":["Vspike"],
	"power_up":["life_power"],
	"background_colour": "res://assests/main_background/colorful/tree_colour.png",
	"background_bw": "res://assests/main_background/black_white/tree_bw.png"
	}

var level5 = {
	"color":["Red","Green","Blue"],
	"enemy":["vise_varse"],
	"power_up":["life_power","speed_power"],
	"background_colour": "res://assests/main_background/colorful/tree.png",
	"background_bw": "res://assests/main_background/black_white/tree-modified.png"
	}

var level6 = {
	"color":["Red","Green","Blue"],
	"enemy":["all_color_lost","vise_varse"],
	"power_up":["life_power","rainbow_bucket"],
	"background_colour": "res://assests/main_background/colorful/blue_duck.png",
	"background_bw": "res://assests/main_background/black_white/blue_duck-modified.png"
	}

var level7 = {
	"color":["Red","Green","Blue"],
	"enemy":["smile_enemy","vise_varse"],
	"power_up":["speed_power","rainbow_bucket"],
	"background_colour": "res://assests/main_background/colorful/camera_man.png",
	"background_bw": "res://assests/main_background/black_white/camera_man-modified.png"
	}

var level8 = {
	"color":["Red","Green","Blue"],
	"enemy":["vise_varse"],
	"power_up":["2xpower","life_power"],
	"background_colour": "res://assests/main_background/colorful/flower.png",
	"background_bw": "res://assests/main_background/black_white/flower-modified.png"
	}

var level9 = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike","smile_enemy"],
	"power_up":["2xpower","speed_power"],
	"background_colour": "res://assests/main_background/colorful/house.png",
	"background_bw": "res://assests/main_background/black_white/house-modified.png"
	}

var level10 = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike"],
	"power_up":["2xpower","life_power"],
	"background_colour": "res://assests/main_background/colorful/parrot.png",
	"background_bw": "res://assests/main_background/black_white/parrot-modified.png"
	}

var level11 = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike","vise_varse"],
	"power_up":["rainbow_bucket","life_power"],
	"background_colour": "res://assests/main_background/colorful/santa.png",
	"background_bw": "res://assests/main_background/black_white/santa-modified.png"
	}

var level12 = {
	"color":["Red","Green","Blue"],
	"enemy":["smile_enemy","shooter"],
	"power_up":["rainbow_bucket","life_power"],
	"background_colour": "res://assests/main_background/colorful/tree_colour.png",
	"background_bw": "res://assests/main_background/black_white/tree_bw.png"
	}

var level13 = {
	"color":["Red","Green","Blue"],
	"enemy":["shooter"],
	"power_up":["2xpower","speed_power"],
	"background_colour": "res://assests/main_background/colorful/soilder_boy.png",
	"background_bw": "res://assests/main_background/black_white/soilder_boy-modified.png"
	}

var level14 = {
	"color":["Red","Green","Blue"],
	"enemy":["shooter"],
	"power_up":["2xpower","life_power"],
	"background_colour": "res://assests/main_background/colorful/tiger.png",
	"background_bw": "res://assests/main_background/black_white/tiger-modified.png"
	}

var level15 = {
	"color":["Red","Green","Blue"],
	"enemy":["shooter"],
	"power_up":["2xpower","speed_power"],
	"background_colour": "res://assests/main_background/colorful/ultapalta.png",
	"background_bw": "res://assests/main_background/black_white/ultapalta-modified.png"
}

var endless_game1 = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike","vise_varse"],
	"power_up":["LIVES_text"],
	"coin":["normal_coin"],
	}

var endless_game2 = {
	"color":["Red","Green","Blue"],
	"enemy":["smile_enemy"],
	"power_up":["LIVES_text","life_power"],
	"coin":["normal_coin"]
	}

var endless_game3 = {
	"color":["Red","Green","Blue"],
	"enemy":["shooter"],
	"power_up":["rainbow_bucket","LIVES_text"],
	"coin":["normal_coin"]
	}

var levels = [none,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15]

var endless_levels = [endless_game1,endless_game2,endless_game3]
