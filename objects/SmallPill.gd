extends Area2D



func _on_SmallPill_body_entered(body):
	get_node("/root").find_node("Pacman",true,false).eat_small_pill()
	queue_free()
