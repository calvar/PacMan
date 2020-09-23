extends Node2D

onready var small_pill = preload("res://objects/SmallPill.tscn")
var arr = []
var pills = []

func _ready():
	var map = get_tree().get_root().find_node("Map",true,false)
	pill_positions()
	var cont = 0
	var offx = 12
	var offy = 12
	for i in range(len(arr)):
		for j in range(len(arr[i])):
			if(arr[i][j] == 1):
				pills.append(small_pill.instance())
				pills[cont].global_position = Vector2(offx+j*8,offy+i*8)
				#print(pills[cont].global_position)
				map.add_child(pills[cont])
				cont += 1
	offx = 212
	offy = 12
	for i in range(len(arr)):
		for j in range(len(arr[i])):
			if(arr[i][j] == 1):
				pills.append(small_pill.instance())
				pills[cont].global_position = Vector2(offx-j*8,offy+i*8)
				#print(pills[cont].global_position)
				map.add_child(pills[cont])
				cont += 1

func pill_positions():
	var file = File.new()
	file.open("res://pac_assets/pill_pos.json", file.READ)
	var text = file.get_as_text()
	var jsn = JSON.parse(text)
	arr = jsn.result
