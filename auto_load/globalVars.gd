extends Node

var speed_range = Vector2(300,300)
var endless_speed_range = Vector2(300,300)

var game_device : String

var game_type : String
var one_time_chack = true

var sound_on = true

var one_time = true

var Red_allow = false
var Blue_allow = false
var Green_allow = false

var my_score = 0
var high_score = 0
var my_life = 3

var current_level:int = 1
var endless_current:int = 0

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
	"speed_power": preload("res://scenes/speed.tscn")
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
	"enemy":["shooter"],
	"power_up":["life_power"],
	"background_colour": "res://assests/main_background/colorful/tree_colour.png",
	"background_bw": "res://assests/main_background/black_white/tree_bw.png"
	}

var level5 = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike","shooter"],
	"power_up":["life_power","speed_power"],
	"background_colour": "res://assests/main_background/colorful/tree.png",
	"background_bw": "res://assests/main_background/black_white/tree-modified.png"
	}

var endless_game1 = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike","vise_varse"],
	"power_up":["life_power","speed_power"]
	}

var endless_game2 = {
	"color":["Red","Green","Blue"],
	"enemy":["smile_enemy"],
	"power_up":["life_power","speed_power"]
	}

var endless_game3 = {
	"color":["Red","Green","Blue"],
	"enemy":["shooter"],
	"power_up":["life_power","speed_power"]
	}

var levels = [none,level1,level2,level3,level4,level5]

var endless_levels = [endless_game1,endless_game2,endless_game3]
