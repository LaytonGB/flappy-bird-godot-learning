extends Node2D


signal start_pressed


func _on_button_pressed():
	start_pressed.emit()
	queue_free()
	

func init(parent):
	start_pressed.connect(parent._on_start_pressed)
