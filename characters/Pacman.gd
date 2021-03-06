extends KinematicBody2D

export var SPEED = 100
var velocity = Vector2(0,0)
signal newscore
var can_move = false

var score = 0

func move(delta):
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		get_node("Sprite").rotation_degrees = 0
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		get_node("Sprite").rotation_degrees = 180
	elif Input.is_action_pressed("move_down"):
		velocity.y = SPEED
		get_node("Sprite").rotation_degrees = 90
	elif Input.is_action_pressed("move_up"):
		velocity.y = -SPEED
		get_node("Sprite").rotation_degrees = 270
	
	velocity = move_and_slide(velocity)
	if position.x < 0: 
		position.x = 226
	if position.x > 226:
		position.x = 0 

func _process(delta):
	if can_move:
		move(delta)

func eat_small_pill():
	emit_signal("newscore")
	score += 10


func _on_Timer_timeout():
	can_move = true
