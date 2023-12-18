extends Node2D


signal game_over

const Pillar := preload("res://characters/pillar.tscn")
const PILLAR_TIME_SEPARATION := 1.5

var last_time_survived := 0.0
var time_survived := 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_survived += delta
	
	if time_survived > last_time_survived + PILLAR_TIME_SEPARATION:
		add_child(Pillar.instantiate())
		last_time_survived = time_survived


func _on_bird_game_over():
	game_over.emit()
	queue_free()


func init(parent):
	game_over.connect(parent._on_game_over)
