extends Node

var Red_allow = false
var Blue_allow = false
var Green_allow = false

var current_level:int = 0

var collect_types = {
	"Red": preload("res://scenes/Red.tscn"),
	"Blue": preload("res://scenes/Blue.tscn"),
	"Green": preload("res://scenes/green.tscn")
}

var enemy_types = {
	"Vspike": preload("res://scenes/enemy.tscn")
}

var level1 = {
	"color":["Green","Red","Blue"],
	"enemy":["Vspike"]
}

var level2 = {
	"color":["Red","Blue"],
	"enemy":["Vspike"]
	}


var levels = [level1,level2]
