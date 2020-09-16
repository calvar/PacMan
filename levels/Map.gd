extends Node2D

onready var small_pill = preload("res://objects/SmallPill.tscn")

func _ready():
	var spill = small_pill.instance()
	spill.position = Vector2(13,13)
	var map = get_tree().get_root().find_node("Map",true,false)
	map.add_child(spill)
