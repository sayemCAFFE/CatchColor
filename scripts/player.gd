extends KinematicBody2D

var direction := Vector2.ZERO
export var speed = 350

var gravity = 1200
var jump_speed = -500

var mobile_move_right = false
var mobile_move_left = false

func _ready():
	GlobalSignals.connect("move_right", self, "_move_right")
	GlobalSignals.connect("right_stop", self, "_right_stop")
	GlobalSignals.connect("move_left",self, "_move_left")
	GlobalSignals.connect("left_stop", self, "_left_stop")
	GlobalSignals.connect("speed_power", self, "_speed_power")

func _move_right():
	mobile_move_right = true

func _right_stop():
	mobile_move_right = false

func _move_left():
	mobile_move_left = true

func _left_stop():
	mobile_move_left = false

func _speed_power():
	if speed <  600:
		speed += 50
		

func _process(delta):
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		direction.x = -1
		
	if Input.is_action_pressed("right"):
		direction.x = 1
		
	if mobile_move_right == true:
		direction.x = 1
	
	if mobile_move_left == true:
		direction.x = -1
	
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
		
	




