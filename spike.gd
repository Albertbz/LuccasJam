extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		var main = body.get_parent()
		main.kill_player()
		queue_free()
