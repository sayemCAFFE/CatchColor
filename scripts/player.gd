extends KinematicBody2D

var direction := Vector2.ZERO
export var speed = 450

var gravity = 1200
var jump_speed = -500

var Red_allow = false
var Blue_allow = false
var Green_allow = false

func _ready():
	pass


func _process(delta):
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		direction.x = -1
		
	if Input.is_action_pressed("right"):
		direction.x = 1
		
	direction = direction.normalized()
	
	move_and_slide(direction * speed)
	
	if Input.is_action_pressed("one"):
		Red_allow = true
		Blue_allow = false
		Green_allow = false
		GlobalSignals.emit_signal("red_color")
		GlobalSignals.emit_signal("blue_color_Off")
		GlobalSignals.emit_signal("green_color_Off")
		
	if Input.is_action_pressed("two"):
		Blue_allow = true
		Green_allow = false
		Red_allow = false
		GlobalSignals.emit_signal("blue_color")
		GlobalSignals.emit_signal("green_color_Off")
		GlobalSignals.emit_signal("red_color_Off")
		
	if Input.is_action_pressed("three"):
		Green_allow = true
		Red_allow = false
		Blue_allow = false
		GlobalSignals.emit_signal("green_color")
		GlobalSignals.emit_signal("red_color_Off")
		GlobalSignals.emit_signal("blue_color_Off")
		
	




