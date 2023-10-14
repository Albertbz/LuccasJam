extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -775.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var current_anim_sprite
var current_coll_shape
var can_jump
var can_climb
var is_climbing = false

var is_dead = false

func _ready():
	set_evolution("snail")
	enable_current_evolution()

func _physics_process(delta):
	if is_dead:
		return
	# Add the gravity.
	if not is_on_floor() and not is_climbing:
		velocity.y += gravity * delta

	# Handle Jump.
	if can_jump and Input.is_action_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle climb.
	if can_climb and is_in_climbable_tile():
		is_climbing = true
		if Input.is_action_pressed("move_up"):
			velocity.y = -SPEED
		elif Input.is_action_pressed("move_down"):
			velocity.y = SPEED
		else:
			velocity.y = 0
	elif can_climb and not is_in_climbable_tile():
		is_climbing = false
	
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Use velocity to figure out animation.
	if velocity.y < 0:
		current_anim_sprite.animation = "up"
	elif velocity.y > 0:
		current_anim_sprite.animation = "fall"
	elif velocity.x != 0:
		current_anim_sprite.animation = "walk"
		current_anim_sprite.flip_h = velocity.x < 0
	else:
		current_anim_sprite.animation = "idle"
		
	current_anim_sprite.play()

	move_and_slide()

func enable_current_evolution():
	current_anim_sprite.set_visible(true)
	current_coll_shape.set_deferred("disabled", false)

func set_evolution(new_evolution):
	match new_evolution:
		"monkey":
			current_anim_sprite = $MonkeyAnimation
			current_coll_shape = $MonkeyCollision
			can_jump = true
			can_climb = false
		"snail":
			current_anim_sprite = $SnailAnimation
			current_coll_shape = $SnailCollision
			can_jump = false
			can_climb = true

func is_in_climbable_tile():
	var res = false
	var tilemap = get_parent().get_node("TileMap")
	var coords = (position / 128).floor()
	var tile_data = tilemap.get_cell_tile_data(0, coords)
	if tile_data:
		res = tile_data.get_custom_data("climbable")
	return res

func update_evolution(karma):
	if karma >= 0:
		set_evolution("monkey")
	elif karma < 0:
		set_evolution("snail")
	enable_current_evolution()
	
func kill():
	position = Vector2(0, -32)
	hide()
	is_dead = true
	
func respawn(karma):
	update_evolution(karma)
	show()
	is_dead = false
