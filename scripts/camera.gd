extends Camera2D

var time = 0
var force = 0
func _ready():
	pass

func _process(delta):
	time += delta * 80
	global_position = Vector2(force,force).rotated(time)

#	if Input.is_action_just_pressed("ui_cancel"):
#		force = 1
	force = lerp(force, 0, .1)
