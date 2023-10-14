extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		body.queue_free()
		queue_free()
		get_tree().change_scene_to_file("res://death_screen.tscn")
