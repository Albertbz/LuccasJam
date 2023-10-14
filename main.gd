extends Node

var karma: int

# Called when the node enters the scene tree for the first time.
func _ready():
	$DeathScreen.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func kill_player():
	print("Player died")
	$Player.kill()
	$TileMap.hide()
	$DeathScreen.show()
	clear_projectiles()
	pause_projectiles()

func respawn_player():
	print("Player respawned")
	$Player.respawn(karma)
	$TileMap.show()
	$DeathScreen.hide()
	un_pause_projectiles()

func clear_projectiles():
	get_tree().call_group("projectiles", "queue_free")

func pause_projectiles():
	get_tree().call_group("projectile_generators", "pause")

func un_pause_projectiles():
	get_tree().call_group("projectile_generators", "un_pause")
