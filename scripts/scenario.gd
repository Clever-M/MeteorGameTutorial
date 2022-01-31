extends Node2D

export(NodePath) var ship

func _ready():
	if ship:
		ship = get_node(ship)
	else:
		set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x = -(ship.global_position.x - 80) * 0.32 # 0.001 rate times screen size (160px)
