extends KinematicBody2D

var direction := Vector2.ZERO
export var speed = 450

var gravity = 1200
var jump_speed = -500

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
		GlobalVars.Red_allow = true
		GlobalVars.Blue_allow = false
		GlobalVars.Green_allow = false
		GlobalSignals.emit_signal("red_color")
		GlobalSignals.emit_signal("blue_color_Off")
		GlobalSignals.emit_signal("green_color_Off")
		
	if Input.is_action_pressed("two"):
		GlobalVars.Blue_allow = true
		GlobalVars.Green_allow = false
		GlobalVars.Red_allow = false
		GlobalSignals.emit_signal("blue_color")
		GlobalSignals.emit_signal("green_color_Off")
		GlobalSignals.emit_signal("red_color_Off")
		
	if Input.is_action_pressed("three"):
		GlobalVars.Green_allow = true
		GlobalVars.Red_allow = false
		GlobalVars.Blue_allow = false
		GlobalSignals.emit_signal("green_color")
		GlobalSignals.emit_signal("red_color_Off")
		GlobalSignals.emit_signal("blue_color_Off")
		
	




