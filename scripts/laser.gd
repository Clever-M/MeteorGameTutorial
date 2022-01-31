extends Node2D

var vel = 300

func _ready():
	pass # Replace with function body.

func _process(delta):
	translate(Vector2(0, -1) * vel * delta)
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_area_area_entered(area):
	queue_free()
