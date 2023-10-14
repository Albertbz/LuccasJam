extends Node2D

var Dart = preload("res://dart.tscn")

var direction 
var anim
var is_paused = false

func _ready():
	anim = get_node("AnimatedSprite2D") 
	if anim.flip_h:
		direction = 1 
	else: 
		direction = -1

func _on_timer_timeout():
	if is_paused:
		return
	
	var newDart = Dart.instantiate()
	var sprite_size = anim.get_sprite_frames().get_frame_texture("default",0).get_width()
	var offset = sprite_size/4 * direction
	newDart.position = Vector2(offset,0)
	newDart.direction = direction
	add_child(newDart)
	
func pause():
	is_paused = true

func un_pause():
	is_paused = false
