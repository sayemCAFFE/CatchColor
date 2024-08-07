extends Node

var speed_range = Vector2(300,300)
var endless_speed_range = Vector2(300,300)

var game_device : String

var game_type : String
var one_time_chack = true

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
	"Vspike": preload("res://scenes/vspike.tscn")
}

var none

var level1 = {
	"color":["Red"],
	"enemy":["Vspike"]
}

var level2 = {
	"color":["Green","Blue"],
	"enemy":["Vspike"]
	}

var level3 = {
	"color":["Red","Blue"],
	"enemy":["Vspike"]
	}

var level4 = {
	"color":["Green","Red"],
	"enemy":["Vspike"]
	}

var level5 = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike"]
	}

var endless_game = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike"]
	}

var levels = [none,level1,level2,level3,level4,level5]

var endless_levels = [endless_game]
