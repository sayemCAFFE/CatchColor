extends KinematicBody2D

var direction := Vector2.ZERO
export var speed = 450

var gravity = 1200
var jump_speed = -500

func _ready():
	pass

func _input(event):
	
	direction.x = 0
	
	if Input.is_action_pressed("left"):
		direction.x -= speed
	
	if Input.is_action_pressed("right"):
		direction.x += speed
	
	direction = direction.normalized()
	
	move_and_slide(direction * speed)


func _process(delta):
	direction.y += gravity * delta
	
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			direction.y = jump_speed
	
	direction = move_and_slide(direction,  Vector2.UP)
	
