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



