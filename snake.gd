extends CharacterBody2D


var chase = false
var speed = 50

var player = null

func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	
	if player != null and chase:
		print(player.position.x)
		print(position.x)
		var direction = sign(player.position.x - position.x)
		if is_on_floor():
			velocity.x = direction * speed
		else:
			velocity.x = 0
	else:
		velocity.x = 0
	
	move_and_slide()


func _on_player_locator_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.play("bite")
		player = body
		chase = true


func _on_player_locator_body_exited(body):
	if body.name == "Player":
		$AnimatedSprite2D.play("idle")
		chase = false


func _on_hurt_player_body_entered(body):
	if body.name == "Player":
		var main = body.get_parent()
		main.kill_player()
