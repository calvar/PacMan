extends Area2D

export var SPEED = 100

onready var navigation = get_tree().get_root().find_node("Navigation2D",true,false)
onready var destinations = navigation.get_node("Destinations")
onready var pacman = get_tree().get_root().find_node("Pacman",true,false)

var velocity = Vector2(0,0)
var path = []

func _ready():
	print(destinations.get_node("Position0").position)

func _process(delta):
	print(path)
	if path.empty():
		path = navigation.get_simple_path(position, pacman.position)
	move_to(path[0],delta)
	path.remove(0)

func move_to(pos, delta):
	var displace = (pos - position).normalized()
	velocity = displace * SPEED
	position += delta * velocity
