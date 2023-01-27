extends Node2D


func _ready():
	yield(get_tree().create_timer(30), "timeout")
	get_tree().change_scene("res://Scenes/Crash.tscn")
	queue_free()
