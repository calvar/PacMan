extends Node2D

onready var intro_music = get_node("Sound/Intro")
onready var small_pill = preload("res://objects/SmallPill.tscn")
onready var value = get_node("GUI/ColorRect/HBoxContainer/Value")
onready var PacMan = get_node("Pacman")

var arr = []
var pills = []

func _ready():
	PacMan.connect("newscore",self,"_on_PacMannewscore")
	pill_positions()
	play_intro()
	value.text = "0"

func _process(delta):
	pass

func pill_positions():
	var file = File.new()
	file.open("res://pac_assets/pill_pos.json", file.READ)
	var text = file.get_as_text()
	var jsn = JSON.parse(text)
	arr = jsn.result
	file.close()
	var cont = 0
	var offx = 12
	var offy = 12
	var map = get_tree().get_root().find_node("Map",true,false)
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

func play_intro():
	intro_music.play()

func _on_PacMannewscore():
	value.text = str(PacMan.score)
