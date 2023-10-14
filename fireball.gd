extends Area2D

var direction = -1
var speed = 200 


func _on_body_entered(body):
	if body.name == "Player":
		body.queue_free()
		queue_free()
		get_tree().change_scene_to_file("res://death_screen.tscn")
	elif body.get_parent().name != get_parent().name:
		queue_free()

func _physics_process(delta):
	var velocity = Vector2.ZERO
	velocity.x += direction
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
