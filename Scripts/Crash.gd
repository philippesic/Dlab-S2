extends Node2D

func _ready():
	$Sound1.play()
	$Recomputingtext.visible = false
	$Crash1.visible = false
	$Crash2.visible = true
	yield(get_tree().create_timer(4.5), "timeout")
	$Sound1.stop()
	$Sound2.play()
	$Recomputingtext.visible = true
	$Crash1.visible = true
	$Crash2.visible = false
	yield(get_tree().create_timer(1.7), "timeout")
	get_tree().change_scene("res://Scenes/Title.tscn")
