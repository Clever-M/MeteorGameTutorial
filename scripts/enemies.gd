extends Node2D

const PRE_ASTEROID =  preload("res://scenes/asteroid.tscn")
const PRE_EXPLOSION = preload("res://scenes/explosion.tscn")

export(NodePath) var ship

func _ready():
	restartTimer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var asteroid =  create_asteroid()
	add_child(asteroid)
	asteroid.global_position = Vector2(rand_range(40, 120), -60)
	
func restartTimer():
	$spawn_timer.wait_time = rand_range(.05, 1)
	$spawn_timer.start()

func on_asteroid_destroyed(asteroid):
	if(asteroid.chosen  >= 3):
		for i in range(randi() % 3 + 1):
			var new_asteroid =  create_asteroid()
			new_asteroid.chosen = (randi() % 2) + 1
			add_child(new_asteroid)
			new_asteroid.global_position = asteroid.global_position
		
	var explosion = PRE_EXPLOSION.instance()
	add_child(explosion)
	explosion.global_position = asteroid.global_position

func create_asteroid():
	var asteroid = PRE_ASTEROID.instance()
	asteroid.connect("destroyed", self, "on_asteroid_destroyed")
	return asteroid
