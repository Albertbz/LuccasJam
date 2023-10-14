extends Area2D

var direction = -1
var speed = 200 


func _on_body_entered(body):
	if body.name == "Player":
		var main = body.get_parent()
		main.kill_player()
		queue_free()
	elif body.get_parent().name != get_parent().name:
		queue_free()

func _physics_process(delta):
	var velocity = Vector2.ZERO
	velocity.x += direction
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
