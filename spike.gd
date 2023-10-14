extends StaticBody2D

func _on_death_zone_body_entered(body):
	if body.name == "Player":
		var main = body.get_parent()
		main.kill_player()
