extends Node

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

var current_level:int = 14
var endless_current:int = 0

var left_to_right = false
var right_to_left = false

var collect_types = {
	"Red": preload("res://scenes/red.tscn"),
	"Blue": preload("res://scenes/blue.tscn"),
	"Green": preload("res://scenes/green.tscn")
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
	"LIVES_text": preload("res://scenes/lives_letter.tscn")
}

var none

var level1 = {
	"color":["Red"],
	"enemy":["Vspike","all_color_lost"],
	"power_up":["speed_power"],
	"background_colour": "res://assests/main_background/colorful/background.png",
	"background_bw": "res://assests/main_background/black_white/background-modified.png"
}

var level2 = {
	"color":["Green","Blue"],
	"enemy":["smile_enemy"],
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

var endless_game1 = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike","vise_varse"],
	"power_up":["LIVES_text"]
	}

var endless_game2 = {
	"color":["Red","Green","Blue"],
	"enemy":["smile_enemy"],
	"power_up":["LIVES_text","life_power"]
	}

var endless_game3 = {
	"color":["Red","Green","Blue"],
	"enemy":["shooter"],
	"power_up":["rainbow_bucket","LIVES_text"]
	}

var levels = [none,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14]

var endless_levels = [endless_game1,endless_game2,endless_game3]
