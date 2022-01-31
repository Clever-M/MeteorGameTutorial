extends Node2D

const PRE_LASER = preload("res://scenes/laser.tscn")
var vel = 120

export(NodePath) var lasers

func _ready():
	if lasers:
		lasers = get_node(lasers)
	else:
		lasers = get_parent()

func _process(delta):
	var dirX = 0
	var dirY = 0
	
	
	if Input.is_action_pressed("ui_left"):
		dirX -= 1
	if Input.is_action_pressed("ui_right"):
		dirX += 1
	if Input.is_action_pressed("ui_up"):
		dirY -= 1
	if Input.is_action_pressed("ui_down"):
		dirY += 1

	if Input.is_action_just_pressed("ui_accept"):
		if(get_tree().get_nodes_in_group('lasers').size() < 7):
			var laser = PRE_LASER.instance()
			lasers.add_child(laser)
			laser.global_position = $blaster.global_position
	
	translate(Vector2(dirX, dirY) * vel * delta)
	
	global_position.x = clamp(global_position.x, 21, 139)
	global_position.y = clamp(global_position.y, 25, 266)
