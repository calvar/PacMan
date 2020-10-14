extends Node

var arr = []

func _ready():
	var file = File.new()
	file.open("res://Graph/edges.json", file.READ)
	var text = file.get_as_text()
	var jsn = JSON.parse(text)
	arr = jsn.result
	file.close()
	print(arr)
