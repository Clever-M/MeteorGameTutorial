extends Node2D

var chosen = 0
onready var velY = rand_range(30, 200)
onready var velX = rand_range(-60, 60)
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for a in $asteroids.get_children():
		a.visible = false
	
	chosen = (randi() % $asteroids.get_child_count()) + 1
	var node = get_node("asteroids/Asteroid-" + str(chosen))
	node.visible = true
	$area/shape.shape.radius = node.texture.get_width() / 2
	
func _process(delta):
	translate(Vector2(velX, velY) * delta)
	
	if global_position.x > 200.0:
		global_position.x = -20
	if global_position.x < -20:
		global_position.x = 200
	if global_position.y > 300:
		queue_free()

func _on_area_area_entered(area):
	get_tree().call_group('camera', 'shake', 1)
	queue_free()
