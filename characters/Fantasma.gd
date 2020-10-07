extends Area2D
export var SPEED = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 100
	position.y = 100	
func move_to(pos,delta):
	var direccion = Vector2(pos.x - position.x,pos.y - position.y).normalized()
	if (position  - pos).length() >= 1:
		position += delta*SPEED*direccion
		
func _process(delta):
	var pos = Vector2(200,200)
	move_to(pos,delta)
