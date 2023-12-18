extends Node2D


signal game_over


func _on_character_body_2d_died():
	game_over.emit()
