extends Node2D

func _ready():
	$ErrorSound.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Scenes/Level2.tscn")
	queue_free()
