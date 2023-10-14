extends Node2D

var checkpoint_reached = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("inactive")

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		var main = body.get_parent()
		main.set_checkpoint(position)
		$AnimatedSprite2D.play("active")
