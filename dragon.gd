extends Node2D

var Fireball = preload("res://fireball.tscn")

var direction 
var anim
var fireing = false

var is_paused = false

func _ready():
	anim = get_node("AnimatedSprite2D") 
	if anim.flip_h:
		direction = 1 
	else: 
		direction = -1

func _process(delta):
	if not fireing:
		$AnimatedSprite2D.play("Idle")


func _on_timer_timeout():
	if is_paused:
		return
	
	fireing = true
	$AnimatedSprite2D.play("Fire")
	var newFireball = Fireball.instantiate()
	newFireball.position = Vector2(0,5)
	newFireball.direction = direction
	add_child(newFireball)
	
	await get_tree().create_timer(0.3).timeout
	
	fireing = false
	
func pause():
	is_paused = true

func un_pause():
	is_paused = false
