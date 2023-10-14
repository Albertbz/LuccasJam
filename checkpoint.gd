extends Node2D

var checkpoint_reached = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("inactive")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		var main = body.get_parent()
		main.set_checpoint(position)
		$AnimatedSprite2D.play("active")
