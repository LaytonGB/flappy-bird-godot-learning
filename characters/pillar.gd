extends StaticBody2D


const MAX_Y := 235.0
const SCREEN_WIDTH := 550

@export var speed := 4.0


# Called when the node enters the scene tree for the first time.
func _ready():
	var y_pos := randf_range(-MAX_Y, MAX_Y)
	global_position = Vector2(550.0, y_pos)


func _process(delta):
	var x = global_position.x
	var y = global_position.y
	global_position = Vector2(x - speed * delta * 60, y)
	
	if x < -50.0:
		queue_free()
