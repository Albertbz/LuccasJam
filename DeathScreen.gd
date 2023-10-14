extends Node2D


func _on_get_reborn_pressed():
	var main = get_parent()
	main.respawn_player()

