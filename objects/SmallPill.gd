extends Area2D

onready var main = get_node("/root")

func _on_SmallPill_body_entered(body):
	main.find_node("Pacman",true,false).eat_small_pill()
	var chomp = main.find_node("Chomp",true,false)
	if !chomp.playing:
		chomp.play()
	queue_free()
