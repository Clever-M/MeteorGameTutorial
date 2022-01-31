extends Node2D

const PRE_ASTEROID =  preload("res://scenes/asteroid.tscn")

export(NodePath) var ship

func _ready():
	restartTimer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var asteroid = PRE_ASTEROID.instance()
	add_child(asteroid)
	asteroid.global_position = Vector2(rand_range(40, 120), -60)
	
func restartTimer():
	$spawn_timer.wait_time = rand_range(.05, 1)
	$spawn_timer.start()
