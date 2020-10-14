extends Area2D
export var SPEED = 100


func _ready():
	position.x = 100
	position.y = 100


func move_to(pos, delta):
	var direccion = Vector2(pos.x - position.x, pos.y - position.y)
	if(position - pos).lenght() >= 1:
		position += delta*SPEED*direccion


#func _process(delta):
#	pass
