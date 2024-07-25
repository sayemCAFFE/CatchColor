extends Node

var Red_allow = false
var Blue_allow = false
var Green_allow = false

var my_score = 0
var my_life = 3

var current_level:int = 0

var collect_types = {
	"Red": preload("res://scenes/red.tscn"),
	"Blue": preload("res://scenes/blue.tscn"),
	"Green": preload("res://scenes/green.tscn")
}

var enemy_types = {
	"Vspike": preload("res://scenes/vspike.tscn")
}

var level1 = {
	"color":["Red","Green","Blue"],
	"enemy":["Vspike"]
}

var level2 = {
	"color":["Green","Blue"],
	"enemy":["Vspike"]
	}

var level3 = {
	"color":["Red","Blue","Green"],
	"enemy":["Vspike"]
	}

var levels = [level1,level2,level3]
