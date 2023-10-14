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

func respawn_player():
	print("Player respawned")
	$Player.respawn(karma)
	$TileMap.show()
	$DeathScreen.hide()
