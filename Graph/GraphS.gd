extends Node

var Edges = []
var Nodes = []

func _ready():
	var file = File.new()
	file.open("res://Graph/edges.json", file.READ)
	var text = file.get_as_text()
	var jsn = JSON.parse(text)
	Edges = jsn.result
	file.close()
	file.open("res://Graph/nodes.json", file.READ)
	text = file.get_as_text()
	jsn = JSON.parse(text)
	Nodes = jsn.result
	file.close()
	
	var pac = Vector2(Nodes[0][0], Nodes[0][1])
	print(Nodes[18])
	
	print(nextNode(pac, 4))
	

func findNeighbours(index):
	var neighbours = []
	for i in Edges:
		if i[0] == index:
			neighbours.append([i[1],i[2]])
		elif i[1] == index:
			neighbours.append([i[0],i[2]])
	return neighbours

func nextNode(pacman_pos, index):
	var n = findNeighbours(index)
	var minWeight = 1e10
	var minId = 0
	for i in n:
		var node_pos = Vector2(Nodes[i[0]-1][0], Nodes[i[0]-1][1])
		var distance = node_pos.distance_to(pacman_pos)
		var weight = distance + i[1]
		if weight < minWeight:
			minWeight = weight
			minId = i[0]
	return [minId, minWeight]



