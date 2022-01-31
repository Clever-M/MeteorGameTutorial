extends Camera2D

var time = 0
var force = 0
func _ready():
	pass

func _process(delta):
	if force > 0:
		time += delta * 80
		global_position = Vector2(force,force).rotated(time)
		force = lerp(force, 0, .1)

func shake(f):
	force = f
