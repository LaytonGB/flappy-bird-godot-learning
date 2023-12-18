extends Node


var play_scene: Node
var menu: Node


func _ready():
	create_menu()


func _on_start_pressed():
	play_scene = preload("res://scenes/playing.tscn").instantiate()
	add_child(play_scene)
	play_scene.init(self)


func _on_game_over():
	create_menu()


func create_menu():
	menu = preload("res://scenes/menu.tscn").instantiate()
	add_child(menu)
	menu.init(self)
