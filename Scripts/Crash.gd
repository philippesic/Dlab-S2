extends Node2D

func _ready():
	$Sound1.play()
	yield(get_tree().create_timer(4.5), "timeout")
	$Sound1.stop()
	$Sound2.play()
	$Crash2.visible = false
	yield(get_tree().create_timer(1.7), "timeout")
	get_tree().change_scene("res://Scenes/Title.tscn")
