extends KinematicBody2D

var direction := Vector2.ZERO
export var speed = 350

var gravity = 1200
var jump_speed = -500

var mobile_move_right = false
var mobile_move_left = false

var left_to_right = false
var right_to_left = false

func _ready():
	GlobalSignals.connect("move_right", self, "_move_right")
	GlobalSignals.connect("right_stop", self, "_right_stop")
	GlobalSignals.connect("move_left",self, "_move_left")
	GlobalSignals.connect("left_stop", self, "_left_stop")
	GlobalSignals.connect("speed_power", self, "_speed_power")
	GlobalSignals.connect("vise_verse_do",self, "_vise_verse_do")
	GlobalSignals.connect("rainbow_bucket_active", self, "_rainbow_bucket_active")

func _rainbow_bucket_active():
	$rainbow_power_timer.start()
	$rainbow_player.visible = true
	$player.visible = false
	$"%CollisionShape".set_deferred("disabled", false)
	

func _vise_verse_do():
	$vise_varse_time.start()
	left_to_right = true
	right_to_left = true

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
		if left_to_right == false:
			direction.x = -1
		if left_to_right == true:
			direction.x = 1
	if Input.is_action_pressed("right"):
		if right_to_left == false:
			direction.x = 1
		if right_to_left == true:
			direction.x = -1
			
	if mobile_move_right == true:
		direction.x = 1
	
	if mobile_move_left == true:
		direction.x = -1
	
	direction = direction.normalized()
	
	move_and_slide(direction * speed)
	
	if Input.is_action_pressed("one"):
		if GlobalVars.rainbow_bucket_allow == false:
			GlobalVars.Red_allow = true
			GlobalVars.Blue_allow = false
			GlobalVars.Green_allow = false
			GlobalSignals.emit_signal("red_color")
			GlobalSignals.emit_signal("blue_color_Off")
			GlobalSignals.emit_signal("green_color_Off")
		
	if Input.is_action_pressed("two"):
		if GlobalVars.rainbow_bucket_allow == false:
			GlobalVars.Blue_allow = true
			GlobalVars.Green_allow = false
			GlobalVars.Red_allow = false
			GlobalSignals.emit_signal("blue_color")
			GlobalSignals.emit_signal("green_color_Off")
			GlobalSignals.emit_signal("red_color_Off")
		
	if Input.is_action_pressed("three"):
		if GlobalVars.rainbow_bucket_allow == false:
			GlobalVars.Green_allow = true
			GlobalVars.Red_allow = false
			GlobalVars.Blue_allow = false
			GlobalSignals.emit_signal("green_color")
			GlobalSignals.emit_signal("red_color_Off")
			GlobalSignals.emit_signal("blue_color_Off")
		

func _on_vise_varse_time_timeout():
	$vise_varse_time.stop()
	left_to_right = false
	right_to_left = false

func _on_rainbow_power_timer_timeout():
	GlobalVars.rainbow_bucket_allow = false
	GlobalVars.Blue_allow = false
	GlobalVars.Red_allow = false
	GlobalVars.Green_allow = false
	GlobalSignals.emit_signal("red_color_Off")
	GlobalSignals.emit_signal("green_color_Off")
	GlobalSignals.emit_signal("blue_color_Off")
	$rainbow_player.visible = false
	$player.visible = true
	$"%CollisionShape".set_deferred("disabled", true)
	
